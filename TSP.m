%%Brute Force Calculation Method
clear;
clc;
%%Initial Declarations
num_city=20;    %Set number of cities
max_dist=1000;  %Set maximum distance spread
route=zeros(1,num_city);
%%Random generation of City Locations
loc_city=randi([1 max_dist],num_city,2);
%Calculating Distances between cities
    distances=zeros(num_city,num_city);
 for i=1:num_city
     for j=i+1:num_city
     distances(i,j)=sqrt((loc_city(j,1)-loc_city(i,1))^2 + (loc_city(j,2)-loc_city(i,2))^2);
     end
 end
 
 distances=distances+distances'
 %Setting same city distances to max for ease of calculation of route
 for i=1:num_city
     distances(i,i)=max_dist*1.414+1;
 end
 route(1)=1;
 
 
 %%Making route using combinations solution
 %REDUCING NUMBER OF CITIES TO MAKE CALCULATIONS FEASIBLE
 num=5;
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
 for i=2:num
     if(dataset(i)<dataset(best_sol))
         best_sol=i;
     end
 end
     p
     best_sol
     p(best_sol,:)
     dataset
     
     
 %%Making route using Nearest neighbour approach
 route(1)=1;
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
 
 %%Displaying Values 
     route
 
%  distances
%  for i=1:num_city
%  distances(i,:)=sort(distances(i,:));
%  end
% distances=distances+distances'
