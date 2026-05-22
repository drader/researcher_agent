# Pipeline Logbook Skeleton

This is the on-disk shape of a fresh pipeline-logbook at pipeline creation,
plus an example showing how it evolves after several stages have
completed. JSON does not natively support comments; per-field notes
appear as `// note:` lines outside the JSON block.

The `state-persistor` sub-agent is the only writer of this file in
practice. The schema is documented in `references/pipeline-logbook-format.md`.

---

## Fresh pipeline-logbook (just-created pipeline)

```json
{
  "schema_version": 1,
  "pipeline_id": "{{slug}}-{{YYYYMMDDTHHMMSSZ}}",
  "created_at": "{{ISO8601_TIMESTAMP}}",
  "updated_at": "{{ISO8601_TIMESTAMP}}",
  "working_directory": "{{ABSOLUTE_PATH_TO_PROJECT}}",
  "current_stage": "scope",
  "current_stage_status": "pending",
  "completed_stages": [],
  "pending_checkpoints": [],
  "user_parameters": {
    "target_venue": "{{venue_name_or_null}}",
    "citation_style": "{{style_or_null}}",
    "length_target_words": null,
    "language": "{{language_code}}",
    "disclosure_required": true,
    "stage_2_mode": null,
    "stage_3_mode": null,
    "skip_elections": []
  },
  "artifact_manifest": [],
  "pending_decisions": [],
  "archived": false,
  "notes": ""
}
```

// note: `schema_version` is the integer version of this schema. v1
// is the initial released version. State-persistor refuses to read
// a pipeline-logbook whose schema_version it does not recognize.

// note: `pipeline_id` is a short slug followed by the creation
// timestamp in compact ISO 8601 form. The slug is derived from the
// research question and should not collide between projects.

// note: `working_directory` is absolute so a relocated pipeline-logbook
// still identifies its project unambiguously.

// note: `current_stage` and `current_stage_status` together describe
// where the orchestrator will pick up on next invocation. Valid
// statuses are `pending`, `in-progress`, `awaiting-checkpoint`.

// note: `user_parameters` accumulates the user's choices as they are
// made. Fields can be null until the user has been asked.

// note: `disclosure_required` defaults to true. The user must
// explicitly elect to drop it.

// note: `archived` flips to true only when the user abandons the
// pipeline. The file is then renamed with `.archived-<timestamp>.json`.

---

## Mid-pipeline pipeline-logbook (after Stage 4 with Gate 3 pending)

