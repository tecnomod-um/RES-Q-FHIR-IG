---
title: Conformance
layout: default
---

# Conformance

This section explains how implementers can claim conformance to the **RES-Q Stroke Registry Implementation Guide (IG)** and what requirements apply to each actor in the exchange workflow.

The RES-Q interoperability pattern is **submission-oriented** (registry ingestion), not a generic “query-first” FHIR ecosystem. Conformance is therefore framed around the ability to **produce, transform, validate, and ingest** FHIR R5 resources that comply with this IG.

### Exchange Pattern and Roles

#### High-level data flow
1. **Source Data Provider (Hospital / EHR / Stroke Unit System)** exports raw stroke-related data (often form-derived or extracted from clinical systems).
2. **Data Transformer (Mapping / ETL / Integration Layer)** converts the raw data into an HL7 FHIR R5 **Bundle** conformant to this IG (profiles, terminology, invariants).
3. **Registry Receiver (RES-Q Registry Ingestion Service)** receives the Bundle and transforms the FHIR content into the registry’s internal data architecture.

FHIR is used here as a **standardized communication model** to reduce ambiguity, improve semantic clarity, and support predictable downstream transformation into the registry database.

#### Conformance roles
This IG distinguishes conformance expectations by role:

- **Producer**: the system that generates a FHIR R5 Bundle (often the Data Transformer).
- **Receiver**: the registry ingestion service that accepts and processes the Bundle.
- **Source**: the upstream hospital systems providing the raw data (not necessarily FHIR-native).

In most deployments, the **Data Transformer** is the conformance-critical component on the producer side, because it is responsible for generating resources that validate against this IG.

### What This IG Defines (Scope of Conformance)

This IG defines:
- **Profiles** on core HL7 FHIR R5 resources (e.g., Encounter, Observation, Procedure, Condition, MedicationRequest, MedicationStatement).
- **Terminology artifacts** (ValueSets and CodeSystems) used in required or extensible bindings.
- **Extensions** to capture stroke-specific concepts not fully represented by base resources.
- **FHIRPath invariants** for cross-field consistency and data quality enforcement.
- **Examples** illustrating compliant instances and typical registry scenarios.

This IG does not require implementers to expose a complete FHIR server API unless explicitly stated for a given deployment.

### Claiming Conformance

An implementation **conforms** to this IG if it satisfies all applicable requirements below for its conformance role (Producer and/or Receiver).

#### Producer conformance (Bundle creation)
A Producer conforms if it:
1. Produces a FHIR R5 **Bundle** whose resources validate against the relevant **profiles** in this IG.
2. Populates all **cardinality constraints** (min/max) required by those profiles.
3. Implements all applicable **FHIRPath invariants** (validation MUST fail if an error-severity invariant is violated).
4. Supports and correctly uses **Must Support** elements (see Must Support section).
5. Uses the correct **terminology bindings** (Required/Extensible/Preferred/Example) and appropriate CodeSystems.
6. Produces a Bundle with references that are internally consistent and resolvable (see Bundle Requirements).

#### Receiver conformance (registry ingestion)
A Receiver conforms if it:
1. Accepts Bundles and can parse FHIR R5 resources that conform to this IG.
2. Validates incoming resources against this IG profiles and enforces **error-severity invariants**.
3. Processes **Must Support** elements when present and preserves their meaning during transformation.
4. Processes required terminology bindings and correctly interprets local CodeSystems defined by this IG.
5. Provides actionable validation feedback (at minimum: which resource failed, which profile/rule failed, and why).

### Bundle Requirements

#### Bundle type (transaction only)

All submissions to the registry **SHALL** use:

- `Bundle.type = transaction`

This IG assumes a **transaction-only** submission pattern. Other Bundle types (e.g., `collection`, `batch`) are **not** considered conformant for RES-Q submissions.

**Rationale**
- Ensures atomic submission semantics (all-or-nothing) for a patient episode package.
- Enables predictable ingestion behavior and consistent handling of inter-resource references.

**Transactional entry requirements**
For a conformant transaction Bundle:

- Each `Bundle.entry` **SHALL** include:
  - `fullUrl` (a stable identifier used to resolve references within the Bundle), and
  - `request.method` and `request.url` defining the RESTful transaction action.

- Implementers SHOULD follow these conventions:
  - Use `POST` for create operations when the target server assigns ids.
  - Use `PUT` when the client controls ids (or when the integration contract requires deterministic ids).
  - Ensure all internal references resolve using `Reference.reference` pointing to the corresponding `fullUrl` (e.g., `urn:uuid:...`) or to the same logical id used in `request.url`.

- The transaction Bundle **SHALL** be internally consistent:
  - References between resources (e.g., `Observation.subject`, `Observation.encounter`, `Procedure.subject`, `Condition.encounter`) must resolve to entries included in the same transaction Bundle, unless the integration contract explicitly allows external references.

#### Minimal reference integrity

