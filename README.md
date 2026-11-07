# Low-Power Hybrid Energy System for IoT Applications

**MSc dissertation project | Glasgow Caledonian University | 2022–2023**

A simulation-oriented MSc research project exploring a proposed hybrid renewable-energy system for low-power Internet of Things (IoT) applications.

## Project overview

The dissertation investigated a proposed hybrid energy architecture combining solar photovoltaic (PV) generation, a Savonius-type vertical-axis wind turbine (VAWT), a permanent magnet synchronous generator (PMSG), battery storage and power-management concepts.

MATLAB function-based models and a MATLAB/Simulink modelling workflow were used to represent selected subsystem behaviours and explore the proposed system concept. This repository makes selected MATLAB function listings and supporting research documentation available for academic and portfolio review.

**Project scope:** This is a selected-code publication accompanying an MSc dissertation. It is not a complete, independently reproducible Simulink project, a validated engineering software package or evidence of a physically constructed and experimentally validated prototype.

## Research objectives

- Explore a hybrid solar and wind energy concept for low-power IoT applications.
- Represent selected turbine, electromagnetic, generator, storage/converter and supervisory-control behaviours using MATLAB functions.
- Consider how renewable generation, energy storage and power-management concepts could be brought together at system level.
- Identify modelling assumptions and areas requiring further engineering development.

## Modelling areas represented

- VAWT power and torque calculations with mechanical-bearing parameters
- VAWT calculations incorporating an active-magnetic-bearing (AMB) related term
- Simplified rotor rotational-motion calculation
- Illustrative electromagnetic-force calculation
- Simplified PMSG output relationship
- Buck-converter and battery behaviour illustration
- AMB-related angular-velocity calculation
- Threshold-based supervisory control logic

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
  System_Architecture.md
  Research_Methodology_and_Contribution.md
  Source_Provenance.md
  Code_Notes.md
  Future_Work_and_Technical_Considerations.md
Tests/
  run_validation.m
```

## How to explore the repository

The `.m` files are individual MATLAB functions. To inspect or use a function, download or clone the repository and add the relevant function folder to the MATLAB path. Function inputs and outputs are indicated in each file.

The optional test harness is located at `Tests/run_validation.m`. It is intended for preliminary execution checks in MATLAB or GNU Octave. **It has not been run as part of this repository update.** Its checks do not establish physical accuracy or validate the complete hybrid energy system.

## Research context and contribution

The work was completed as part of the MSc Electrical & Electronics Engineering programme at Glasgow Caledonian University. The dissertation explored a proposed hybrid renewable-energy concept and used MATLAB/Simulink as the modelling environment.

See [Dissertation Information](Documentation/Dissertation_Information.md) for the academic context, [Research Methodology and Individual Contribution](Documentation/Research_Methodology_and_Contribution.md) for the work represented, and [Source Provenance](Documentation/Source_Provenance.md) for the mapping between repository files and dissertation listings.

## Scope, limitations and responsible interpretation

The published functions preserve the simplified modelling approach represented in the dissertation listings. Known limitations include assumptions in the aerodynamic and electromagnetic relationships, angle-unit handling in trigonometric expressions, simplified generator and battery representations, and placeholder actions in the supervisory controller.

These limitations are described in [Code Notes](Documentation/Code_Notes.md) and [Future Work and Technical Considerations](Documentation/Future_Work_and_Technical_Considerations.md). The code should not be used to size, control, certify or operate real equipment without appropriate engineering redevelopment and verification.

The repository does not include the complete Simulink model, model parameters, solver configuration, all supporting datasets or a hardware implementation.

## Technical topics

MATLAB · Simulink · Renewable energy systems · Solar PV · Wind energy conversion · Energy storage · Power electronics · Electrical machines · Hybrid energy systems · System modelling

## Academic reference

Anoop Johnson, *Designing a Low Power Hybrid System to Power IoT Applications*, MSc dissertation, Glasgow Caledonian University, 2023. Further details are provided in [Dissertation Information](Documentation/Dissertation_Information.md).
