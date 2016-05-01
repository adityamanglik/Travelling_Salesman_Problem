%%Initial Declarations
clc
clear all
rng('shuffle');
num_city=10;    %Set number of cities
max_dist=100;  %Set maximum distance spread
route=zeros(1,num_city);
%%Random generation of City Locations on a given map
loc_city=randi([1 max_dist],num_city,2);

% figure
% hold on
% plot(loc_city(:,1),loc_city(:,2),'.')
% axis([0 max_dist 0 max_dist])
% 
% display('Cities generated.');

%Calculating Distances between cities
city_distances=zeros(num_city,num_city);
for i=1:num_city
    for j=i+1:num_city
        city_distances(i,j)=sqrt((loc_city(j,1)-loc_city(i,1))^2 + (loc_city(j,2)-loc_city(i,2))^2);
    end
end
display('Inter city distances calculated.');
maximum_dist=max(max(city_distances));
minimum_dist=min_dist_calc(city_distances, num_city);
city_distances=city_distances+city_distances'
backup_distances=city_distances;

%%City Distance Statistics
display('Distances and variance have the following statistics:');
maximum_dist
minimum_dist
variance_dist=var(city_distances(1,:))
standard_deviation=sqrt(variance_dist)

%Setting same city distances to max for ease of calculation of route
display('Setting same city distances to max for ease of calculation of route.');
for i=1:num_city
    city_distances(i,i)=max_dist*1.414+1;
end

%%Best solution calculation- Combinatronics solution
%Returns all possible permutations for given cities,used in genetic_route()
display('Calculating perfect solution via combinations.');
[best_man, fit_best, p]=combinatronics_solution(num_city,city_distances);

%%Greedy solution calculation- Basic Heuristic approach
display('Calculating greedy route solution.');
[greedy_man, fit_greed]=greedy_route(num_city,city_distances,backup_distances,max_dist);

%%Neural Networks solution calculation- K-SOM approach solution
display('Calculating Neural Networks based Self-Organising Map solution.');
neural_route(num_city,max_dist,loc_city);

%%Genetic Algorithm approach solution
% display('Calculating Genetic Algorithm approach solution.');
% population_count=1000;
% generation_count=1000;
% threshold_mutate=1;%Mutation threshold, higher threshold=higher mutation rate
% [genetic_man, fit_gene]=genetic_route(num_city,city_distances,p,max_dist,population_count,generation_count,threshold_mutate);
% fit_gene=(fit_gene*10^(log10(max_dist))^-1);

%%Ant Colony optimization approach solution
%display('Calculating Ant Colony Optimization approach solution.');
aco_route();
 
% %%Gravitation technique approach solution
%display('Calculating Gravitation Technique approach solution.');
gravitate_route();


% clc
% best_man
% fit_best 
% greedy_man
% fit_greed 
% genetic_man
% fit_gene 