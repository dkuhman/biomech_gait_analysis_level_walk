%Clear workspace and load data
clear all; clc
load('grf_gait_events_data.mat')

%Isolate vertical GRF 
grf_z = data.grf_z;

%Select only the first step
[heel_strikes, toe_offs] = gait_events_grf(grf_z);
grf_z = grf_z(heel_strikes(1):toe_offs(1));

%Nirmalize the data to 0-100%
x = linspace(0, 99, length(grf_z));
y = 0:99;
grf_z_normed = spline(x, grf_z, y);

%Plot the initial and normalized signals
figure
subplot(2,1,1)
plot(grf_z, 'b', 'LineWidth', 2)
xlim([0 length(grf_z)])
title('Original Signal')
xlabel('Frames')
ylabel('Vertical GRF (N)')
subplot(2,1,2)
plot(grf_z_normed, 'b', 'LineWidth', 2)
xlim([0 100])
title('Normalized Signal')
xlabel('Normalized Time (0-100%)')
ylabel('Vertical GRF (N)')