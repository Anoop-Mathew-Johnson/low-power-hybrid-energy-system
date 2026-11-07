# Source Provenance: Dissertation-to-Repository Mapping

The MATLAB files in this repository correspond to selected function listings in the author's MSc dissertation, *Designing a Low Power Hybrid System to Power IoT Applications* (Glasgow Caledonian University, 2023).

The page numbers below are the **printed page numbers in the dissertation**, not the PDF viewer page indices. Repository files include formatting and explanatory comments for readability. The repository does not include the complete Simulink models shown in the dissertation.

| Repository file | Dissertation section | Printed page(s) | Listing / subject |
|---|---|---:|---|
| `01_Wind_Turbine_Modelling/calculateVAWTPowerAndTorque.m` | 4.1.1.2 | 32–33 | Mechanical-bearing VAWT power and torque |
| `01_Wind_Turbine_Modelling/calculateAMBPowerAndTorque.m` | 4.1.2.2 | 34–35 | AMB-related VAWT power and torque |
| `02_Electromagnetic_System/calculateElectromagneticForce.m` | 4.2.1 | 37–38 | Electromagnetic-force calculation |
| `01_Wind_Turbine_Modelling/verticalAxisWindTurbine.m` | 4.2.2 | 38–39 | Vertical-blade rotor rotational motion |
| `05_Hybrid_Control/active_magnetic_bearing.m` | 4.2.3 | 40–41 | AMB-related angular-velocity calculation |
| `03_Generator_Modelling/pmsg_power_output.m` | 4.2.4 | 41 | Generator / PMSG output relationship |
| `04_Battery_and_Converter/simulateBuckConverter.m` | 4.2.5 | 41–42 | Buck-converter and battery calculation |
| `05_Hybrid_Control/hybridControl.m` | 4.3.2 | 43–46 | MATLAB function listing for proposed Raspberry Pi control approach |

## Related dissertation material

- **Chapter 3, printed pages 25–30:** bearing calculations, solar PV assumptions, Savonius turbine assumptions, electromagnetic subsystem calculations and control requirements.
- **Chapter 4, printed pages 32–46:** turbine, hybrid-system and control model descriptions and MATLAB function listings.
- **Chapter 5, printed pages 47–51:** performance figures, bearing comparison and proposed hybrid-model results.
- **Chapter 6, printed page 52:** conclusions.
- **Chapter 7, printed page 53:** future work, including magnetic-field interaction analysis, further integrated control-system simulation and hardware setup.

## Important distinction

The dissertation includes Simulink diagrams and discusses simulation of the proposed system. The MATLAB functions published here are selected listings only. They are not the complete Simulink model and do not, by themselves, reproduce all the dissertation's reported figures and tables.

The repository's code comments and formatting have been edited for readability. The files should be described as dissertation-derived or transcribed listings, not as a byte-for-byte archival copy of the original dissertation source.
