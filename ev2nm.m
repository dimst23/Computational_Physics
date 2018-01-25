%Computational physics 2017
%Name: Dimitrios Stoupis

%Constant decleration
h = 4.135667e-15; %Planck constant in eV*s
c = 3e8; %Speed of light in m/s

run = 1; %Variable to indicate reiteration of the program

while run
  clc %Clear the command window contents
    
  %Show all the necessary info in the main menu
  disp('****Energy gap converter****');
  disp('Choose what you want to convert');
  disp('1. Energy (eV to nm)');
  disp('2. Wavelength (nm to eV)');
  disp('3. Quit');
  
  %Get the user choice for the conversion
  user_ch = input('Enter your choice: ');
  while ~((user_ch == 1) || (user_ch == 2) || (user_ch == 3))
    user_ch = input('Please enter 1, 2 or 3: ');
  end

  clc %Clear the command window contents
  if user_ch == 1
    energy = input('Enter the energy in eV: ');
    while energy <= 0
      energy = input('Please enter a positive value: ');
    end
    wavelength = ((h*c)/energy)*10^9; %Find the wavelength in nm
    fprintf('\nThe wavelength in nm is: %.4fnm\n', wavelength);
    
  elseif user_ch == 2
    wavelength = input('Enter the wavelength in nm: ');
    while wavelength <= 0
      wavelength = input('Please enter a positive value: ');
    end
    E = (h*c)/(wavelength*10^(-9)); %Find the energy in eV
    fprintf('\nThe energy in eV is: %.4feV\n', E);
    
  else
    break %If the third choice is selected terminate the program
  end
  
  %Ask the user if he wants another calculation
  choice = input('Do you want another conversion? If yes type "y", otherwise type anything: ', 's');
  if choice == 'y'
    run = 1;
  else
    run = 0;
  end
end