```json
{
  "schema_version": 1,
  "pipeline_id": "synesthesia-loihi-20260521T091500Z",
  "created_at": "2026-05-21T09:15:00Z",
  "updated_at": "2026-05-21T16:42:18Z",
  "working_directory": "{{ABSOLUTE_PATH_TO_PROJECT}}",
  "current_stage": "draft",
  "current_stage_status": "awaiting-checkpoint",
  "completed_stages": [
    {
      "stage_number": 1,
      "stage_name": "scope",
      "skill": "research",
      "mode": "socratic",
      "start_ts": "2026-05-21T09:15:00Z",
      "end_ts": "2026-05-21T10:34:50Z",
      "elapsed_seconds": 4790,
      "artifact_paths": ["{{PROJECT}}/scope-summary.md"],
      "input_hash": "{{hash_of_user_initial_prompt}}",
      "checkpoint_outcome": "approved",
      "completion_method": "framework",
      "notes": ""
    },
    {
      "stage_number": 2,
      "stage_name": "lit-search",
      "skill": "research",
      "mode": "full",
      "start_ts": "2026-05-21T11:00:00Z",
      "end_ts": "2026-05-21T15:10:12Z",
      "elapsed_seconds": 15012,
      "artifact_paths": ["{{PROJECT}}/lit-report.md"],
      "input_hash": "{{hash_of_scope_summary}}",
      "checkpoint_outcome": "not-applicable",
      "completion_method": "framework",
      "notes": ""
    },
    {
      "stage_number": 3,
      "stage_name": "synthesis",
      "skill": "research",
      "mode": "annotate",
      "start_ts": "2026-05-21T15:20:00Z",
      "end_ts": "2026-05-21T16:05:33Z",
      "elapsed_seconds": 2733,
      "artifact_paths": ["{{PROJECT}}/annotated-bib.md"],
      "input_hash": "{{hash_of_lit_report}}",
      "checkpoint_outcome": "approved",
      "completion_method": "framework",
      "notes": "User added two sources by hand during the edit pass."
    },
    {
      "stage_number": 4,
      "stage_name": "outline",
      "skill": "compose",
      "mode": "outline",
      "start_ts": "2026-05-21T16:10:00Z",
      "end_ts": "2026-05-21T16:42:18Z",
      "elapsed_seconds": 1938,
      "artifact_paths": [
        "{{PROJECT}}/outline.md",
        "{{PROJECT}}/evidence-map.md"
      ],
      "input_hash": "{{hash_of_annotated_bib}}",
      "checkpoint_outcome": "pending",
      "completion_method": "framework",
      "notes": ""
    }
  ],
  "pending_checkpoints": [
    {
      "gate_number": 3,
      "after_stage_number": 4,
      "presented_at": "2026-05-21T16:42:18Z",
      "revision_passes": 0,
      "pending_edits": []
    }
  ],
  "user_parameters": {
    "target_venue": "Neuromorphic Computing and Engineering",
    "citation_style": "Vancouver",
    "length_target_words": 6500,
    "language": "en",
    "disclosure_required": true,
    "stage_2_mode": "full",
    "stage_3_mode": "annotate",
    "skip_elections": []
  },
  "artifact_manifest": [
    {
      "path": "{{PROJECT}}/scope-summary.md",
      "size_bytes": 4218,
      "produced_by_stage": 1,
      "kind": "scope-summary"
    },
    {
      "path": "{{PROJECT}}/lit-report.md",
      "size_bytes": 41207,
      "produced_by_stage": 2,
      "kind": "lit-report"
    },
    {
      "path": "{{PROJECT}}/annotated-bib.md",
      "size_bytes": 27914,
      "produced_by_stage": 3,
      "kind": "annotated-bibliography"
    },
    {
      "path": "{{PROJECT}}/outline.md",
      "size_bytes": 6892,
      "produced_by_stage": 4,
      "kind": "outline"
    },
    {
      "path": "{{PROJECT}}/evidence-map.md",
      "size_bytes": 3450,
      "produced_by_stage": 4,
      "kind": "evidence-map"
    }
  ],
  "pending_decisions": [],
  "archived": false,
  "notes": ""
}
```

// note: `completed_stages` is an ordered list; the orchestrator
// reads it in array order, not by stage number, so a corrupted
// ordering is detectable.

// note: A `pending_checkpoints` entry with `revision_passes: 0`
// means the artifact has been presented but not yet edited. A
// `revision_passes` value of 2 means the next outcome will either
// be a final approval or a reset to a prior stage (the loop bound).

// note: `checkpoint_outcome: "pending"` on a stage record means the
// gate after it is still active. The matching entry in
// `pending_checkpoints` carries the gate's own state.

// note: Stages 2, 5, 7, and 10 carry `checkpoint_outcome:
// "not-applicable"` because no mandatory gate sits after them.

// note: `input_hash` is the hash of the principal inputs to the
// stage. On resume, the orchestrator compares the hash of the
// current upstream artifact against this stored hash; a mismatch
// indicates the upstream changed and warns the user.

// note: `completion_method: "external"` would mark a stage that the
// user supplied an artifact for rather than running through the
// framework. The artifact_paths field then points to the
// user-supplied file.

// note: `superseded: true` would appear on stage records and
// artifact records that were truncated by a reset-to-stage
// operation. They remain in the pipeline-logbook for traceability.