A submitted transaction Bundle SHOULD include and maintain reference integrity for:
- The **index stroke Encounter** (episode anchor).
- The **Patient** referenced by all resources.
- Any referenced `Condition` / `Procedure` / `Observation` included as `reason`, `partOf`, or `hasMember` targets.

References SHOULD be resolvable within the Bundle (contained or full resources in the same Bundle) unless an implementation contract explicitly allows external references.

#### Episode anchoring expectation
Resources representing data for the index stroke episode SHOULD reference the index stroke encounter using:
- `encounter` (for Observation, Condition, MedicationRequest, MedicationStatement) when applicable, and/or
- episode-scoped linkages like `partOf`, `hasMember`, or `reason` when defined by the profile.

This supports registry ingestion logic and episode-level analytics.

### Must Support

#### Definition (pragmatic registry interpretation)
If an element is marked **Must Support (MS)** in this IG:

- **Producer** SHALL be able to **populate and send** the element when the source data contains a value for it.
- **Receiver** SHALL be able to **receive, process, and preserve** the element when it is present.
- If the element is not available from the source data, the Producer SHALL follow the “Data Absent / Unknown” guidance below rather than inventing values.

#### Choice types
Where profiles allow multiple data types (e.g., `effective[x]`, `occurrence[x]`, `value[x]`), Producers SHALL support at least one of the allowed types as constrained by the profile and examples. Receivers SHALL accept all types allowed by the profile (or clearly document any imposed limitation in the integration contract).

### Cardinality and Invariants

- **Cardinality** is authoritative: resources SHALL satisfy minimum and maximum occurrences for each element.
- **Invariants** (FHIRPath) are required constraints:
  - Validation SHALL fail if an **error**-severity invariant is violated.
  - **Warning**-severity invariants SHOULD be surfaced to implementers as quality feedback but MAY not block ingestion depending on registry policy.

Examples of typical constraints in this IG include:
- If `Procedure.status = not-done` then `Procedure.statusReason` must exist.
- If a procedure outcome field is present, the corresponding procedure context must match (e.g., complications only for completed thrombectomy).
- Timing or context extensions must be present for specific completed assessments.

### Terminology Binding Strength

This IG uses FHIR binding strengths to ensure consistent coding:

- **Required:** Only concepts from the bound ValueSet are allowed.
- **Extensible:** Use concepts from the ValueSet when possible; other concepts are allowed only if no suitable match exists.
- **Preferred / Example:** Recommended for interoperability but not enforced.

#### SNOMED CT first, local codes when necessary
- **SNOMED CT** is the primary terminology for clinical meaning (diagnoses, procedures, observable entities, qualifiers).
- Where SNOMED CT does not provide a suitable concept (or where the registry needs a stable categorical answer set), this IG defines **local CodeSystems** and includes them in bound ValueSets.

Receivers SHALL recognize and correctly interpret local CodeSystems defined by this IG.

### Data Absent / Unknown

Stroke registry data often contains missing, unknown, or not-applicable fields. Implementations SHALL represent missingness explicitly and consistently:

- Use “unknown” coded values only when “unknown” is itself a meaningful categorical result in the data model (and is defined in the relevant ValueSet/CodeSystem).

This avoids conflating “unknown” with “negative” and improves analytic validity.

### Producer Guidance (Mapping and Transformation)

#### Raw data to FHIR transformation
The Data Transformer SHOULD:
- Map each source field to:
  1) a FHIR resource type (Encounter, Condition, Procedure, Observation, MedicationRequest, MedicationStatement),
  2) the profile defined by this IG,
  3) the specific constrained element and binding,
  4) an appropriate timing strategy (timestamp vs timing-context extension).
- Preserve semantic intent (e.g., “procedure not performed due to time window” must map to `status=not-done` + `statusReason` with the controlled code).

#### Timing data strategy
- Use precise timestamps (`effective[x]`, `occurrence[x]`) where available.
- Use timing-context extensions when only a phase/category is known or when the registry requires standard reporting categories (e.g., acute/post-acute, within 4 hours, baseline/discharge/90-day).

#### Medication modeling
- Use `MedicationRequest` for discharge prescriptions/orders.
- Use `MedicationStatement` for prior/home medication exposure and adherence status before the index encounter.

### Receiver Guidance (Ingestion and Transformation)

The Registry Receiver SHOULD:
- Validate incoming Bundles against this IG.
- Provide clear validation outcomes and error reporting (resource id, profile url, failing rule).
- Transform validated FHIR into internal registry storage while preserving:
  - coded meanings (SNOMED/local),
  - timing semantics (exact vs contextual),
  - episode linkage (encounter anchoring),
  - and conformance-critical fields (Must Support, required bindings).


### Security and Privacy (Informative)

Implementations SHALL:
- comply with local privacy law and institutional policy for PHI/PII,
- use TLS for transport (HTTPS),
- apply appropriate authentication/authorization controls (e.g., OAuth2/SMART-on-FHIR or equivalent),
- ensure auditability of submissions and transformations where required by governance.