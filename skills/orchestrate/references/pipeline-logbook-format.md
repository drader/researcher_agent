# Pipeline Logbook Format

The pipeline-logbook is the orchestrator's single persistent state file. This
document is the schema reference and the operations reference. Anything
that survives a session boundary lives in the pipeline-logbook; nothing else
the orchestrator does is persistent.

The schema described here is version 1. Version increments are
documented in the migration policy section.

---

## File location and lifecycle

- **Default path.** `.claude/pipeline-logbook.json` under the
  user's project working directory.
- **Override.** The user may supply an alternate path when starting a
  pipeline. The override is honored for the lifetime of that pipeline;
  resuming requires invoking the orchestrator with the same path or
  letting it default-discover.
- **One active pipeline-logbook per path.** The orchestrator does not maintain
  multiple concurrent pipelines in the same path. Multiple pipelines
  in the same project use distinct paths.
- **Archival.** On abandon, the pipeline-logbook is renamed with an
  `.archived-<timestamp>.json` suffix. Archived pipeline-logbooks are read-only
  records; the orchestrator does not resume from them.
- **Encoding.** UTF-8, JSON. Human-readable; line breaks and indentation
  are preserved in writes so manual inspection is comfortable.

---

## Top-level schema (v1)

| Field                   | Type        | Required | Description                                                                 |
|-------------------------|-------------|----------|-----------------------------------------------------------------------------|
| `schema_version`        | integer     | yes      | Currently `1`. Used by migration logic.                                     |
| `pipeline_id`           | string      | yes      | Short slug plus creation timestamp, e.g. `synesthesia-loihi-20260521T134522Z`. |
| `created_at`            | string      | yes      | ISO 8601 timestamp of pipeline creation.                                    |
| `updated_at`            | string      | yes      | ISO 8601, refreshed on every write.                                         |
| `working_directory`     | string      | yes      | Absolute path to the user's project directory.                              |
| `current_stage`         | string      | yes      | Name of the next stage to run, or the stage that is mid-execution.          |
| `current_stage_status`  | string      | yes      | One of `pending`, `in-progress`, `awaiting-checkpoint`.                     |
| `completed_stages`      | array       | yes      | Ordered list of stage records. Empty array at pipeline start.                |
| `pending_checkpoints`   | array       | yes      | Mandatory gates reached but not resolved. Typically 0 or 1 entry.            |
| `user_parameters`       | object      | yes      | User-supplied parameters that persist across stages.                        |
| `artifact_manifest`     | array       | yes      | Cumulative artifact records.                                                |
| `pending_decisions`     | array       | yes      | User choices required (e.g., failure resolution menu).                      |
| `archived`              | boolean     | yes      | `false` during active use; `true` once archived.                            |
| `notes`                 | string      | no       | Free-text notes the user attaches.                                          |

### `user_parameters` sub-fields

The `user_parameters` object accumulates user choices that affect more
than one stage. Suggested fields, all optional unless noted:

- `target_venue` (string): name of the publication venue, e.g.
  "Neuromorphic Computing and Engineering".
- `citation_style` (string): "APA 7", "Chicago author-date", "Vancouver",
  etc.
- `length_target_words` (integer): approximate manuscript word count.
- `language` (string): "en", "tr", etc.
- `disclosure_required` (boolean): whether Stage 10 must run.
- `stage_2_mode` (string): `brief` or `full`.
- `stage_3_mode` (string): `systematic`, `annotate`, or `skip`.
- `skip_elections` (array of strings): stage names the user elected
  to skip up-front.

The orchestrator does not invent values for these. Each one is either
present because the user supplied it or absent because the user has
not yet been asked.

### Stage record schema

Each entry in `completed_stages`:

