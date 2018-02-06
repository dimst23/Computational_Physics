# Computational_Physics
Here there are some of the solutions to some exercises for the undergraduate elective course I have taken in Computational Physics at the Physics department of the Aristotle University of Thessaloniki. The course exercises were given during the 7th semester of year 2017-2018. Below there are some simple instructions to successfully run the programs in this repository.

**Energy and wavelength converter:**

The easiest program to run is the energy gap converter, from file ev2nm, which converts a given radiation wavelength to the corresponding photon energy and vice versa. Once the program is running some option will be presented to the user. The options are:

1. Convert the photon energy from eV to wavelength in nm
2. Convert the wavelength from nm to photon energy in eV

and when one of the options is chosen, then the user is asked to enter the values of either the photon energy or the photon wavelength, according to his choice and finally the result is shown to the user.

**Weibull and Wind Rose plots:**

In this program, which is run from the file with the name "wind_data.m", a plot of the windspeed distribution along with the fitted Weibull curve is produced from wind data provided in an excel file. Also a wind direction distribution plot is generated in a polar plot, using the function "WindRose.m", which can be found in the link below. The program expects an excel file containing the wind data and the excel file should have the year of the date of the measurement in the first column, column A. In the excel file the wind speed in knots and the direction in degrees should be in separate columns. In the program's code, the filename is put or the directory of it in the variable called filename. The years of the dates from the data are provided in the corresponding variables in the program. Finally, in the program you need to provide which column is for the wind speed and the wind direction.

WindRose function needed for the successful run of the "wind_data.m" program: https://www.mathworks.com/matlabcentral/mlc-downloads/downloads/submissions/47248/versions/5/previews/WindRose.m/index.html
