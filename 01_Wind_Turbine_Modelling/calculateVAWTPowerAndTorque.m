function [power, torque] = calculateVAWTPowerAndTorque(windSpeed, time)
% calculateVAWTPowerAndTorque
% Original MSc dissertation function: mechanical-bearing VAWT model.
% Inputs: windSpeed (m/s), time (s). Outputs: power (W), torque (N m).
% Note: This is the original academic model, not a validated turbine model.

% Turbine specifications
rotorRadius = 0.3;       % m
bladeLength = 0.6;       % m
bladeWidth = 0.5;        % m
airDensity = 1.225;      % kg/m^3

% Bearing specifications
bearingFrictionCoefficient = 0.01;
dynamicLoadRating = 4.75 * 1000; % N
staticLoadRating = 1.96 * 1000;  % N
fatigueLoadLimit = 0.083 * 1000; % N
referenceSpeed = 60000 / 60 * 2 * pi; % rpm to rad/s
limitingSpeed = 30000 / 60 * 2 * pi;  % rpm to rad/s
minimumLoadFactor = 0.025;
calculationFactor = 12;

% Calculate area and pitch angle
bladeArea = bladeLength * bladeWidth;
pitchAngle = 10; % degrees (original function uses sin/cos)

% Calculate aerodynamic force
windArea = bladeArea * sin(pitchAngle);
aerodynamicForce = 0.5 * airDensity * windArea * windSpeed^2;

% Calculate angular velocity
angularVelocity = windSpeed / rotorRadius;

% Calculate torque and power
torque = aerodynamicForce * rotorRadius * cos(pitchAngle) ...
    - bearingFrictionCoefficient * angularVelocity;
power = torque * angularVelocity;

% Illustrative sine-wave variation
amplitude = 0.1;
frequency = 0.1;
sineWave = amplitude * sin(2 * pi * frequency * time);
power = max(power + sineWave, 0);
torque = max(torque + sineWave, 0);

% Display results and bearing information
fprintf('Power: %.2f Watts\n', power);
fprintf('Torque: %.2f Nm\n', torque);
fprintf('Dynamic Load Rating: %.2f N\n', dynamicLoadRating);
fprintf('Static Load Rating: %.2f N\n', staticLoadRating);
fprintf('Fatigue Load Limit: %.2f N\n', fatigueLoadLimit);
fprintf('Reference Speed: %.2f rad/s\n', referenceSpeed);
fprintf('Limiting Speed: %.2f rad/s\n', limitingSpeed);
fprintf('Minimum Load Factor: %.3f\n', minimumLoadFactor);
fprintf('Calculation Factor: %.2f\n', calculationFactor);
end
