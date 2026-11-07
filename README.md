# Low-Power Hybrid Energy System for IoT Applications

**MSc dissertation project | Glasgow Caledonian University | 2022–2023**

A simulation-oriented MSc research project investigating a proposed hybrid renewable-energy concept for low-power Internet of Things (IoT) applications.

## Project overview

The dissertation, *Designing a Low Power Hybrid System to Power IoT Applications*, explored a concept combining:

- Solar photovoltaic (PV) generation with maximum power point tracking (MPPT)
- A Savonius-type vertical-axis wind turbine (VAWT)
- Permanent magnets and an electromagnetic arrangement intended to provide rotor assistance
- An Active Magnetic Bearing (AMB) concept in place of a conventional mechanical bearing
- A permanent magnet synchronous generator (PMSG) representation
- Battery storage and a buck-converter representation
- A threshold-based supervisory-control concept using environmental and electrical sensor inputs

The research used mathematical calculations and MATLAB/Simulink modelling. This repository publishes selected MATLAB function listings from the dissertation and supporting documentation.

**Scope:** This is a selected-code academic portfolio repository. It is not the complete Simulink project, a fully reproducible copy of every dissertation simulation, a validated engineering software package or evidence of a physically constructed and experimentally validated prototype.

## Research objectives

1. Explore solar–wind hybrid energy technology for low-power applications.
2. Investigate the potential role of magnetic-bearing technology in a wind-turbine concept.
3. Compare a model of a mechanical-bearing wind turbine with an AMB-related model.
4. Develop a conceptual hybrid model combining solar, wind, electromagnetic and storage elements.
5. Represent supervisory control behaviour for the proposed hybrid system.
6. Examine the model outputs reported in the dissertation and identify further work required.

## Dissertation-reported results

The dissertation reports the following power outputs for its mechanical-bearing and AMB-related wind-turbine comparison:

| Wind speed (m/s) | Mechanical-bearing model (W) | AMB-related model (W) |
|---:|---:|---:|
| 5.0 | 7.708 | 8.063 |
| 7.5 | 29.14 | 31.75 |
| 10.0 | 72.77 | 79.03 |
| 12.5 | 146.5 | 157.8 |
| 15.0 | 258.1 | 275.8 |

The dissertation also reports the following total outputs for its proposed hybrid model:

| Wind speed (m/s) | Reported wind contribution (W) | Reported solar contribution (W) | Reported total (W) |
|---:|---:|---:|---:|
| 5.0 | 78.55 | 30.33 | 108.88 |
| 7.5 | 78.81 | 24.53 | 103.34 |
| 10.0 | 0.2866 | 26.50 | 26.7866 |
| 12.5 | 0.2864 | 32.58 | 32.8664 |
| 15.0 | 0.2862 | 24.15 | 24.4362 |
| 17.5 | 0.2862 | 26.56 | 26.8462 |
| 20.0 | 0.2877 | 29.63 | 29.9177 |
| 22.5 | 0.2869 | 34.39 | 34.6769 |
| 25.0 | 0.2867 | 28.60 | 28.8867 |
| 27.5 | 78.81 | 26.70 | 105.51 |
| 30.0 | 78.62 | 29.24 | 107.86 |

**Important interpretation note:** These are values reported in the dissertation, not independently reproduced or validated results. The proposed-model table shows a sharp change in the reported wind contribution at the 10 m/s and 25 m/s operating thresholds. The dissertation's Chapter 5 discussion says output is low between 10 and 25 m/s and rises outside that interval, while its Chapter 6 conclusion describes optimal performance within 10–25 m/s. These statements are inconsistent; the repository does not resolve that discrepancy.

The bearing comparison also requires caution: the dissertation estimates 9 W total power for four electromagnets in its AMB sizing discussion, but the reported comparison table does not clearly show that auxiliary electrical consumption being deducted from the AMB-related output. Therefore, the table alone does not establish a net system-efficiency improvement.

## Repository structure

```text
01_Wind_Turbine_Modelling/
  calculateVAWTPowerAndTorque.m
  calculateAMBPowerAndTorque.m
  verticalAxisWindTurbine.m
02_Electromagnetic_System/
  calculateElectromagneticForce.m
03_Generator_Modelling/
  pmsg_power_output.m
04_Battery_and_Converter/
  simulateBuckConverter.m
05_Hybrid_Control/
  active_magnetic_bearing.m
  hybridControl.m
Documentation/
  Dissertation_Information.md
  Source_Provenance.md
  System_Architecture.md
  Research_Methodology_and_Contribution.md
  Code_Notes.md
  Future_Work_and_Technical_Considerations.md
Tests/
  run_validation.m
```

## Exploring the MATLAB functions

The `.m` files are individual function listings associated with Chapter 4 of the dissertation. Their source sections and printed page references are documented in [Source Provenance](Documentation/Source_Provenance.md).

The optional script at `Tests/run_validation.m` is a preliminary execution-check harness. **It has not been run as part of this repository update.** Even successful execution checks would not establish the physical accuracy of the equations or validate the complete hybrid system.

## Research context and contribution

The work was completed as part of the MSc Electrical & Electronics Engineering programme at Glasgow Caledonian University. It provided experience in decomposing a hybrid energy concept into subsystems and representing selected wind-turbine, electromagnetic, generator, storage/converter and supervisory-control behaviours using MATLAB functions and a MATLAB/Simulink workflow.

See:
- [Dissertation Information](Documentation/Dissertation_Information.md)
- [Research Methodology and Individual Contribution](Documentation/Research_Methodology_and_Contribution.md)
- [Conceptual System Architecture](Documentation/System_Architecture.md)
- [Source Provenance](Documentation/Source_Provenance.md)

## Limitations and responsible interpretation

The published functions preserve simplified dissertation-derived relationships. They include assumptions and implementation limitations involving angle units, aerodynamic and electromagnetic equations, generator and battery representations, and placeholder supervisory-control actions. The full Simulink model, solver settings, supporting datasets and hardware implementation are not included.

Detailed notes are provided in [Code Notes](Documentation/Code_Notes.md) and [Future Work and Technical Considerations](Documentation/Future_Work_and_Technical_Considerations.md). The code must not be used to size, control, certify or operate real equipment without independent engineering redevelopment and verification.

## Technical topics

MATLAB · Simulink · Renewable energy systems · Solar PV · Wind energy conversion · Active magnetic bearings · Electromagnetic systems · PMSG · Energy storage · Power electronics · Hybrid energy systems

## Academic reference

Anoop Johnson, *Designing a Low Power Hybrid System to Power IoT Applications*, MSc dissertation, Glasgow Caledonian University, 2023.
