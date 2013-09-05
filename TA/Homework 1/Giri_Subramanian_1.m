%% Problem 1

t = 0:0.1:3;
Ts = 38;
T0 = 120;
k = 0.45;

T = Ts + (T0-Ts)*exp(-k*t);
T_end = T(end);

plot(t,T)
xlabel('Time (hours)')
ylabel('Temperature (Fahrenheit)')
print -dpng Giri_Subramanian_HW_1_Problem_1.png

%% Problem 2

m = 1.67*10^-27;
q = 1.6*10^-19;
B0 = 0.35;
v_perp = 4.69*10^6;
v_parallel = 1;

rho = (m*v_perp)/(q*B0);
omega = q*B0/m;

fprintf('The value of radius is %d m and that of the cyclotron frequency is %d rad/s \n', rho,omega);
t = 0:0.1:10;
x = rho*cos(omega*t);
y = rho*sin(omega*t);
z = v_parallel*t;

plot3(x,y,z)
xlabel('x')
ylabel('y')
zlabel('z')
grid on
print -dpng Giri_Subramanian_HW_1_Problem_2a.png

% Since it's moving perpendicular to the same magnetic field, it's parallel
% velocity is zero. But since the overall speed is the same, the
% perpendicular velocity will increase. Since frequency does not depend on
% the speed of the particle it will not change. 

v_perp_new = sqrt(v_perp^2 + v_parallel^2);
rho_new = (m*v_perp_new)/(q*B0);
fprintf('The new value of radius is %d m \n', rho_new);


%% Problem 3

t = 0:0.05:8;
v = -8:0.1:8;
z = exp(-t/2).*cos(20*t - 6);
u = 6*log10(v.^2 + 20);
subplot(1,2,1)
plot(t,z)
xlabel('t')
ylabel('z')
text(3,0.8,'z = e^{-t/2}cos(20t-6)','FontSize',20)
subplot(1,2,2)
plot(v,u)
xlabel('v')
ylabel('u')
text(-2,11.5,'u = 6log_{10}(v^2 + 20)','FontSize',20)

print -dpng Giri_Subramanian_HW_1_Problem_3.png

%%  Problem 4

% All values taken here are in ratio to the chord
airfoil = input('Please enter the 4 digit NACA airfoil number alone: ');

if floor(airfoil/10000) ~= 0
    fprintf('Please input only a 4 digit number \n')
    return
end
t = mod(airfoil,100)/100;
p = mod(floor(airfoil/100),10)/10;
m = floor(airfoil/1000)/100;

x = 0:0.001:1;

max_camber_index = find(x==p);

y_camb(1:max_camber_index) = (m/p^2)*(2*p*x(1:max_camber_index) - x(1:max_camber_index).^2);
y_camb(max_camber_index+1:length(x)) = (m/(1-p)^2)*((1 - 2*p) + 2*p*x(max_camber_index+1:length(x)) - x(max_camber_index+1:length(x)).^2);

y_thick = (t/0.2)*(0.29690*sqrt(x) - 0.126*x - 0.3516*x.^2 + 0.2843*x.^3 - 0.1015*x.^4);

y_u = y_camb + y_thick;
y_d = y_camb - y_thick;

h = plot(x,y_u,x,y_d,x,y_camb);
axis equal
legend('Upper surface','Lower Surface', 'Camber line');
if floor(airfoil/100) == 0
    title_string = sprintf('Plot of airfoil NACA 00%d',airfoil);
else
    title_string = sprintf('Plot of airfoil NACA %d',airfoil);
end
title(title_string)
xlabel('x/c')
ylabel('y/c')
set(h,'LineWidth',2)
print -dpng Giri_Subramanian_HW_1_Problem_4.png

