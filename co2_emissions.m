clear;
clc;
close all;

%% Data Analysis

% read data
data = readtable('CO2 Emissions.csv');  % read csv file
data = table2dataset(data);             % convert table to structure

Engine_Size = data(:,4);
Co2_Emissions = data(:,12);

% plot data
figure(1);
hold on
scatter(Engine_Size,Co2_Emissions);
xlabel('Engine Size');
ylabel('Co2 Emissions');
hold off


