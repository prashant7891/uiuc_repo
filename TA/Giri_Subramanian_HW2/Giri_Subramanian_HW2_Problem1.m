
data = importdata('USAtmos1976.dat');
atmos_data = data.data;

alt = atmos_data(:,1);
temp = atmos_data(:,5);
pressure = atmos_data(:,6);
density = atmos_data(:,7);

subplot(3,1,1)
plot(temp,alt);
xlabel('Temperature(K)')
ylabel('Altitude(km)')
title('Altitude vs Temperature')

subplot(3,1,2)
plot(pressure,alt);
xlabel('Pressure(N/m^2)')
ylabel('Altitude(km)')
title('Altitude vs Pressure')

subplot(3,1,3)
plot(density,alt);
xlabel('Density(kg/m^3)')
ylabel('Altitude(km)')
title('Altitude vs Density')
