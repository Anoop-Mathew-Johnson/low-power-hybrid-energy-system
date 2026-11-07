# Low-Power Hybrid Energy System for IoT Applications

**MSc dissertation project | Glasgow Caledonian University | 2022–2023**

A simulation-oriented MSc research project investigating a proposed solar–wind hybrid energy concept for low-power Internet of Things (IoT) applications.

## Dissertation overview

The dissertation, *Designing a Low Power Hybrid System to Power IoT Applications*, explored a concept combining:

- Solar photovoltaic (PV) generation with maximum power point tracking (MPPT)
- A Savonius-type vertical-axis wind turbine (VAWT)
- Permanent magnets mounted near the turbine blades and an electromagnetic arrangement intended to interact with them
- An Active Magnetic Bearing (AMB) concept in place of a conventional mechanical bearing
- A permanent magnet synchronous generator (PMSG) representation
- Battery storage and a buck-converter representation
- Proposed supervisory control based on environmental and electrical sensor inputs, with Raspberry Pi identified as the intended controller platform

The dissertation describes mathematical calculations, theoretical analysis and MATLAB/Simulink modelling. This repository makes selected MATLAB function listings from the dissertation available with explanatory documentation.

> **Scope:** This is a selected-code academic portfolio repository. It is not the complete Simulink project, a fully reproducible copy of every dissertation simulation, a validated engineering software package or evidence of a physically constructed and experimentally validated prototype. The dissertation itself identifies further control-system simulation and hardware implementation as future work.

## Research objectives

The dissertation set out to:

1. Research solar–wind hybrid technology.
2. Investigate the impact of magnetic levitation technology on wind-turbine performance.
3. Compare a mechanical-bearing wind-turbine model with an Active Magnetic Bearing (AMB) model.
4. Propose a hybrid model integrating the magnetic-bearing concept.
5. Develop a control-circuit concept for the hybrid model.
6. Perform simulations of the proposed model.

## Results reported in the dissertation

### Mechanical-bearing and AMB-related turbine comparison

Chapter 5, Table 2 reports the following power outputs:

| Wind speed (m/s) | Mechanical-bearing model (W) | AMB-related model (W) |
|---:|---:|---:|
| 5.0 | 7.708 | 8.063 |
| 7.5 | 29.14 | 31.75 |
| 10.0 | 72.77 | 79.03 |
| 12.5 | 146.5 | 157.8 |
| 15.0 | 258.1 | 275.8 |

The dissertation reports higher output for the AMB-related model at these five wind-speed cases. This is a comparison of the model outputs as reported in the dissertation; it is not an independently verified net-efficiency result. In Chapter 3, the dissertation separately estimates 9 W as the total power requirement for four electromagnets. The Chapter 5 comparison table does not clearly show this auxiliary demand being deducted from the AMB-related output.

### Proposed hybrid-model results

Chapter 5, Table 3 reports the following values:

| Wind speed (m/s) | Wind contribution (W) | Solar contribution (W) | Reported total (W) |
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

**Interpretation note:** The reported wind contribution is much lower between 10 m/s and 25 m/s than outside that interval. Chapter 5 describes this low-output interval and attributes the higher values outside it to the electromagnetic-system branch. However, Chapter 6 describes 10–25 m/s as the optimal performance range. These statements are inconsistent, so this repository preserves the reported data without resolving or reinterpreting the discrepancy.

These figures are reproduced as dissertation-reported results only. They have not been independently recalculated from the full Simulink model or experimentally verified.

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

The `.m` files are selected function listings associated with Chapters 4.1–4.3 of the dissertation. Their corresponding sections and printed page references are documented in [Source Provenance](Documentation/Source_Provenance.md).

The optional script at `Tests/run_validation.m` is a preliminary execution-check harness. It has **not** been run as part of this documentation update. Successful execution checks would not establish the physical accuracy of the equations or validate the complete hybrid system.

## Research context and individual contribution

The project was completed as part of the MSc Electrical & Electronics Engineering programme at Glasgow Caledonian University. It provided experience in decomposing a hybrid energy concept into subsystems and representing selected turbine, electromagnetic, generator, storage/converter and supervisory-control behaviours using MATLAB functions and a MATLAB/Simulink workflow.

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
