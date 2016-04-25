function [ neuron_distances ] = neutocity( num_neurons, num_city, loc_neuron, loc_city )
   %Calculating Distances between cities and neurons
 for i=1:num_city
     for j=1:num_neurons
     neuron_distances(j,i)=sqrt((loc_neuron(j,1)-loc_city(i,1))^2 + (loc_neuron(j,2)-loc_city(i,2))^2);
     end
 end
 display('Neuron to city distances calculated.'); 
    
end

