---
title: General Principles
layout: default
---

# General Principles

### Purpose of this Implementation Guide

This Implementation Guide (IG) provides a HL7® FHIR® R5 interoperability specification to support the exchange of stroke-related data captured through the [RES-Q Stroke Registry](https://stroke.qualityregistry.org/) form workflow. The main objective is to represent the RES-Q Stroke Registry dataset as a consistent, computable, and reusable set of FHIR artifacts (profiles, extensions, CodeSystems, ValueSets, invariants, and examples) so that participating hospitals and systems can submit, validate, and analyze stroke registry data in a harmonized way.

This IG is designed for:
- registry submission and cross-site comparability,
- quality improvement and key performance indicator (KPI) monitoring,
- secondary use for reporting and research,
- integration between EHRs, stroke unit systems, and registry tooling.

### Scope and Non-Goals

#### In scope
This IG covers the data elements needed to represent common RES-Q Stroke Registry stroke workflow concepts, including:
- **Episode anchoring** via the index stroke hospital admission (`Encounter`).
- **Definitive diagnosis** and **stroke-related risk factors** (`Condition`).
- **Key stroke procedures** (brain imaging, carotid imaging, reperfusion procedures, swallow screening) (`Procedure`).
- **Key observations** (vital signs, functional outcome scores, severity scores, timing metrics, onset circumstances, selected findings) (`Observation`).
- **Medications**
  - discharge prescriptions (`MedicationRequest`),
  - prior/home medication use with adherence (`MedicationStatement`).

#### Out of scope (explicit non-goals)
- Full clinical documentation of stroke care beyond the RES-Q Stroke Registry minimum dataset (e.g., comprehensive imaging study modeling or device-level thrombectomy details).
- National drug dictionaries or product-level medication normalization policies (e.g., RxNorm or country-specific medicinal products), unless adopted by an implementation.
- Item-level NIHSS subscores (this IG captures the NIHSS **total** score only).

## General Modeling Principles

### Implementation-centered design
- **Minimal but sufficient** profiles to cover key clinical indicators, registry fields, and reporting needs.
- **Compatibility** with HL7® FHIR® **R5** base resources and established modeling patterns.
- A consistent resource split aligned to clinical intent:
  - `Encounter` anchors the episode of care (index stroke admission),
  - `Condition` expresses diagnoses and longitudinal risk factors,
  - `Procedure` captures performed/not-performed interventions and diagnostic procedures,
  - `Observation` captures measurements, scores, timing metrics, and categorical findings,
  - `MedicationRequest` captures discharge prescriptions,
  - `MedicationStatement` captures prior medication use (home meds) and adherence.

### Episode anchoring and linkage
- Most clinical resources in this IG are expected to reference the **index stroke encounter** (`Encounter`) to support:
  - episode-level analytics,
  - registry export consistency,
  - simplified integration and validation logic.

### Terminology reuse
- **SNOMED CT** is the default terminology for clinical concepts including diagnoses, procedures, observable entities, disorders, and qualifiers.
- **UCUM** is used for all quantitative units (e.g., minutes, mm[Hg]) to ensure computability.
- **Local CodeSystems** are introduced only when:
  - an appropriate SNOMED CT concept is not available, or
  - the registry requires a controlled categorical answer set not reliably represented by standard terminology (e.g., “procedure not done reason”, “timing phase”), or
  - upstream systems commonly represent a concept as a stable “bundle/protocol” (e.g., combined imaging protocols) without granular breakdown.
- Whenever local codes are introduced:
  - they are defined in a local `CodeSystem` with explicit meaning,
  - they are surfaced through a bound `ValueSet`,
  - and they are documented with use-case and interpretation guidance to preserve semantic consistency across sites.

### Critical stroke timings
- Time-sensitive performance indicators (e.g., door-to-needle, door-to-groin) are represented as `Observation` resources using timing-focused profiles.
- Metrics are modeled as **durations** (typically in UCUM minutes) to optimize registry reporting:
  - The interval value is captured in `Observation.valueQuantity`,
  - underlying event timestamps can be modeled separately if available/required by the implementation.
- Where exact timestamps are available and clinically important, the IG encourages recording them via standard elements:
  - `Procedure.occurrence[x]` for procedures,
  - `Observation.effective[x]` for observations.
- Where exact timestamps are not available or are operationally unreliable, the IG uses **contextual timing extensions** to preserve interpretability and comparability (e.g., “acute vs post-acute”, “within 4 hours”, “baseline vs discharge vs 90-day follow-up”).

### Explicit timing and assessment context
- Several stroke measures are meaningful only when their **clinical phase/timepoint** is known (e.g., mRS at baseline vs at 90 days).
- This IG therefore supports two complementary approaches:
  1) **Exact timing**: use `effective[x]` / `occurrence[x]` when known.
  2) **Phase classification**: use timing context extensions when a standardized label is required for reporting.
- Examples implemented in this IG include:
  - Observation timing context for functional outcomes and severity scores (e.g., pre-stroke baseline, admission, discharge, ~90-day follow-up).
  - Procedure timing context for phase-of-care classification (acute vs post-acute relative to encounter start).
  - Swallow screening timing category for categorical KPI reporting (e.g., within 4 hours).

### Data quality and validation
- Cardinalities and `mustSupport` are aligned with registry completeness expectations and core quality indicators.
- Required `ValueSet` bindings constrain key coded fields to prevent ambiguity and improve comparability.
- FHIRPath **invariants** enforce cross-field consistency and analytic safety. Typical validation patterns include:
  - If a `Procedure.status = not-done`, then `Procedure.statusReason` must be present.
  - If a procedure is completed and performed locally, an occurrence timestamp may be required to support time-to-event metrics.
  - Complications may be limited to specific procedure contexts (e.g., only a completed thrombectomy can carry thrombectomy complications).
  - For swallow screening, the timing category may be required.

### Interoperability and downstream reuse
- Prefer standard concepts and standard FHIR elements whenever possible.
- Avoid local concepts when standard equivalents exist; when local codes are necessary:
  - define them in local CodeSystems with stable meanings,
  - and, where cross-terminology alignment is required, support mapping using `ConceptMap` (e.g., to local datasets, national terminologies, or alternative coding systems).
- The IG is designed to support both:
  - direct clinical interoperability (sharing data between systems), and
  - secondary use (registries, dashboards, quality improvement, research) without re-interpretation.

### Versioning and evolution
- Profiles, extensions, CodeSystems, and ValueSets are versioned to support controlled evolution as the registry dataset changes.
- Local terminology is governance-controlled within the IG to preserve stability across implementations and across time.
- Validation rules are intentionally strict where comparability is essential for registry KPIs, and intentionally flexible where workflows vary across sites (e.g., optional elements for data that may not exist in all environments).