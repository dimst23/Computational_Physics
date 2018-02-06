%Computational Physics 2017, Wind data exercise
%Name: Dimitrios Stoupis

clear; %Clean the workspace

%Data selection
%******************************************************************
filename = 'Give the excel file name'; %Set the filename or the directory of the file containing the data
first_year = 2010; %Set the first year for the data
last_year = 2012; %Set the last year selection for the data
spd_col = 5; %Choose the column that the wind speed appears
dir_col = 6; %Choose the column that the wind direction appears
%******************************************************************

data = xlsread(filename); %Read the xls file with the data

id_1 = find(data == first_year, 1, 'first'); %Find the index of the first occurrence of a certain year
id_2 = find(data == last_year, 1, 'last'); %Find the index of the last occurrence of a certain year

%Read the data from the file
wind_spd = (data(id_1:id_2, spd_col)*0.514445); %Save the wind speed data for the specified period
wind_dir = data(id_1:id_2, dir_col); %Save the wind direction data for the specified period

%Average the values for one day and as we see in the file, there are 8 measurements per day
group_spd = arrayfun(@(i) mean(wind_spd(i:i + 7)), 1:8:length(wind_spd) - 7)';

fit_params = wblfit(nonzeros(group_spd)); %Get the fitting parameters for the Weibull distribution

%Group the speeds to draw the histogram
for i = 1:ceil(max(group_spd))
    if i == 1
        group_spd((group_spd >= (i - 1) & group_spd <= i)) = i; %Include zero
    else
        group_spd((group_spd > (i - 1) & group_spd <= i)) = i;
    end
end

freq = tabulate(group_spd); %Find the frequency of each value of the wind speed

%Create the curve data
x_spd = linspace(0, ceil(max(freq(:, 1))) + 5, 50); %Generates linearly spaced vector
dens_fit = wblpdf(x_spd, fit_params(1), fit_params(2)); %Fit a Weibull distribution using the parameters calculated above
fprintf('Weibull curve fit parameters:\nC = %f, k = %f\n', fit_params(1), fit_params(2));

%Figure creation and data plotting
%Generate a figure to show the data and save the handle of it
figure('Name', 'Wind speed distribution'); %Create a figure for the data plot
hold on; %Enable figure to keep many plots
bar(freq(:, 1), freq(:, 3)/100); %Plot the data histogram with probability normalized to one
plot(x_spd, dens_fit, 'r', 'LineWidth', 1); %Plot the Weibull distribution with the fitted data

%Plot conditioning
title('Wind speed distribution with fitted Weibull curve'); %Title of the graph
xlabel('Wind speed [m/s]'); %Add the x axis label
ylabel('Probability'); %Add the y axis label
legend('Measured data', 'Fitted Weibull curve'); %Add a legend to the graph
xlim([0 ceil(max(wind_spd))]); %Set the limits for the x-axis in the plot


%Wind Rose plot, wind rose options
Options.AngleNorth     = 0;
Options.AngleEast      = 90;
Options.Labels         = {'N (0)','S (180)','E (90)','W (270)'};
Options.FreqLabelAngle = 45;
Options.TitleString    = {sprintf("Wind Rose Plot from year %d to %d", data(id_1, 1), data(id_2, 1));' '};

WindRose(wind_dir, wind_spd, Options); %Call the WindRose function to create the plot

clear filename first_year last_year spd_col dir_col; %Delete some variables