| Field                   | Type        | Required | Description                                                  |
|-------------------------|-------------|----------|--------------------------------------------------------------|
| `stage_number`          | integer     | yes      | 1 through 10.                                                |
| `stage_name`            | string      | yes      | `scope`, `lit-search`, `synthesis`, `outline`, `draft`, `self-critique`, `revise`, `citation-audit`, `finalize-format`, `disclosure`. |
| `skill`                 | string      | yes      | `research`, `compose`, or `critique`.                         |
| `mode`                  | string      | yes      | The mode that was invoked.                                   |
| `start_ts`              | string      | yes      | ISO 8601.                                                    |
| `end_ts`                | string      | yes      | ISO 8601.                                                    |
| `elapsed_seconds`       | integer     | yes      | Derived; persisted for convenience.                          |
| `artifact_paths`        | array of strings | yes | Paths to the artifacts produced.                              |
| `input_hash`            | string      | yes      | Hash of the principal inputs to this stage.                  |
| `checkpoint_outcome`    | string      | yes      | `approved`, `edited`, `rejected-rerun`, or `not-applicable`. |
| `completion_method`     | string      | yes      | `framework` or `external`.                                   |
| `notes`                 | string      | no       | Free-text notes from the gate.                               |
| `superseded`            | boolean     | no       | `true` if this stage record was truncated by a reset-to-stage operation but kept for traceability. |

### Artifact record schema

Each entry in `artifact_manifest`:

| Field                | Type    | Required | Description                                       |
|----------------------|---------|----------|---------------------------------------------------|
| `path`               | string  | yes      | Absolute path to the artifact file.                |
| `size_bytes`         | integer | yes      | File size at the time of recording.                |
| `produced_by_stage`  | integer | yes      | Stage number that produced this artifact.          |
| `kind`               | string  | yes      | Short descriptor: `scope-summary`, `lit-report`, `outline`, `draft`, `critique-report`, `revision`, `audit-report`, `final-manuscript`, `disclosure`, etc. |
| `superseded`         | boolean | no       | `true` if produced by a stage that was later truncated. |

### Pending-checkpoint record schema

Each entry in `pending_checkpoints` (typically zero or one entry):

| Field                    | Type   | Required | Description                                                          |
|--------------------------|--------|----------|----------------------------------------------------------------------|
| `gate_number`            | integer| yes      | 1 through 6.                                                         |
| `after_stage_number`     | integer| yes      | The stage that just completed.                                       |
| `presented_at`           | string | yes      | ISO 8601 timestamp when the checkpoint prompt was last shown.        |
| `revision_passes`        | integer| yes      | 0, 1, or 2 — how many revision passes have been applied so far.       |
| `pending_edits`          | array  | no       | User-supplied edits awaiting application by the underlying skill.    |

### Pending-decision record schema

Each entry in `pending_decisions`:

| Field           | Type   | Required | Description                                                       |
|-----------------|--------|----------|-------------------------------------------------------------------|
| `decision_id`   | string | yes      | Short slug naming the decision (e.g., `stage-2-too-few-sources`). |
| `description`   | string | yes      | One sentence stating the choice to be made.                        |
| `options`       | array  | yes      | Short option labels the user picks among.                          |
| `raised_at`     | string | yes      | ISO 8601 timestamp.                                                |
| `raised_by`     | string | yes      | Sub-agent that raised the decision (e.g., `gap-detector`).         |

---

## Operations

The `state-persistor` exposes the following operations to the rest of
the orchestrator. No other sub-agent writes the file.

### read

Read the pipeline-logbook from disk, parse, validate against the schema.
Return the parsed object. On parse failure, return an error with line
and column. Do not overwrite or repair on read.

### append-stage

Append a new stage record to `completed_stages`. Update `updated_at`,
`current_stage`, and `current_stage_status`. Add any artifact records
produced by the stage to `artifact_manifest`. Write atomically.

### update-checkpoint

Record the resolution of a mandatory checkpoint: set the relevant
stage record's `checkpoint_outcome`, remove the entry from
`pending_checkpoints`, refresh `updated_at`. Write atomically.

### record-decision

Add a new entry to `pending_decisions` when a sub-agent raises a
choice that requires the user. Write atomically.

### resolve-decision

