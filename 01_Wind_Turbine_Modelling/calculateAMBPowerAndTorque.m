function [power, torque] = calculateAMBPowerAndTorque(windSpeed, time)
% calculateAMBPowerAndTorque
% Original MSc dissertation function: VAWT with active magnetic bearing.
% Inputs: windSpeed (m/s), time (s). Outputs: power (W), torque (N m).
% Note: Simplified illustrative model; not an experimentally validated AMB.

% Turbine specifications
rotorRadius = 0.3;       % m
bladeLength = 0.6;       % m
bladeWidth = 0.5;        % m
airDensity = 1.225;      % kg/m^3

% Active magnetic bearing specifications
ambControlCurrent = 0.9375; % A
ambTorqueConstant = 0.155;  % N m/A
ambMaxCurrent = 1.0;        % A
ambMaxTorque = ambMaxCurrent * ambTorqueConstant;

% Magnetic field specification
magneticFieldStrength = 0.375; % T

% Calculate area and pitch angle
bladeArea = bladeLength * bladeWidth;
pitchAngle = 10; % degrees (original function uses sin/cos)

% Calculate aerodynamic force and angular velocity
windArea = bladeArea * sin(pitchAngle);
aerodynamicForce = 0.5 * airDensity * windArea * windSpeed^2;
angularVelocity = windSpeed / rotorRadius;

% Calculate mechanical torque from wind
mechanicalTorque = aerodynamicForce * rotorRadius * cos(pitchAngle);

% Calculate AMB torque and electromagnetic force
ambTorque = min(ambControlCurrent * ambTorqueConstant, ambMaxTorque);
ambForce = ambControlCurrent * ambTorqueConstant * magneticFieldStrength;

% Calculate total torque and power
torque = mechanicalTorque - ambTorque;
power = torque * angularVelocity;

% Illustrative sine-wave variation
sineFrequency = 0.1;
sineAmplitude = 0.1;
sineWave = sineAmplitude * sin(sineFrequency * time);
power = max(power + sineWave, 0);
torque = max(torque + sineWave, 0);

fprintf('Power: %.2f Watts\n', power);
fprintf('Torque: %.2f Nm\n', torque);
fprintf('Electromagnetic Force: %.2f N\n', ambForce);
end
