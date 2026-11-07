function angular_velocity = active_magnetic_bearing(input_rotational_motion, input_voltage)
% active_magnetic_bearing
% Original MSc dissertation function for a simplified AMB response.
% Inputs: input_rotational_motion, input_voltage.
% Output: angular_velocity (updated model state).

% Constants and parameters
coil_constant = 0.01;
inertia = 0.1;

% Calculate angular acceleration
angular_acceleration = (input_voltage / coil_constant) ...
    - (input_rotational_motion / inertia);

% Update angular velocity using Euler method
time_step = 0.01;
angular_velocity = input_rotational_motion + ...
    angular_acceleration * time_step;

% Additional AMB-specific calculations from the dissertation
rotor_radius = 0.3; % m
air_gap = 0.001; % m
bearing_force = 0.5 * (input_rotational_motion / rotor_radius)^2;
bearing_stiffness = bearing_force / rotor_radius;
bearing_damping_coefficient = 2 * bearing_force * ...
    sqrt(rotor_radius / bearing_stiffness); %#ok<NASGU>

% Estimated power required by four electromagnets
electromagnet_power = 0.5 * bearing_force * air_gap^2 * 1e6; %#ok<NASGU>
end