Remove a `pending_decisions` entry when the user has answered.
Optionally record the chosen option in `notes` of the relevant stage
record. Write atomically.

### update-parameter

Add or update a field in `user_parameters`. Write atomically.

### reset-to-stage

Truncate `completed_stages` to the prefix ending before the named
stage. Mark truncated artifact-manifest entries as `superseded: true`
rather than removing them. Set `current_stage` to the named stage and
`current_stage_status` to `pending`. Write atomically. Do not delete
artifact files from disk.

### archive

Set `archived: true`, refresh `updated_at`, then rename the file with
the `.archived-<timestamp>.json` suffix. Return the new path.

### validate

Run schema validation against the in-memory representation. Used
defensively before every write.

---

## Atomic-write protocol

The pipeline-logbook is the orchestrator's only durable state. A corrupted
pipeline-logbook at the wrong moment loses a long-running collaboration. The
write protocol prevents corruption from interrupted writes:

1. Compose the new JSON in memory.
2. Run schema validation. If invalid, abort and report to the caller.
   Do not touch the on-disk file.
3. Write the JSON to a temp path adjacent to the pipeline-logbook:
   `<pipeline-logbook-path>.tmp-<pid>-<ts>`.
4. fsync the temp file.
5. Rename the temp file to the pipeline-logbook path. On POSIX filesystems
   the rename is atomic, yielding either the new state or the prior
   valid state, never a partial file.
6. Report success to the caller.

On read, if a `*.tmp-*` file is found adjacent to the pipeline-logbook, the
state-persistor does not auto-delete or auto-recover. It reports the
anomaly. The orchestrator then asks the user how to proceed: keep the
existing pipeline-logbook (and delete the temp file), recover from the temp
file (acknowledging that the prior session may have crashed
mid-write), or inspect both manually.

---

## Reserved fields

The schema reserves the following keys for future use. Implementations
must preserve them on read even if they are not understood:

- `extensions` (object): per-skill or per-project extension data that
  does not fit elsewhere in the schema. Free-form, but keyed by a
  string identifier so consumers can detect what they recognize.
- `signatures` (array): reserved for future provenance signatures.
  Implementations ignore this field in v1.

Unknown top-level fields are preserved on read and rewritten on write
("read-modify-write" semantics) so a pipeline-logbook touched by a newer
implementation does not lose data when an older implementation
rewrites it. The schema-version check determines whether the
implementation should attempt to interpret unknown fields or pass
them through unchanged.

---

## Schema versioning policy

The pipeline-logbook's `schema_version` is an integer. Increments are
backward-incompatible changes; backward-compatible additions do not
increment the version.

Migration logic lives in the `state-persistor`'s implementation. When
the on-disk version is older than the implementation's version, the
state-persistor runs the documented migration before any other
operation. When the on-disk version is newer than the implementation
recognizes, the state-persistor halts and reports; it does not guess.

### v0 → v1

Not applicable. Version 1 is the initial documented schema.

### Future migrations

Each future migration must document:

- The change to the schema.
- The transformation applied to existing pipeline-logbooks.
- Whether the migration is reversible (most are not).
- Any user prompt required before the migration runs (a non-reversible
  migration to a long-running pipeline-logbook should require explicit user
  consent before overwriting the file).

---

## User-side inspection

The pipeline-logbook is human-readable JSON. The user may open it in any text
editor, inspect it, and — if necessary — edit it manually. Manual edits
are at the user's own risk; the orchestrator validates on next read
and reports any schema violation.

Common reasons a user might inspect manually:

- Checking the artifact manifest before sharing the project.
- Confirming the user-parameter values are what they intended.
- Recovering from a temp-file anomaly without the orchestrator's help.
- Renaming `pipeline_id` to a more memorable slug.

Common reasons not to edit manually:

- Reordering `completed_stages`. The list is ordinally meaningful.
- Hand-editing checkpoint outcomes to skip a gate. The orchestrator
  will detect inconsistencies on the next read.
- Removing artifact records to "clean up." Records remain even when
  superseded; that is by design.
