# Code Review and Validation Plan

## Current status

The eight MATLAB function files have been published as dissertation-derived code samples. Their presence in GitHub has been checked, but **they have not yet been executed in MATLAB or GNU Octave as part of this repository preparation**. Do not describe them as passing tests.

## Initial static review findings

| File | Review finding | Follow-up required |
|---|---|---|
| `calculateVAWTPowerAndTorque.m` | `pitchAngle` is labelled in degrees but passed to `sin` and `cos`, which use radians. | Decide and document the intended angle convention; verify torque and friction units. |
| `calculateAMBPowerAndTorque.m` | The AMB torque and force expressions are simplified; force expression does not establish a physical force model. | Derive actuator force/torque from coil, magnetic circuit and geometry parameters. |
| `verticalAxisWindTurbine.m` | The electromagnetic branch equates a force-like input with magnetic flux density in subsequent expressions; model units are inconsistent. | Re-derive magnetic interaction and torque with dimensional consistency. |
| `calculateElectromagneticForce.m` | The listed equations reduce to a voltage-proportional quantity, not a generally valid force calculation. | Replace only in a separately labelled improved model, based on a justified electromagnetic formulation. |
| `pmsg_power_output.m` | The output is a simple proportional expression, not a full PMSG electrical model. | Define whether output represents voltage, power or a scaled proxy; add machine and load model if needed. |
| `simulateBuckConverter.m` | `time = 30` is scalar, so `2:length(time)` is empty and the loop never advances. | Create a separate time-vector implementation and document battery equivalent-circuit assumptions. |
| `active_magnetic_bearing.m` | Simplified state update and auxiliary calculations; several variables are calculated but not returned or used. | Define state variables, units, actuator dynamics and control law. |
| `hybridControl.m` | Action routines print messages only; they do not operate Raspberry Pi GPIO or real devices. | Define explicit outputs and testable control logic before any hardware integration. |

These are engineering review observations, not a substitute for a full code audit or validation.

## Recommended validation sequence

### Stage 1 — Preserve and identify the source
- Retain the current dissertation-derived files as a historical reference.
- Record the dissertation chapter/page for each function.
- Do not overwrite the source-derived files with revised equations.
- Keep a change log for any future corrected model.

### Stage 2 — Syntax and execution
- Open each function in MATLAB or GNU Octave.
- Check that the filename matches the primary function name.
- Run a basic syntax check and resolve only transcription/formatting errors in the source copy.
- Record software version, date and any warnings.
- Save the exact input values and outputs used for each test.

### Stage 3 — Unit and boundary checks
- Check dimensions and SI units for every intermediate variable.
- Test zero input, nominal input, and boundary conditions.
- Check sign conventions, saturation limits and physically meaningful output ranges.
- Test vector inputs only where the function is intended to support them.

### Stage 4 — Improved models (separate files)
- Create clearly named revised implementations in a separate folder, for example `Improved_Models/`.
- Explain the equations, assumptions, parameter sources and changes.
- Add repeatable test scripts and expected results.
- Compare revised model outputs with analytical calculations or published reference data.

### Stage 5 — System-level validation
- Integrate only validated subsystem models.
- Define energy-flow and control interfaces.
- Check energy balance, converter losses, battery state of charge and operating constraints.
- Compare simulation results with measured data if a physical test platform becomes available.

## Test record template

For every executed test, record:

| Field | Record |
|---|---|
| Function and version | File name / Git commit |
| MATLAB or Octave version | Exact version |
| Test case | Purpose and boundary condition |
| Inputs | Values with units |
| Expected behaviour | Analytical or documented expectation |
| Actual output | Numeric output / warning / error |
| Result | Pass / fail / needs investigation |
| Evidence | Test script, output capture or log |

## Publication rule

Until the functions have been executed and checked, describe them as **selected dissertation-derived MATLAB function listings**. After validation, report exactly which tests passed and which limitations remain. Never imply that the complete hybrid system has been experimentally validated based only on these function listings.
