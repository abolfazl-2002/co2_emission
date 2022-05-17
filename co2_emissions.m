clear;
clc;
close all;

%% Data Analysis

% read data
data = readtable('CO2 Emissions.csv');  % read csv file
data = table2dataset(data);             % convert table to structure

Engine_Size = data(:,4);
Co2_Emissions = data(:,12);

% % plot data
% figure(1);
% hold on
% scatter(Engine_Size,Co2_Emissions);
% xlabel('Engine Size');
% ylabel('Co2 Emissions');
% hold off


%% Simple Linear Regression Model

n = length(Engine_Size); % number of elements
x = struct2array(dataset2struct(Engine_Size));
y = struct2array(dataset2struct(Co2_Emissions));

m = ( (n * sum(x.*y)) - (sum(x)*sum(y)) )...
    /( (n * sum(x.^2)) - sum(x)^2 );     % Slope
b = (sum(y) - m*sum(x)) / n;             % y-intercept

Y = m*x + b;   % Model

%% Plot Data

% plot data
figure(1);
hold on
scatter(Engine_Size,Co2_Emissions);
plot(x,Y);
xlabel('Engine Size');
ylabel('Co2 Emissions');
hold off

