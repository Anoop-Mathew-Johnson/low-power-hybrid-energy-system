% run_validation.m
% Initial runtime test harness for the dissertation-derived MATLAB functions.
% Run from the repository root in GNU Octave or MATLAB:
%   run('Tests/run_validation.m')
%
% These tests check execution and selected known behaviours. They do not
% validate the physical accuracy of the underlying engineering models.

rootDir = fileparts(fileparts(mfilename('fullpath')));
addpath(genpath(rootDir));

fprintf('\nHybrid Energy System - initial function execution tests\n');
fprintf('Environment: %s\n', version());
fprintf('------------------------------------------------------\n');

% 1. Mechanical-bearing VAWT
[p0, t0] = calculateVAWTPowerAndTorque(0, 0);
assert(isfinite(p0) && isfinite(t0), 'Mechanical VAWT zero-input test failed.');
[p5, t5] = calculateVAWTPowerAndTorque(5, 1);
assert(isfinite(p5) && isfinite(t5), 'Mechanical VAWT nominal-input test failed.');
fprintf('PASS: calculateVAWTPowerAndTorque executes for zero and nominal inputs.\n');

% 2. AMB VAWT
[pAmb, tAmb] = calculateAMBPowerAndTorque(5, 1);
assert(isfinite(pAmb) && isfinite(tAmb), 'AMB VAWT execution test failed.');
fprintf('PASS: calculateAMBPowerAndTorque executes for a nominal input.\n');

% 3. Vertical-axis turbine
motionNormal = verticalAxisWindTurbine(15, 10);
motionOutside = verticalAxisWindTurbine(5, 10);
assert(isfinite(motionNormal) && isfinite(motionOutside), ...
    'Vertical-axis turbine execution test failed.');
fprintf('PASS: verticalAxisWindTurbine executes in both branches.\n');

% 4. Electromagnetic-force function
force = calculateElectromagneticForce(12);
assert(isfinite(force), 'Electromagnetic-force execution test failed.');
fprintf('PASS: calculateElectromagneticForce executes. Returned value: %.6g\n', force);
fprintf('REVIEW: returned value is not yet established as a physically valid force.\n');

% 5. Simplified PMSG function
pmsg = pmsg_power_output(100);
assert(isfinite(pmsg), 'PMSG execution test failed.');
fprintf('PASS: pmsg_power_output executes. Returned value: %.6g\n', pmsg);

% 6. Buck converter / battery routine
[batteryV, batteryI] = simulateBuckConverter(100);
assert(isfinite(batteryV(1)) && isfinite(batteryI), ...
    'Buck converter execution test failed.');
assert(batteryV(1) == 12, 'Unexpected initial battery voltage.');
fprintf('PASS: simulateBuckConverter executes. Battery voltage returned: %.6g V\n', batteryV(1));
fprintf('KNOWN LIMITATION: scalar time means the voltage-update loop performs no iterations.\n');

% 7. Active magnetic bearing - nonzero input
omega = active_magnetic_bearing(1, 2);
assert(isfinite(omega), 'AMB nonzero-input execution test failed.');
fprintf('PASS: active_magnetic_bearing executes for nonzero rotational input.\n');

% 8. Active magnetic bearing - zero-input diagnostic
omegaZero = active_magnetic_bearing(0, 0);
if isnan(omegaZero) || isinf(omegaZero)
    fprintf('EXPECTED ISSUE CONFIRMED: active_magnetic_bearing(0,0) returns NaN/Inf.\n');
else
    fprintf('REVIEW: zero-input AMB result was finite; inspect this version of the function.\n');
end

% 9. Supervisory controller - placeholder actions
fprintf('\nTesting hybridControl placeholder actions:\n');
hybridControl(20, 5, 1, 11, 150);
fprintf('PASS: hybridControl executes with scalar test inputs.\n');
fprintf('LIMITATION: printed messages are placeholders, not hardware control.\n');

fprintf('\nExecution tests completed. These results do not constitute physical model validation.\n');
