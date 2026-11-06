# Before-and-after Pilot Metrics

Fill only measured values. Leave missing data blank or write `unavailable` with
a reason. This sheet contains no example results or promised improvements.

## Pilot conditions

| Field | Value |
| --- | --- |
| Pilot repository | {{PILOT_REPO_NAME}} |
| Owner | {{MEASUREMENT_OWNER}} |
| Before period | {{BEFORE_START_AND_END}} |
| After period | {{AFTER_START_AND_END}} |
| Task set and sample size | {{TASK_SET_AND_SAMPLE_SIZE}} |
| Cohort and supported clients | {{COHORT_AND_CLIENT_VERSIONS}} |
| Models and modes | {{MODELS_AND_MODES}} |
| Context/LSP changes | {{CHANGES_AND_COMMIT_IDS}} |
| Telemetry gaps or other changes | {{LIMITATIONS}} |

## Results

| Measure | Before | After | Source and scope |
| --- | --- | --- | --- |
| Copilot active users in the agreed cohort | {{BEFORE}} | {{AFTER}} | {{USAGE_EXPORT_AND_SCOPE}} |
| Copilot requests for the agreed modes | {{BEFORE}} | {{AFTER}} | {{USAGE_EXPORT_AND_SCOPE}} |
| AI Credits consumed | {{BEFORE}} | {{AFTER}} | {{AUTHORISED_REPORT_AND_ATTRIBUTION}} |
| Completed pilot tasks / attempted tasks | {{BEFORE}} | {{AFTER}} | {{TASK_LOG}} |
| Median task completion time | {{BEFORE}} | {{AFTER}} | {{TIMED_RUNS}} |
| Correct callers found / known callers | {{BEFORE}} | {{AFTER}} | {{MANUALLY_CHECKED_REFERENCE_SET}} |
| Renames passing tests / attempted renames | {{BEFORE}} | {{AFTER}} | {{TEST_LOG}} |
| Human corrections per task | {{BEFORE}} | {{AFTER}} | {{REVIEW_LOG}} |

## Interpretation

Keep the task set, cohort, time windows and model choices comparable. Record
setup/indexing time separately from repeated task time. Use the same metric
definition and export source for both periods.

Ask the authorised owner to confirm AI Credit report scope. Do not assign
organisation-wide consumption to a pilot repo unless the available evidence
supports that attribution. Usage, acceptance and credits are not correctness
measures or proof of causation; use tests and review alongside them.

| Decision | Evidence |
| --- | --- |
| Keep, revise or remove the change | {{DECISION_AND_REASON}} |
| Confounders and missing data | {{CAVEATS}} |
| Next review date | {{REVIEW_DATE}} |

See the [measurement sources](../docs/references.md#ownership-and-measurement).
