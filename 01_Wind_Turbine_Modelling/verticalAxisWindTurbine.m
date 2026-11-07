function rotationalMotion = verticalAxisWindTurbine(windSpeed, electromagneticForce)
% verticalAxisWindTurbine
% Original MSc dissertation function for simplified VAWT rotational motion.
% Inputs: windSpeed (m/s), electromagneticForce (model force input).
% Output: rotationalMotion (incremental angular displacement, rad).

% Constants
rho = 1.225; % Air density, kg/m^3
rotorRadius = 0.6; % m
momentOfInertia = 10; % kg*m^2
dampingCoefficient = 0.5;
electromechanicalEfficiency = 0.8; %#ok<NASGU>
bladeArea = pi * rotorRadius^2;

% Aerodynamic coefficients
C_L = 0.8;
C_D = 0.5;

% Permanent magnet specifications
magnetLength_m = 0.2;
magnetWidth_m = 0.15;
magnetHeight_m = 0.2;
magnetStrength_T = 0.5;

% Additional constants
permeability = 4 * pi * 10^-7;
distance_m = 0.3;

% Calculate aerodynamic or electromagnetic torque
if windSpeed < 10 || windSpeed > 25
    % Electromagnetic-force branch from the original dissertation model
    magneticFieldStrength_T = electromagneticForce / (permeability * distance_m); %#ok<NASGU>
    permanentMagnetStrength_T = electromagneticForce;
    repulsiveForce = (permanentMagnetStrength_T^2) / ...
        (2 * permeability * distance_m^2);
    leverArm_m = distance_m / 2;
    electromagneticTorque = repulsiveForce * leverArm_m;
    totalTorque = electromagneticTorque;
else
    liftForce = 0.5 * rho * windSpeed^2 * bladeArea * C_L;
    dragForce = 0.5 * rho * windSpeed^2 * bladeArea * C_D;
    aerodynamicTorque = (liftForce - dragForce) * rotorRadius;
    totalTorque = aerodynamicTorque;
end

% Simplified single-step Euler calculation
angularVelocity = 0; % Initial angular velocity in original function
angularAcceleration = totalTorque / momentOfInertia ...
    - dampingCoefficient * angularVelocity;
dt = 0.01;
angularVelocity = angularVelocity + angularAcceleration * dt;
rotationalMotion = angularVelocity * dt;

fprintf('Magnet Length: %.2f meters\n', magnetLength_m);
fprintf('Magnet Width: %.2f meters\n', magnetWidth_m);
fprintf('Magnet Height: %.2f meters\n', magnetHeight_m);
fprintf('Magnet Strength: %.2f T\n', magnetStrength_T);
end
