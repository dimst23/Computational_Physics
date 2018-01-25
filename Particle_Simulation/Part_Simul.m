%Computational Physics 2017
%Name: Dimitrios Stoupis

run = 1; %Variable to indicate reiteration of the program

while run
  clc; %Clear the command window contents
  
  %Show all the necessary info in the main menu
  disp('****Particle behavior simulator****');
  disp('Choose how you want to simulate');
  disp('1. All Particles in one part of a box');
  disp('2. Particles at both parts of a box');
  disp('3. Quit');
  
  %Get the user choice for the conversion
  user_ch = input('Enter your choice: ');
  while ~((user_ch == 1) || (user_ch == 2) || (user_ch == 3))
    user_ch = input('Please enter 1, 2 or 3: ');
  end

  clc %Clear the command window contents
  if user_ch == 1
    clc; %Clear the screen before moving on

    %Welcome messages and user prompt for input
    disp('****Particle simulator for population in one box****');
    disp('You will need to enter the number of parts and the simulation time below.');

    part_num = input('\nEnter the total number of particles to simulate: ');
    sim_time = input('Enter the simulation time in seconds: ');

    el_time = p_sim(sim_time, part_num, 0); %Run the simulation with the given data
    fprintf('\nThe simulation has taken %.3fs to complete.\n', el_time);
    
  elseif user_ch == 2
    clc; %Clear the screen before moving on

    %Welcome messages and user prompt for input
    disp('****Particle simulator for non uniform distribution****');
    disp('You will be asked to provide the total number of patricles for the simulation.');
    disp('You will also need to enter your name below and the simulation time.');

    fname = input('Enter your first name: ', 's');
    sname = input('Enter your surname name: ', 's');
    pnumb = input('\nEnter the total number of particles to simulate: ');
    sim_time = input('Enter the simulation time in seconds: ');

    %Convert each character of the array to the corresponding ASCII number
    %Then take the sum of the elements and save it to new variables
    ON = sum(fname*1);
    EP = sum(sname*1);

    %min(ON, EP)/max(ON, EP) is equal to N1/N2 for the simulation
    rat_N1_N2 = min(ON, EP)/max(ON, EP);
    N2 = round(pnumb/(rat_N1_N2 + 1)); %Calculate the initial number of particles in box 2
    N1 = round(rat_N1_N2*N2); %Calculate the initial number of particles in box 1

    el_time = p_sim(sim_time, N1, N2);
    fprintf('\nThe simulation has taken %.3fs to complete.\n', el_time);
    
  else
    break %If the third choice is selected, exit the loop and terminate the program
  end
  
  %Ask the user if he wants another calculation
  choice = input('Do you want another conversion? If yes type "y", otherwise type anything: ', 's');
  if choice == 'y'
    run = 1;
  else
    run = 0;
  end
end
