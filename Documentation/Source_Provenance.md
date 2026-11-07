# Source Provenance Map

## Primary source

Anoop Johnson, MSc dissertation, *Designing a Low Power Hybrid System to Power IoT Applications*, Glasgow Caledonian University, 2023. Chapter 4, **System Model**.

The page references below are the printed page numbers visible in the dissertation, not PDF viewer page indices.

| Repository file | Dissertation section | Printed pages |
|---|---|---:|
| `calculateVAWTPowerAndTorque.m` | 4.1.1.2 — Mechanical Bearing MATLAB Function | 32–33 |
| `calculateAMBPowerAndTorque.m` | 4.1.2.2 — Wind Turbine with AMB MATLAB Function | 34–35 |
| `calculateElectromagneticForce.m` | 4.2.1 — MATLAB Function Defining Electromagnetic System | 37–38 |
| `verticalAxisWindTurbine.m` | 4.2.2 — MATLAB Function Defining Vertical Blades | 38–39 |
| `active_magnetic_bearing.m` | 4.2.3 — MATLAB Function Defining AMB | 40–41 |
| `pmsg_power_output.m` | 4.2.4 — MATLAB Function Defining Generator | 41 |
| `simulateBuckConverter.m` | 4.2.5 — MATLAB Function Defining Battery | 41–42 |
| `hybridControl.m` | 4.3.2 — MATLAB Function for Raspberry Pi | 43–45 |

## Transcription notes

- Code was transcribed from the dissertation's text listings and formatted as individual `.m` files.
- Line wrapping and indentation were normalised where required.
- In `hybridControl.m`, the final MATLAB keyword was normalised to lowercase `end` so the function file uses MATLAB syntax consistently.
- Explanatory comments were added to make provenance and known limitations clear. They are not claims that the dissertation contained those exact comments.
- No model equations have intentionally been corrected in the dissertation-derived source files.
- Where the dissertation or code listings contain questionable equations, units, assumptions or conflicting result interpretations, the concerns are described in [Code Notes](Code_Notes.md) and [Future Work and Technical Considerations](Future_Work_and_Technical_Considerations.md).

## Important distinction

A source transcription is not the same as a validated reproduction of the dissertation's Simulink results. The full Simulink diagrams, block parameters, solver settings, test data and complete simulation project are not published in this repository. The function files should therefore be treated as selected source listings, not as a complete executable reproduction of the research.

The repository preserves the dissertation-derived function approach for traceability. Any corrected or improved equations should be introduced in separately named future versions with their derivations documented, rather than silently replacing the original listings.
