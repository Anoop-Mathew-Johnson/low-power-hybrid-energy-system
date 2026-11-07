function electromagneticForce = calculateElectromagneticForce(batteryVoltage)
% calculateElectromagneticForce
% Original MSc dissertation function for a four-electromagnet arrangement.
% Input: batteryVoltage (V). Output: calculated model force (N, as labelled
% in the dissertation; the physical force relationship requires validation).

% Electromagnet parameters
magnetStrength = 0.5; % T (as specified in the dissertation)
coilResistance = 2.4; % Ohms

% Number of electromagnets
numMagnets = 4;

% Calculate current using Ohm's law
batteryCurrent = batteryVoltage / coilResistance;

% Calculate magnetic field strength using the dissertation relationship
magneticField = magnetStrength * batteryCurrent;

% Calculate force per magnet using the dissertation relationship
forcePerMagnet = magneticField * coilResistance;

% Calculate overall electromagnetic force
electromagneticForce = numMagnets * forcePerMagnet;
end
