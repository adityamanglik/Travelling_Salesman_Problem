function [ output_args ] = neural_route( num_city,max_dist,loc_city )
    %%Initial Declarations for Neurons
    extra_neurons=3;    %Set number of extra neurons multiplier, extra neurons used to eliminate oscillations between cities
    num_neurons=num_city*extra_neurons;
    num_epochs=50;
    %%Initial circular pattern generation of Neuron locations
    loc_neuron=zeros(num_neurons,2);
    for i=1:num_neurons
        theta=2*pi/num_neurons;
        loc_neuron(i,:)=[cos((i-1)*theta) sin((i-1)*theta)];
    end
    loc_neuron=loc_neuron+(max_dist/2) %To generate ring of neurons in centre of map
    display('Neurons generated.');
    
    %Calculating Distances between cities and neurons
    neuron_distances=neutocity(num_neurons, num_city, loc_neuron, loc_city);
    neuron_distances
    plot(loc_neuron(:,1),loc_neuron(:,2),'.')
    %Code to move neurons according to distance from city
    min_city_neuron = min(neuron_distances)
end

