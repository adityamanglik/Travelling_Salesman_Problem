%%Brute Force Calculation Method
clear;
clc;
%%Initial Declarations
num_city=10;    %Set number of cities
max_dist=100;  %Set maximum distance spread
route=zeros(1,num_city);
%%Random generation of City Locations
loc_city=randi([1 max_dist],num_city,2);
display('Cities generated.');
%Calculating Distances between cities
    distances=zeros(num_city,num_city);
 for i=1:num_city
     for j=i+1:num_city
     distances(i,j)=sqrt((loc_city(j,1)-loc_city(i,1))^2 + (loc_city(j,2)-loc_city(i,2))^2);
     end
 end
 display('Inter city distances calculated.'); 
 maximum_dist=max(max(distances));
 minimum_dist=min_dist_calc(distances, num_city);
 distances=distances+distances'
 backup_distances=distances;
 display('Distances and variance ranges from:');
 maximum_dist
 minimum_dist
 variance_dist=var(distances(1,:))
 standard_deviation=sqrt(variance_dist)
 %Setting same city distances to max for ease of calculation of route
 display('Setting same city distances to max for ease of calculation of route.');
 for i=1:num_city
     distances(i,i)=max_dist*1.414+1;
 end
 
 %%Making route using combinations solution
 %REDUCING NUMBER OF CITIES TO MAKE CALCULATIONS FEASIBLE
 num=10;
 cities=1:1:num;
 p=perms(cities);
 num_rows=factorial(num);
 dataset=zeros(num_rows,1);
 for i=1:num_rows
     for j=2:num
     dataset(i)=dataset(i) + distances(p(i,j),p(i,j-1));
     end
 end
 best_sol=1;
 for i=2:num_rows
     if(dataset(i)<dataset(best_sol))
         best_sol=i;
     end
 end
 display('Perfect solution after evaluation of all permutations for 10 cities is:');
 true_solution=p(best_sol,:)
 display('Perfect solution requires a distance of:');
 true_solution_dist=dataset(best_sol)
     
     
 %%Making route using Nearest neighbour approach
 route(1)=randi([1 num_city],1,1);
 for i=2:num_city
     min=1;
     for j=2:num_city
         if (distances(route(i-1),j)<distances(route(i-1),min))
             min=j;
         end
     end
     route(i)=min;
     distances(:,route(i-1))=max_dist*1.414+1;
 end
 display('Greedy route is:');
     route
 greedy_distance=0;
     for j=2:num_city
     greedy_distance=greedy_distance + backup_distances(route(j),route(j-1));
     end
 %%Displaying Values 

 display('Greedy route requires a distance of:');
     greedy_distance    
 
%  distances
%  for i=1:num_city
%  distances(i,:)=sort(distances(i,:));
%  end
% distances=distances+distances'
