%Particle simulator function as a part of solution for an exercise, Computational Physics 2017
%Name: Dimitrios Stoupis

%el_time returns the elapsed time for the simulation
%sim_time is an argument of simulation time in seconds
%N1, N2 is the number os particles in each space of the equally spaced box

function el_time = p_sim(sim_time, N1, N2)
  tic %Start counting the time to measure the elapsed time
  if N2 == 0
    fplot(@(t) (N1/2)*(1 + exp(-2*(t/N1))), [0 sim_time]); %Plot the particles over time
    legend('(N/2)*(1+e^{-2t/N})'); %Show the equation used to plot the function
    title(sprintf("Simulation for N=%.0f particles at one box", N1)); %Add title to the graph
  else
    fplot(@(t) (N1/2)*(1 + exp(-2*(t/N1))) + (N2/2)*(1 + exp(-2*(t/N2))), [0 sim_time]); %Plot the particles over time
    legend('(N1/2)*(1+e^{-2t/N1})+(N2/2)*(1+e^{-2t/N2})'); %Show the equation used to plot the function
    title(sprintf("Simulation for N1=%.0f and N2=%.0f particles at respective boxes", N1, N2)); %Add title to the graph
  end
  el_time = toc; %Take the elapsed time for the simulation
  
  f_prop = gca; %Get the properties of the figure
  if f_prop.YLim(1) > round(f_prop.YLim(1)/10) %If the axis limit is > 100, then reduce 100 to make it look nicer
    f_prop.YLim(1) = f_prop.YLim(1) - round(f_prop.YLim(1)/10);
  end
  
  xlabel('Time [s]'); %Add the x axis label
  ylabel('Number of Particles'); %Add the y axis label
  saveas(gcf, char(sprintf("Particle_Sim_T_%.0f_N1_%.0f_N2_%.0f.png", sim_time, N1, N2)));
  fprintf('\nThe plot of the simulaion with the name "Particle_Sim_T_%.0f_N1_%.0f_N2_%.0f.png" was saved in the current directory.\n', sim_time, N1, N2)
end
