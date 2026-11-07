# Research Methodology and Individual Contribution

## Project context

**Dissertation:** *Designing a Low Power Hybrid System to Power IoT Applications*  
**Degree:** MSc Electrical & Electronics Engineering, Glasgow Caledonian University (2022–2023)

The project investigated a proposed hybrid renewable-energy concept for low-power Power IoT applications. The concept brought together solar photovoltaic generation, a Savonius-type vertical-axis wind turbine, energy conversion, battery storage and supervisory control.

## Problem addressed

Low-power connected applications require an energy supply that can remain available when one renewable source is intermittent. The project explored a hybrid approach in which solar and wind resources could complement one another, with battery storage supporting energy availability and the proposed auxiliary electromagnetic and bearing systems.

## Work represented in the dissertation

The Chapter 4 MATLAB listings cover the following modelling activities:

1. A simplified VAWT power and torque calculation with mechanical-bearing parameters.
2. A related VAWT calculation incorporating an AMB-related torque term.
3. A simplified rotor rotational-motion calculation using either aerodynamic or electromagnetic input.
4. An illustrative electromagnetic-force calculation for four electromagnets.
5. A simplified PMSG output relationship based on angular velocity.
6. A basic buck-converter and battery calculation.
7. An AMB-related angular-velocity and auxiliary parameter calculation.
8. Threshold-based supervisory logic using temperature, wind velocity, current, voltage and light-intensity inputs.

The dissertation also presents Simulink model diagrams for subsystem and hybrid-system concepts. The repository publishes selected MATLAB function listings, not the full Simulink model.

## Methodology summary

The work can be described as a simulation-oriented engineering study:

- Define a proposed hybrid renewable-energy architecture.
- Represent selected wind-turbine, electromagnetic, generator, storage/converter and control behaviours using MATLAB function blocks.
- Combine selected subsystem concepts within a MATLAB/Simulink modelling workflow.
- Consider operating conditions and threshold-based source/control decisions.
- Discuss the suitability of the concept for low-power IoT applications.

Do not claim quantitative performance validation, experimental verification, or hardware deployment unless supported by additional test records.

## Individual contribution statement

The following is a cautious portfolio statement based on the dissertation content. Keep it only if it accurately reflects the work you personally completed:

> I developed an MSc research project investigating a low-power hybrid renewable-energy concept for Power IoT applications. The work explored the integration of solar PV and a Savonius-type vertical-axis wind subsystem with generator, battery-storage and power-management concepts. I developed MATLAB function-based representations of selected turbine, electromagnetic, PMSG, battery/converter and supervisory-control behaviours and used MATLAB/Simulink as the modelling environment to investigate the proposed system concept. The work was simulation-oriented; it did not establish a validated hardware prototype.

## What this project demonstrates

- Ability to decompose a hybrid energy concept into functional subsystems.
- Exposure to MATLAB function-based modelling and Simulink.
- Understanding of renewable generation, electrical machines, storage and power-management concepts.
- Experience translating an engineering concept into a simulation-oriented study.
- Awareness of the need to examine assumptions, units, model boundaries and validation requirements.

## Limitations and future research

The published code is preliminary and simplified. Several equations and assumptions require review before they can support quantitative engineering conclusions. The next research stage would include:

- Re-deriving the aerodynamic, electromagnetic, generator and battery models from appropriate physical relationships.
- Defining consistent SI units and documenting all parameter sources.
- Replacing placeholder control actions with explicit input/output signals and a documented control strategy.
- Modelling converter dynamics, losses, battery state of charge and component constraints.
- Developing repeatable simulation test cases and comparing outputs against analytical calculations or measured data.
- If feasible, validating selected subsystems using a laboratory prototype and instrumentation.

## Suggested short description for PhD applications

> My MSc dissertation investigated a simulation-based hybrid renewable-energy concept for low-power Power IoT applications. I worked with MATLAB/Simulink and developed function-based models representing selected wind-turbine, electromagnetic, PMSG, battery/converter and supervisory-control behaviours. The project provided a foundation in subsystem modelling and hybrid energy-system integration, while also identifying areas requiring more rigorous physical modelling and validation.
