function [] = genetic_route(num_city,city_distances)
    %Genetic Algorithm approach is used to calculate a feasible solution to
    %the TSP, finally comparing with other solutions
    
    %num_city cannot be not less than 5 for current population value of 50
    population_count=50;%May be experimented with, for instance, factorial(num_city-1)
    generation_count=50;
    cities=1:num_city;    
    p=perms(cities);
    %Population must always be less than possible permutations, 
    num_rows=size(p);%Needs Optimization
    random_individuals=randi([1 num_rows(1)],population_count,1);
    population=zeros(population_count,num_city);
    for i=1:population_count
        for j=1:num_city
            population(i,j)=p(random_individuals(i),j);
        end
    end
    fitness=zeros(population_count,1);
   for i=1:population_count
        for j=2:num_city
            fitness(i)=fitness(i) + city_distances(population(i,j),population(i,j-1));
        end
   end
    fitness
end

