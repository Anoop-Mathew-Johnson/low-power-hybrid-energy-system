# Code Notes and Modelling Limitations

## Provenance

The MATLAB functions in this repository are selected code listings transcribed from Chapter 4 of the MSc dissertation, *Designing a Low Power Hybrid System to Power IoT Applications* (Glasgow Caledonian University, 2023). The intent is to make a representative sample of the original academic modelling work available for review.

The functions are not claimed to be a complete simulation package, validated engineering models, or working embedded-control software. Formatting and line wrapping have been normalised for readability; the underlying modelling approach has not been silently redesigned.

## Files

| File | Purpose represented in the dissertation |
|---|---|
| `calculateVAWTPowerAndTorque.m` | VAWT power and torque with mechanical-bearing parameters |
| `calculateAMBPowerAndTorque.m` | VAWT power and torque with an AMB-related torque term |
| `verticalAxisWindTurbine.m` | Simplified rotor rotational-motion calculation |
| `calculateElectromagneticForce.m` | Four-electromagnet force calculation |
| `pmsg_power_output.m` | Simplified PMSG output relationship |
| `simulateBuckConverter.m` | Buck-converter and battery behaviour illustration |
| `active_magnetic_bearing.m` | Simplified AMB angular-velocity calculation |
| `hybridControl.m` | Supervisory control logic with illustrative action routines |

## Limitations to understand before reuse

1. **Trigonometric units:** The VAWT functions define a pitch angle in degrees but use MATLAB `sin` and `cos`, which interpret inputs as radians. The comments and model intent should therefore not be taken as evidence that the angle conversion is physically correct.
2. **Simplified aerodynamic model:** The turbine functions use simplified force, area and angular-velocity relationships. They do not represent a complete aerodynamic or validated Savonius rotor model.
3. **AMB representation:** The AMB torque and force expressions are simplified illustrative relationships. A real AMB requires electromagnetic actuator modelling, rotor dynamics, sensing, feedback control, stability analysis and power-electronics design.
4. **Electromagnetic force:** The function named `calculateElectromagneticForce` follows the dissertation's stated equations. The relationship between magnetic field, coil resistance and force is not a general Lorentz-force formulation and requires engineering review before physical interpretation.
5. **PMSG output:** The PMSG function uses a compact proportional expression. It does not model a complete generator equivalent circuit, rectifier, losses, load or operating limits.
6. **Battery routine:** The original routine defines `time = 30` as a scalar. Consequently, `length(time)` is one and the loop does not perform a multi-step voltage simulation. The voltage output remains the initial value in this implementation. Battery voltage is also not generally a simple linear function of current alone.
7. **Hybrid controller:** The action functions in `hybridControl.m` are placeholders that print messages. They do not interface with Raspberry Pi GPIO, sensors, relays, converters or actual equipment. The thresholds are illustrative and not safety settings.
8. **Simulation integration:** The repository does not contain the complete Simulink model, solver settings, test data or hardware implementation. Individual functions should not be assumed to reproduce the full dissertation simulation by themselves.
