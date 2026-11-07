function generated_power = pmsg_power_output(angular_velocity)
% pmsg_power_output
% Original MSc dissertation function for simplified PMSG power estimation.
% Input: angular_velocity. Output: generated_power (model output).

% Constants and parameters
generator_constant = 0.1;
magnetic_field_strength = 0.05; % T
area_of_coil = 0.1; % m^2
number_of_turns = 50;

% Calculate generated power using the original dissertation relationship
generated_power = generator_constant * magnetic_field_strength ...
    * area_of_coil * number_of_turns * angular_velocity;
end
