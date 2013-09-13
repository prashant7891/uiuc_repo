
data = importdata('USAtmos1976.dat');
atmos_data = data.data;

alt = atmos_data(:,1);
sound_speed = atmos_data(:,8);

speed = input('Please enter the speed of the vehicle (in m/s): ');
user_alt = input('Please enter the altitude (in km): ');

% Checking if given altitude is within limits
if user_alt < min(alt) || user_alt > max(alt)
    fprintf('Please enter an altitude value in the range %d:%d kms \n', min(alt),max(alt))
end

% Linearly interpolating to find the value of the speed of sound at the
% given altitude
user_sound_speed = interp1(alt,sound_speed,user_alt);

M = speed/user_sound_speed;

if M < 0.8
    type = 'subsonic';
elseif M > 0.8 && M < 1.2
    type = 'transonic';
elseif M > 1.2 && M < 5
    type = 'supersonic';
else
    type = 'hypersonic';
end

fprintf(' The mach number of the given aircraft is %d and it is %s \n', M , type);
    
