# Future Work and Technical Considerations

This document separates future work explicitly identified in the MSc dissertation from additional technical considerations visible in the published MATLAB listings and reported results.

## Future work identified in the dissertation

Chapter 7 identifies three principal areas:

1. **Magnetic-field interaction analysis:** Examine the strength, direction and distribution of magnetic fields produced by the electromagnetic subsystem and AMB; investigate their interaction and possible effects on AMB stability and performance; consider electromagnetic interference and optimisation.
2. **Integrated control-system simulation:** Develop a simulation model including the electromagnetic system, AMB and Raspberry Pi module; integrate control algorithms; tune the control response; and conduct sensitivity analysis under parameter variation and external disturbances. The dissertation also suggests a real-time simulation environment before hardware deployment.
3. **Hardware implementation:** Select and acquire components, assemble and integrate the proposed model, and implement the control algorithms on a hardware platform with Raspberry Pi, control hardware and sensors.

These are recorded as future work in the dissertation. This repository does not claim that they were completed.

## Additional technical considerations from the repository code review

The following issues are visible in the selected MATLAB listings. They are documented to help readers interpret the code; the functions are being preserved as dissertation-derived material rather than silently rewritten.

- **Angle convention:** The mechanical-bearing function labels the pitch angle as degrees and its dissertation listing comment mentions `sind()`, but the expression uses `sin()`. The AMB-related function also labels the angle in degrees while using `sin()` and `cos()`.
- **Aerodynamic model:** The turbine calculations are simplified and do not constitute a validated aerodynamic model of a Savonius rotor.
- **AMB model:** The AMB-related calculations do not implement a complete magnetic actuator, rotor-dynamic and closed-loop control model.
- **Electromagnetic force:** The force-like calculation is based on simplified dissertation relationships and is not dimensionally established as a general Lorentz-force model.
- **Electromagnetic branch units:** The VAWT function accepts an input named `electromagneticForce` but subsequently uses it as a magnetic-field quantity in further expressions. Its physical units and interpretation need to be re-derived.
- **PMSG model:** The generator function is a simple proportional relationship and omits a full machine model, losses, rectifier and load.
- **Battery/converter model:** The time variable is scalar in the published function, so its voltage-update loop does not execute. The routine is not a dynamic battery or switching-converter model.
- **Supervisory control:** The control function's action routines only print status messages. It is not an operational Raspberry Pi implementation and does not provide hardware-level safety or protection.
- **Net energy balance:** Chapter 3 estimates 9 W for four electromagnets. Any future comparison of system efficiency should explicitly account for AMB and electromagnetic auxiliary consumption, along with converter and control losses.

## Results interpretation issue to retain transparently

Chapter 5, Table 3 reports wind contribution of about 0.286–0.288 W for wind speeds from 10 m/s through 25 m/s, while values outside this range are around 78.6–78.8 W. Chapter 5's accompanying discussion describes low wind contribution in the 10–25 m/s interval. Chapter 6, however, describes 10–25 m/s as the optimal performance range.

The repository preserves the table values and records this discrepancy rather than selecting one interpretation without further evidence.

Chapter 5, Table 2 reports higher output for the AMB-related model than the mechanical-bearing model. Chapter 3 separately estimates 9 W for four electromagnets, but the comparison table does not clearly state whether this auxiliary demand is deducted. A net-efficiency claim would require that energy balance to be resolved.

## Possible next research steps

A technically stronger follow-on study could:

1. Re-derive the turbine aerodynamics, electromagnetic force, AMB actuator and PMSG equations with consistent SI units and documented parameter sources.
2. Correct and document angle conventions and the wind-speed branch logic, preserving a separate record of the original dissertation implementation.
3. Build an integrated time-domain model with explicit power paths, converter dynamics, battery state of charge and auxiliary loads.
4. Define a control architecture with measurable inputs, explicit outputs, operating limits, interlocks and fault handling.
5. Run repeatable simulation cases and sensitivity analysis.
6. Compare selected model outputs against analytical calculations and, if feasible, laboratory measurements.
7. Develop a hardware prototype only after the models, energy balance and protection requirements have been independently reviewed.

These are recommendations for further work, not claims about work already completed.
