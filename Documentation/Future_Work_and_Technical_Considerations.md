# Future Work and Technical Considerations

## Current repository status

This repository publishes selected MATLAB function listings transcribed from Chapter 4 of the MSc dissertation. The functions are retained as dissertation-derived academic code samples.

No MATLAB or GNU Octave execution, parser check, MATLAB Code Analyzer run or automated test has been completed as part of this repository update. The presence of the test script does not mean that it has been executed or passed.

The observations below are preliminary considerations based on reviewing the published code and its stated modelling assumptions. They are not a complete code audit, runtime test report or validation of the physical models.

## Technical considerations identified from code review

| File | Consideration for future work |
|---|---|
| `calculateVAWTPowerAndTorque.m` | The pitch angle is described in degrees but passed to MATLAB `sin` and `cos`, which interpret inputs as radians. Confirm the intended angle convention and review the torque and friction units. |
| `calculateAMBPowerAndTorque.m` | The AMB torque and force relationships are simplified. A physically derived actuator and rotor model would be needed for engineering use. |
| `verticalAxisWindTurbine.m` | The electromagnetic branch requires review of the physical quantities and units used in the magnetic interaction and rotational-motion calculations. |
| `calculateElectromagneticForce.m` | The listed relationship does not establish a generally valid force model from the stated quantities. A revised formulation would need to be derived from an appropriate electromagnetic model. |
| `pmsg_power_output.m` | The function uses a simplified proportional relationship rather than a complete PMSG electrical model with machine parameters, rectification, losses and load behaviour. |
| `simulateBuckConverter.m` | The scalar time definition means the update loop does not perform a multi-step time-series calculation. A separate time-vector implementation and documented battery model would be needed for further study. |
| `active_magnetic_bearing.m` | The state update and auxiliary calculations are simplified. Future work should define the state variables, units, actuator dynamics and control law. |
| `hybridControl.m` | The action routines print messages and are placeholders; they do not operate Raspberry Pi GPIO, sensors, relays or physical equipment. |

These observations are also discussed in [Code Notes](Code_Notes.md). The dissertation-derived source files have intentionally not been altered as part of this documentation update.

## Suggested future development

### 1. Source and model traceability
- Preserve the dissertation-derived function listings as a historical reference.
- Keep the mapping between each function and its dissertation section/page.
- Record the origin of model parameters and assumptions where those sources are available.

### 2. Mathematical and dimensional review
- Review each equation against an appropriate physical model.
- Confirm SI units, sign conventions and angle conventions.
- Document assumptions, parameter ranges and model boundaries.
- Distinguish simplified illustrative relationships from quantities intended to represent physical measurements.

### 3. Separate revised models
- If the research is continued, create separately named revised implementations rather than silently changing the dissertation-derived functions.
- Explain the derivation and rationale for each revised equation.
- Maintain a clear change history between the dissertation listing and any later model.

### 4. Simulation and software checks
- Run the functions in a stated MATLAB or GNU Octave version.
- Record warnings, errors, inputs and outputs.
- Add repeatable test cases for zero, nominal and boundary operating conditions.
- Use MATLAB Code Analyzer or appropriate static-analysis tools where available.
- Report only checks that have actually been performed.

### 5. System-level study
- Define subsystem interfaces and energy-flow assumptions.
- Consider converter dynamics, losses, battery state of charge and operating constraints.
- Examine energy balance and control behaviour across representative operating conditions.
- Compare model outputs with analytical references or measured data where suitable evidence is available.

### 6. Experimental work
If a laboratory platform is developed, selected subsystem models could be compared with measured results using appropriate instrumentation and safe test procedures. Such work would be a separate research stage; it is not represented as completed in this repository.

## Test harness

A preliminary execution-check script is provided at `Tests/run_validation.m`. It is intended to check whether selected functions execute for example inputs and to display known implementation limitations.

It has not been executed as part of this repository update. Even after execution checks are completed, those checks alone would not establish that the equations are physically accurate or that the complete hybrid system is validated.

## Publication and reuse note

The MATLAB functions are provided as selected dissertation-derived code listings for academic review. Anyone considering reuse should review the stated limitations and independently establish suitability for their intended purpose. Public distribution should remain subject to any applicable university, dissertation, employer or confidentiality requirements.
