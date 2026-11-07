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


## Initial validation pass (2026-11-07)

### What was checked

- Retrieved all eight published `.m` files from the repository and reviewed their function declarations, file-name matches, block endings, control-flow structure and principal calculations.
- Compared the dissertation-derived calculations with the source listings in Chapter 4.
- Performed hand-calculated numerical spot checks of the VAWT equations for selected wind speeds.
- Reviewed boundary conditions and identified cases where the equations produce undefined or misleading values.

### Results

| Check | Result | Interpretation |
|---|---|---|
| Primary function name vs. filename | Pass on visual inspection for all 8 files | Names match the repository filenames. This is not a MATLAB parser result. |
| Function/control block structure | No obvious unmatched `if`/`end` or function endings found in manual review | Still requires MATLAB/Octave parsing. |
| VAWT spot checks at 0, 5, 10 and 25 m/s | Calculations produce finite values in the hand-calculated cases | These are calculations of the current equations, not validation that the equations are physically correct. |
| Battery loop | Fails intended time-series behaviour | `time = 30` is scalar, so `2:length(time)` is empty and the update loop executes zero times. |
| AMB zero-motion boundary | Fails numerical robustness | At zero input rotational motion, bearing force and stiffness are zero; the damping expression evaluates as zero multiplied by infinity, producing NaN in IEEE floating-point arithmetic. |
| Electromagnetic force dimensional check | Fails physical dimensional consistency | The output equation does not yield force units from the stated quantities. |
| Hybrid control hardware test | Not applicable / not implemented | Action functions only display text; they do not operate sensors or hardware. |

### VAWT hand-calculation spot checks

Using the current mechanical-bearing function's equations, `pitchAngle = 10` is passed to MATLAB's `sin` and `cos` functions as 10 radians, despite the comment identifying degrees. With that exact current implementation, the raw calculated values before the sine-wave perturbation are approximately:

| Wind speed | Raw torque | Raw power |
|---:|---:|---:|
| 0 m/s | 0.000 N m | 0.000 W |
| 5 m/s | 0.462 N m | 7.707 W |
| 10 m/s | 2.183 N m | 72.766 W |
| 25 m/s | 14.894 N m | 1,241.131 W |

These values only confirm the arithmetic of the implemented formula for those inputs. They should not be interpreted as credible turbine performance predictions.

### Runtime limitation

No MATLAB or GNU Octave executable is available in the current execution environment. Therefore, **no actual MATLAB/Octave execution, parser check, Code Analyzer run, or automated unit test has been completed**. MathWorks documents `checkcode(filename)` as a MATLAB Code Analyzer check for potential code problems; it should be run locally on the downloaded files. See: https://www.mathworks.com/help/matlab/ref/checkcode.html

### Required next runtime checks

In MATLAB, from the repository root, run:

```matlab
files = {
    '01_Wind_Turbine_Modelling/calculateVAWTPowerAndTorque.m'
    '01_Wind_Turbine_Modelling/calculateAMBPowerAndTorque.m'
    '01_Wind_Turbine_Modelling/verticalAxisWindTurbine.m'
    '02_Electromagnetic_System/calculateElectromagneticForce.m'
    '03_Generator_Modelling/pmsg_power_output.m'
    '04_Battery_and_Converter/simulateBuckConverter.m'
    '05_Hybrid_Control/active_magnetic_bearing.m'
    '05_Hybrid_Control/hybridControl.m'
};

for k = 1:numel(files)
    fprintf('\n--- %s ---\n', files{k});
    checkcode(files{k});
end
```

Then run controlled test cases for each function, capture the MATLAB release, inputs, outputs and warnings, and add only the actual results to this report. Do not mark the code as runtime-tested until this step is complete.
