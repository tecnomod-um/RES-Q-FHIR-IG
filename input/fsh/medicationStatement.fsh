// ------------------ Aliases ------------------------------------
Alias: SCT = http://snomed.info/sct
Alias: FHIR = http://hl7.org/fhir
Alias: UCUM = https://ucum.org/ucum
// Alias R5 Adherence CodeSystem/ValueSet
Alias: MedStatementMedsCS_URL = http://tecnomod-um.org/CodeSystem/medication-statement-cs
Alias: MedStatementAdherenceVS_URL = http://hl7.org/fhir/ValueSet/medication-statement-adherence
Alias: MedStatementMedsVS_URL = http://tecnomod-um.org/ValueSet/medicationStatement-meds-codes-vs
// FHIR R5 Resource Aliases
Alias: MedicationStatement = http://hl7.org/fhir/StructureDefinition/MedicationStatement
Alias: Patient = http://hl7.org/fhir/StructureDefinition/Patient
Alias: Practitioner = http://hl7.org/fhir/StructureDefinition/Practitioner
Alias: PractitionerRole = http://hl7.org/fhir/StructureDefinition/PractitionerRole
Alias: RelatedPerson = http://hl7.org/fhir/StructureDefinition/RelatedPerson
Alias: Organization = http://hl7.org/fhir/StructureDefinition/Organization
Alias: Condition = http://hl7.org/fhir/StructureDefinition/Condition



// ------------------ Perfil Unificado: Declaración de Medicación Previa (FHIR R5) ---
Profile: PriorMedicationStatementProfile
Id: prior-medication-statement-profile
Parent: MedicationStatement // Base R5 MedicationStatement
Title: "Prior MedicationStatement Profile"
Description: """
Profile for documenting a statement about the patient’s medication use **before** the index stroke encounter.

**Primary use-cases**
- Medication reconciliation on admission (home medications).
- Capturing pre-event antithrombotic/anticoagulant exposure (key for hemorrhage risk, eligibility decisions, and etiology workup).
- Registry variables and analytics (e.g., “on anticoagulation at presentation”, “adherent vs non-adherent”).
- Clinical decision support and discharge planning (continuation, switching, contraindication checks).

**How to interpret MedicationStatement here**
- This resource asserts *medication usage status/history*, not a prescription/order.
  - Use MedicationRequest for discharge prescriptions or new orders.
  - Use MedicationStatement for what the patient was taking (or was supposed to be taking) prior to admission.

**Key elements and how to use them**
- `medication` (required; bound to MedicationVS or an IG-specific meds ValueSet): identifies the agent/class.
  - Prefer specific coded substances/products when available.
- `subject` (required): patient who used the medication.
- `encounter` (required): anchors the statement to the index stroke encounter where it was collected/recorded.
- `status` (required): the lifecycle status of the statement record (e.g., recorded/entered-in-error).
- `adherence` (optional): captures whether the patient is/was taking the medication as intended.
  - If present, `adherence.code` is required and bound to the R5 adherence ValueSet.
- `reason` (optional, repeating): why the medication was taken (indication), represented as CodeableReference targets.

"""
* ^fhirVersion = #5.0.0 
* ^url = "http://tecnomod-um.org/StructureDefinition/prior-medication-statement-profile"
* ^version = "1.0.0"
* ^name = "PriorMedicationStatementProfile"
* ^experimental = true
* ^status = #active

// Key fields for prior medication reporting
* medication 1..1 MS
* medication from MedicationVS_URL (required)
* subject 1..1 MS
* subject only Reference(Patient)
* encounter 1..1 MS
* encounter only Reference(Encounter)
* reason 0..* MS 
* reason only CodeableReference(Condition or Observation or DiagnosticReport) // Allowed targets for reason in R5
* status 1..1 MS
// Adherence field to represent Taking / Not Taking in R5
* adherence 0..1 MS // Make the adherence block optional but supported
* adherence.code 1..1 MS // If adherence block is present, code is mandatory
* adherence.code from http://hl7.org/fhir/ValueSet/medication-statement-adherence (required) // Bind to the R5 standard VS


Instance: PriorMedicationStatementExample
InstanceOf: PriorMedicationStatementProfile
* medication = SCT#372756006 "Warfarin (substance)"
* subject = Reference(PatientExample) // Reference to the patient
* reason = Reference(StrokeDiagnosisConditionExample)
* adherence.code = http://hl7.org/fhir/CodeSystem/medication-statement-adherence#taking // Using R5 adherence codes
* status = #recorded // Status of the prior medication statement
* encounter = Reference(EncounterExample)

Invariant: adherence-code-required-if-adherence-present
Description: "If adherence is present, adherence.code must be present to avoid ambiguous adherence capture."
Severity: #error
Expression: "adherence.exists() implies adherence.code.exists()"

Invariant: prior-medication-must-have-encounter
Description: "Prior medication statements must be tied to the index encounter to support episode-level reconciliation and analytics."
Severity: #error
Expression: "encounter.exists()"

Invariant: prior-medication-must-have-subject
Description: "Prior medication statements must reference a patient subject."
Severity: #error
Expression: "subject.exists()"
