# Dissertation Information

## Academic details

- **Author:** Anoop Johnson
- **Dissertation title:** *Designing a Low Power Hybrid System to Power IoT Applications*
- **Degree:** MSc Electrical & Electronics Engineering
- **Institution:** Glasgow Caledonian University
- **Academic period:** 2022–2023
- **Dissertation year:** 2023
- **Supervisor:** Prof. M. Emad Farrag

## Research focus

The dissertation investigated a proposed low-power hybrid renewable-energy concept intended for IoT applications. The concept explored solar photovoltaic generation and a Savonius-type vertical-axis wind subsystem, with permanent magnets and an electromagnetic arrangement, an active magnetic bearing (AMB) concept, generator, battery-storage, power-conversion and supervisory-control elements.

## Modelling work represented in this repository

Selected MATLAB function listings from Chapter 4 (System Model) are published as individual `.m` files. They represent:

1. VAWT power and torque calculations with mechanical-bearing parameters.
2. VAWT calculations incorporating an AMB-related torque term.
3. Simplified vertical-axis rotor rotational-motion calculation.
4. Electromagnetic subsystem calculation.
5. Simplified PMSG output relationship.
6. Buck-converter and battery calculation.
7. AMB-related angular-velocity calculation.
8. Threshold-based supervisory control logic.

The dissertation also presents MATLAB/Simulink diagrams for subsystem and system-level concepts. The full Simulink project, model files, solver configuration, all block parameters and supporting datasets are not included in this GitHub repository.

## Results and interpretation

The dissertation reports a mechanical-bearing versus AMB-related wind-turbine comparison and a table of proposed hybrid-system outputs over a range of wind speeds. The reported hybrid-model table shows low wind contribution between 10 and 25 m/s, whereas the Chapter 6 conclusion describes 10–25 m/s as the optimal performance range. This inconsistency is explicitly flagged in the repository documentation.

The dissertation also estimates 9 W total power for four electromagnets in its AMB sizing discussion. The reported bearing-comparison table does not clearly show this auxiliary demand being deducted. Consequently, the reported figures should not be presented as proof of net efficiency improvement.

These are dissertation-reported simulation results, not independently reproduced or experimentally measured results.

## Scope of this publication

This repository is intended to provide a representative view of selected academic modelling work and its technical context. It is not presented as a complete reproduction of the dissertation, an independently validated software package or proof of a physical prototype.

The MATLAB files have been transcribed from dissertation listings and formatted for readability. See [Source Provenance](Source_Provenance.md) for the file-to-dissertation mapping and transcription notes.

## Further reading

- [Research Methodology and Individual Contribution](Research_Methodology_and_Contribution.md)
- [Conceptual System Architecture](System_Architecture.md)
- [Code Notes and Modelling Limitations](Code_Notes.md)
- [Future Work and Technical Considerations](Future_Work_and_Technical_Considerations.md)
- [Source Provenance](Source_Provenance.md)
