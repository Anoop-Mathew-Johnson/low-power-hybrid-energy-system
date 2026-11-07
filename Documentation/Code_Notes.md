# Code Notes and Modelling Limitations

## Provenance

The MATLAB functions in this repository are transcriptions of selected code listings in Chapters 4.1–4.3 of the MSc dissertation, *Designing a Low Power Hybrid System to Power IoT Applications* (Glasgow Caledonian University, 2023). The source sections and printed page references are listed in [Source Provenance](Source_Provenance.md).

The repository versions include formatting and explanatory comments for readability. They should not be represented as a complete simulation package, validated engineering models or working embedded-control software.

## Function guide

| File | Dissertation section | Purpose represented in the dissertation |
|---|---|---|
| `calculateVAWTPowerAndTorque.m` | 4.1.1.2 | VAWT power and torque with mechanical-bearing parameters |
| `calculateAMBPowerAndTorque.m` | 4.1.2.2 | VAWT power and torque with an AMB-related torque term |
| `calculateElectromagneticForce.m` | 4.2.1 | Four-electromagnet force calculation |
| `verticalAxisWindTurbine.m` | 4.2.2 | Simplified rotor rotational-motion calculation |
| `active_magnetic_bearing.m` | 4.2.3 | Simplified AMB-related angular-velocity calculation |
| `pmsg_power_output.m` | 4.2.4 | Simplified PMSG output relationship |
| `simulateBuckConverter.m` | 4.2.5 | Buck-converter and battery calculation |
| `hybridControl.m` | 4.3.2 | Threshold-based supervisory logic with illustrative action routines |

## Technical observations

These observations describe limitations visible in the published listings. They are not a substitute for a full engineering review.

1. **Trigonometric units:** The mechanical-bearing function defines `pitchAngle = 10` as degrees, and the dissertation's listing comment refers to using `sind()`; however, the actual expression calls MATLAB `sin()` and `cos()`, which interpret the value as radians. The AMB-related function also labels the angle in degrees while using `sin()` and `cos()`. The code has been left unchanged to preserve the dissertation-derived implementation.
2. **Simplified aerodynamic model:** The turbine functions use simplified force, area and angular-velocity relationships. They are not a complete aerodynamic or independently validated Savonius rotor model.
3. **AMB representation:** The AMB torque and force expressions are simplified illustrative relationships. A physical AMB requires actuator and magnetic-circuit modelling, rotor dynamics, sensing, feedback control, stability analysis and power-electronics design.
4. **Electromagnetic-force relationship:** The dissertation calculates current, a magnetic-field quantity and a force-like output using simplified relationships. The implemented expression `forcePerMagnet = magneticField * coilResistance` is not, by itself, a dimensionally established general Lorentz-force equation. Its output should not be treated as a physically validated force.
5. **VAWT electromagnetic branch and threshold wording:** In `verticalAxisWindTurbine.m`, the input named `electromagneticForce` is subsequently used in expressions as though it were a magnetic-field quantity. The model's variable meanings and units therefore require review before physical interpretation. There is also a wording/logic discrepancy: the Chapter 4.2 prose says wind-driven rotation applies when wind speed is greater than 10 m/s **or** less than 25 m/s, whereas the MATLAB function selects the electromagnetic branch when wind speed is below 10 m/s **or** above 25 m/s. The latter branch condition is consistent with the pattern in Chapter 5, Table 3, but the prose condition should be checked against the author's intended design.
6. **PMSG output:** The PMSG function uses a compact proportional expression. It does not model a complete generator equivalent circuit, machine losses, rectification, load characteristics or operating limits.
7. **Battery routine:** The routine defines `time = 30` as a scalar. Consequently, `length(time)` is one and the voltage-update loop does not execute. The returned voltage therefore remains at the initial value in this implementation. The battery representation is also simplified.
8. **AMB zero-input calculation:** In `active_magnetic_bearing.m`, the internal damping calculation can encounter a zero divided by zero at zero rotational input. The returned angular velocity is calculated before that internal expression, so a finite returned value does not prove that all internal calculations are well-defined.
9. **Supervisory controller:** The action functions in `hybridControl.m` print messages. They do not interface with Raspberry Pi GPIO, sensors, relays, converters or actual equipment. The thresholds are illustrative and are not safety settings.
10. **System integration:** The repository does not contain the complete Simulink model, solver settings, test data or hardware implementation. Individual functions should not be assumed to reproduce the complete dissertation simulation by themselves.

## Interpreting the dissertation's reported results

Chapter 5, Table 2 reports higher power outputs for the AMB-related turbine model than for the mechanical-bearing model at the five listed wind speeds. The Chapter 3 sizing discussion separately estimates 9 W as the total power requirement for four electromagnets. The comparison table does not clearly show that auxiliary demand being deducted from the AMB-related output. The reported values therefore should not be interpreted as a demonstrated net-efficiency improvement.

Chapter 5, Table 3 reports wind contributions of approximately 78.6–78.8 W at 5–7.5 m/s and 27.5–30 m/s, but approximately 0.286–0.288 W between 10 and 25 m/s. Chapter 5 describes the low-output interval, while Chapter 6 calls 10–25 m/s the optimal range. This is an unresolved inconsistency in the dissertation.

The reported values are retained for traceability. They have not been independently recalculated from the complete Simulink model or experimentally verified.
