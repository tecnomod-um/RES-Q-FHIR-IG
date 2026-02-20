# Guidance - v1.0.0

* [**Table of Contents**](toc.md)
* **Guidance**

## Guidance

This page provides practical guidance and conventions to implement the Stroke Care IG consistently.

### Design Conventions

* **Minimal but sufficient** profiles focused on key stroke indicators and reporting.
* Prefer **standard** codes (SNOMED CT, LOINC, UCUM). Use local codes only when no appropriate standard exists; map via `ConceptMap` when local codes are used.
* Keep **time-critical** events (Door, Imaging, Needle, Groin puncture, Recanalization) as `Observation` with timing context and/or offsets where applicable.

### Terminology reuse

* **SNOMED CT** for clinical concepts including observations and measurements.
* **UCUM** for units.

### Data Absent / Unknown

* When data are unknown or not captured, use appropriate **data-absent-reason** patterns: 
* For **codeable** elements, use a concept from an “absent/unknown” VS when provided by this IG (e.g., IPS absent/unknown).
* For **quantities/strings**, consider the `data-absent-reason` extension if appropriate.
 
* Do **not** invent local placeholder codes when a standard absent/unknown pattern exists.

### Dates, Times, and Time Zones

* Use **FHIR R5** date/time types according to the profile (e.g., `dateTime`, `Period`).
* Include timezone offsets where relevant to clinical interpretation.

### Identifiers and References

* Use stable, resolvable **references** (`Reference`) for `subject`, `encounter`, and relationships across resources.
* Align identifiers with institutional or national registries where available.

### Profiles Overview

* **Encounter:** Admission, class = inpatient, period, admit/discharge info, extensions (first hospital, initial care intensity, etc.).
* **Observation:** Vital signs, functional scores (mRS/NIHSS), timing metrics (D2N/D2G), stroke circumstances, age at onset.
* **Procedure:** Brain imaging, carotid imaging, thrombolysis/thrombectomy, swallow screening; status and timing context extensions.
* **Condition:** Final stroke diagnosis, risk factors, bleeding reason, ischemic etiology; onset date/time extensions as defined.
* **MedicationRequest/MedicationStatement:** Discharge meds and prior meds (adherence).

Refer to **Profiles** and **Terminology** sections for details and bindings.

### Validation & Testing

* Validate resources with the **FHIR Validator** against this IG’s `package.tgz`.
* Ensure **invariants** and **Must Support** elements are satisfied.
* Use **Examples** as implementation patterns.

### Versioning & History

* See **Change Log** for the version list and release notes.
* Breaking changes will be documented in the release notes.

