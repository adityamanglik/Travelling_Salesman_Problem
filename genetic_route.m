function [] = genetic_route(num_city,city_distances,p)
    %Genetic Algorithm approach is used to calculate a feasible solution to
    %the TSP, finally comparing with other solutions
    
    %num_city cannot be not less than 5 for current population value of 50
    population_count=3;%May be experimented with, for instance, factorial(num_city-1)
    generation_count=50;%May be experimented with
    cities=1:num_city;
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
    
    %Select individuals for breeding on basis of fitness
    %Higher(lower) fitness=Higher breeding chances
    num_sectors=population_count*50;
    sum_fitness=sum(fitness);
    probab_mating=ones(population_count,2);
    for i=1:population_count
        probab_mating(i,1)=fitness(i)./sum_fitness;
    end
    for i=1:population_count
        probab_mating(i,2)=num_sectors*probab_mating(i,1);
    end
    for i=1:population_count
        probab_mating(i,2)=round(probab_mating(i,2));
    end
    probab_mating
    if(sum(probab_mating(:,2)~=num_sectors))
        display('Adjusting sectors for calculations.');
        num_sectors=sum(probab_mating(:,2));
    end
    sector_table=zeros(num_sectors,2);
    for i=1:num_sectors
        sector_table(i,1)=i;
    end
    sector_table
    j=1;
    for i=1:population_count
        for j=j:j+probab_mating(i,2)
            sector_table(j,2)=i;
        end
    end
    sector_table
    %Crossover function
    
    %Mutation function
    
end

