# Dissertation Information

## Academic details

- **Author:** Anoop Johnson
- **Dissertation title:** *Designing a Low Power Hybrid System to Power IoT Applications*
- **Degree:** MSc Electrical & Electronics Engineering
- **Institution:** Glasgow Caledonian University
- **Academic period:** 2022–2023
- **Dissertation year:** 2023

## Research focus

The dissertation investigated a proposed low-power hybrid renewable-energy concept intended for IoT applications. The concept explored the combination of solar photovoltaic generation and a Savonius-type vertical-axis wind subsystem, together with generator, battery-storage, power-conversion and supervisory-control concepts.

## Modelling work represented in this repository

Selected MATLAB function listings from Chapter 4 (System Model) are transcribed into individual `.m` files. They represent the following areas:

1. VAWT power and torque calculations with mechanical-bearing parameters.
2. VAWT calculations incorporating an AMB-related torque term.
3. Simplified vertical-axis rotor rotational-motion calculation.
4. Electromagnetic subsystem calculation.
5. Simplified PMSG output relationship.
6. Buck-converter and battery calculation.
7. AMB-related angular-velocity calculation.
8. Threshold-based supervisory control logic.

The dissertation also discusses MATLAB/Simulink subsystem and system-level modelling. The full Simulink project, model files, solver configuration and supporting datasets are not included in this GitHub repository.

## Scope of this publication

This repository is intended to provide a representative view of selected academic modelling work and its technical context. It is not presented as a complete reproduction of the dissertation, an independently validated software package or proof of a physical prototype.

The MATLAB files have been transcribed from dissertation listings and formatted for readability. See [Source Provenance](Source_Provenance.md) for the file-to-dissertation mapping and transcription notes.

## Further reading

- [Research Methodology and Individual Contribution](Research_Methodology_and_Contribution.md)
- [Conceptual System Architecture](System_Architecture.md)
- [Code Notes and Modelling Limitations](Code_Notes.md)
- [Future Work and Technical Considerations](Future_Work_and_Technical_Considerations.md)
