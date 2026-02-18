---
title: Extensions
layout: default
---

# Extensions

Extensions let you add well-defined data elements beyond the base FHIR resources while preserving compatibility and validation.  
In this guide you’ll find the extensions referenced by the profiles and examples.

- **Purpose & scope:** each extension documents the problem it solves and the data type it introduces.  
- **Canonical URL:** ensure the canonical follows your namespace.  
- **Context:** the allowed placement (resource/path) is explicitly defined to avoid misuse.  
- **Constraints & bindings:** review any required invariants and value set bindings before reuse.  
- **Examples:** look for instances showing the extension “in action” in the Examples section or on each extension’s page.  
- **Versioning & governance:** check `status` (draft/active) and change notes to assess maturity and impact.

> 💡 **Tip:** Prefer HL7 standard extensions where possible. Create a custom extension only when no suitable standard one exists.

{% include list-folder.html srcpath='StructureDefinition' %}
