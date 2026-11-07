function [batteryVoltage, batteryCurrent] = simulateBuckConverter(powerGenerated)
% simulateBuckConverter
% Original MSc dissertation function for a simplified buck-converter /
% battery model. Input: powerGenerated. Outputs: battery voltage/current.
% Note: The original code defines time as a scalar (30), so the loop has
% one element and no voltage time-series update occurs without revision.

% Buck converter specifications
buckEfficiency = 0.90;

% Battery specifications
time = 30; % seconds (as defined in the original dissertation)
batteryVoltageInitial = 12; % V
batteryCapacity = 70; % Ah
batteryVoltageMin = 10.5; % V
batteryVoltageMax = 14.0; % V

% Battery discharge parameters
dischargeRate = 0.5; % C-rate

% Calculate load power and battery current
loadPower = powerGenerated / buckEfficiency;
batteryCurrent = loadPower / batteryVoltageInitial;

% Calculate discharge current limit
dischargeCurrent = batteryCapacity * dischargeRate;
if batteryCurrent > dischargeCurrent
    error('Load power exceeds battery discharge capability.');
end

% Simulate battery voltage over time (original scalar-time implementation)
batteryVoltage = zeros(size(time));
batteryVoltage(1) = batteryVoltageInitial;
for i = 2:length(time)
    deltaVoltage = batteryCurrent * (1 / 3600);
    batteryVoltage(i) = batteryVoltage(i - 1) - deltaVoltage;
    batteryVoltage(i) = min(max(batteryVoltage(i), ...
        batteryVoltageMin), batteryVoltageMax);
    loadPower = batteryCurrent * batteryVoltage(i) * buckEfficiency;
    batteryCurrent = loadPower / batteryVoltage(i);
end
end
