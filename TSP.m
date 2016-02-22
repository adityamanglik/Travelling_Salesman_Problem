%%Brute Force Calculation Method
clear;
clc;
%%Initial Declarations
num_city=10;    %Set number of cities
route=zeros(1,num_city);
%%Random generation of City Locations
loc_city=randi([1 100],num_city,2);
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
     distances(i,i)=142
 end
 route(1)=1;
 %%Making route using combinations solution
 
 
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
     distances(:,route(i-1))=142;
 end
 
 %%Displaying Values 
     route
 
%  distances
%  for i=1:num_city
%  distances(i,:)=sort(distances(i,:));
%  end
% distances=distances+distances'
