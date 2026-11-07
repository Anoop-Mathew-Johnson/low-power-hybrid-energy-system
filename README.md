# Low-Power Hybrid Energy System for Power IoT Applications

MSc Electrical & Electronics Engineering dissertation project exploring a proposed low-power hybrid renewable-energy system for Power IoT applications.

## Project overview

The research investigated a hybrid architecture combining solar PV generation, a Savonius vertical-axis wind turbine, a Permanent Magnet Synchronous Generator (PMSG), battery storage and power-management concepts. MATLAB functions were used as part of the modelling and simulation work, alongside a system-level Simulink model.

This repository publishes selected MATLAB function code transcribed from the dissertation. It is a code sample of the academic modelling work, not a complete, independently reproducible Simulink project or a validated hardware implementation.

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
  Code_Notes.md
```

## Modelling areas represented

- Mechanical-bearing and active-magnetic-bearing VAWT calculations
- Simplified electromagnetic-force calculation
- Vertical-axis turbine rotational-motion model
- Simplified PMSG output relationship
- Buck-converter and battery behaviour illustration
- Supervisory hybrid-system control logic

## How to use

The files are individual MATLAB functions. Download or clone the repository and add the relevant function folder to the MATLAB path before calling a function. Function inputs and outputs are indicated in each file's header.

These files were transcribed from the function listings in the MSc dissertation. They have not been presented as a fully tested software package. Review the accompanying [Code Notes](Documentation/Code_Notes.md) before interpreting results or using the functions in further work.

## Important modelling limitations

The published functions preserve the original dissertation's simplified modelling approach. They contain assumptions and limitations that should be considered before reuse, including degree/radian handling in trigonometric expressions, simplified force and torque relationships, a scalar time definition in the battery routine, and placeholder actions in the hybrid controller. These are academic code samples and should not be used to size, control or certify real equipment.

## Academic context

MSc Electrical & Electronics Engineering, Glasgow Caledonian University (2022–2023).

Dissertation: **Designing a Low Power Hybrid System to Power IoT Applications**.

The repository contains selected function listings only. The complete Simulink model, associated model files, datasets and other dissertation materials are not included.

## Skills and engineering topics

MATLAB · Simulink · Renewable energy systems · Wind energy conversion · Solar PV · Energy storage · Power electronics · Electrical machines · System modelling · Hybrid energy management

## Technical documentation

- [System architecture (conceptual)](Documentation/System_Architecture.md)
- [Research methodology and individual contribution](Documentation/Research_Methodology_and_Contribution.md)
- [Source provenance and dissertation page mapping](Documentation/Source_Provenance.md)
- [Code notes and modelling limitations](Documentation/Code_Notes.md)
- [Code review and validation plan](Documentation/Code_Review_and_Validation_Plan.md)
