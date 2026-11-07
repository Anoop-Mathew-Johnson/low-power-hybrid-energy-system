# Research Methodology and Individual Contribution

## Project context

**Dissertation:** *Designing a Low Power Hybrid System to Power IoT Applications*  
**Degree:** MSc Electrical and Electronics Engineering, Glasgow Caledonian University  
**Study period:** 2022–2023

The project investigated a proposed hybrid renewable-energy concept for low-power IoT applications. The concept brought together solar photovoltaic generation, a Savonius-type vertical-axis wind turbine, an electromagnetic arrangement interacting with permanent magnets, an active magnetic bearing (AMB) concept, generator and battery-storage elements, and proposed supervisory control.

## Problem addressed

The dissertation considered the challenge of supplying remote and off-grid IoT applications where conventional electricity supplies may be limited. It explored a solar–wind hybrid concept and examined whether magnetic-bearing and electromagnetic arrangements could form part of the wind subsystem.

## Work represented in the dissertation

The Chapter 4 MATLAB listings cover the following modelling activities:

1. A simplified VAWT power and torque calculation with mechanical-bearing parameters.
2. A related VAWT calculation incorporating an AMB-related torque term.
3. A simplified rotor rotational-motion calculation with aerodynamic and electromagnetic branches.
4. An illustrative force calculation for a four-electromagnet arrangement.
5. A simplified PMSG output relationship based on angular velocity.
6. A basic buck-converter and battery calculation.
7. An AMB-related angular-velocity and auxiliary-parameter calculation.
8. Threshold-based supervisory logic using temperature, wind velocity, current, voltage and light-intensity inputs.

The dissertation also presents Simulink model diagrams for subsystem and hybrid-system concepts. This repository publishes selected MATLAB function listings, not the full Simulink project or all simulation assets.

## Methodology summary

The work is best described as a simulation-oriented engineering study:

- Review solar–wind hybrid systems, magnetic-bearing concepts and relevant control approaches.
- Define a proposed hybrid renewable-energy architecture and its design assumptions.
- Compare modelled mechanical-bearing and AMB-related wind-turbine behaviour.
- Represent selected turbine, electromagnetic, generator, storage/converter and supervisory-control behaviours using MATLAB function listings.
- Present the proposed subsystem and hybrid-system simulation diagrams and the performance results reported in the dissertation.
- Identify further modelling, control and hardware work required.

The dissertation's abstract states that the research was primarily conducted through mathematical calculations and theoretical explanations, with MATLAB/Simulink used to establish a simulation framework.

## Results reported in the dissertation

Chapter 5, Table 2 reports that the AMB-related turbine model produced higher power values than the mechanical-bearing model at the five listed wind speeds. At 10 m/s, the dissertation reports 72.77 W for the mechanical-bearing model and 79.03 W for the AMB-related model.

For the proposed hybrid model, Chapter 5, Table 3 reports total outputs from 24.4362 W to 108.88 W across the wind-speed cases listed. The reported wind contribution is much lower between 10 m/s and 25 m/s than outside that interval.

These are dissertation-reported model outputs, not independently validated or experimentally measured results. Chapter 6 describes 10–25 m/s as the optimal range, which conflicts with the pattern in Chapter 5, Table 3 and its accompanying discussion. Chapter 3 also estimates 9 W for four electromagnets, but the Chapter 5 bearing-comparison table does not clearly deduct this auxiliary demand from the AMB-related output.

## Individual contribution statement

The following portfolio statement is based on the dissertation's scope and listed work. Use it only to the extent that it accurately reflects the work personally completed:

> I developed an MSc research project investigating a low-power hybrid renewable-energy concept for IoT applications. The work explored the integration of solar PV and a Savonius-type vertical-axis wind subsystem with an electromagnetic arrangement, an active magnetic bearing concept, generator and battery-storage elements. I developed MATLAB function-based representations of selected turbine, electromagnetic, PMSG, battery/converter and supervisory-control behaviours and used MATLAB/Simulink as the modelling environment to investigate the proposed system concept. The project was simulation-oriented and did not establish a validated hardware prototype.

## What this project demonstrates

- Ability to decompose a hybrid energy concept into functional subsystems.
- Experience with MATLAB function-based modelling and a MATLAB/Simulink workflow.
- Exposure to renewable generation, electrical machines, storage and power-management concepts.
- Experience translating an engineering concept into a simulation-oriented study.
- Awareness of the need to examine assumptions, units, model boundaries and validation requirements.

## Limitations and further research

The published code is preliminary and simplified. Several equations and assumptions require review before they can support quantitative engineering conclusions. Further work identified by the dissertation includes magnetic-field interaction analysis, integrated control-system simulation and hardware implementation. Additional engineering work should include:

- Re-deriving aerodynamic, electromagnetic, generator and battery models from appropriate physical relationships.
- Confirming consistent SI units, sign conventions, angle conventions and parameter sources.
- Resolving the discrepancy between the proposed-model wind-speed results and the conclusion's stated optimal operating range.
- Accounting explicitly for AMB and electromagnetic subsystem power consumption in any net energy or efficiency comparison.
- Replacing placeholder control actions with explicit input/output signals and a documented control strategy.
- Modelling converter dynamics, losses, battery state of charge and component constraints.
- Developing repeatable simulation test cases and comparing outputs against analytical calculations or measured data.
- If feasible, validating selected subsystems using a laboratory prototype and instrumentation.

## Suggested short description for PhD applications

> My MSc dissertation investigated a simulation-based hybrid renewable-energy concept for low-power IoT applications. I used MATLAB/Simulink and developed function-based representations of selected wind-turbine, electromagnetic, active-magnetic-bearing, PMSG, battery/converter and supervisory-control behaviours. The project provided a foundation in subsystem modelling and hybrid energy-system integration, while identifying areas requiring more rigorous physical modelling and validation.
