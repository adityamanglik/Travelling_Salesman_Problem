function [] = genetic_route(num_city,city_distances,p)
    %Genetic Algorithm approach is used to calculate a feasible solution to
    %the TSP, finally comparing with other solutions
    
    %num_city cannot be not less than 5 for current population value of 50
    population_count=5;%May be experimented with, for instance, factorial(num_city-1)
    generation_count=50;%May be experimented with
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
    j=1;
    for i=1:population_count
        for j=j:j+probab_mating(i,2)
            sector_table(j,2)=i;
        end
    end
    heavyweight=max(probab_mating(:,2));
    %Crossover function
    select1=4;
    select2=5;
    while(abs(select1-select2<=heavyweight))
    select1=randi([1 num_sectors]);
    select2=randi([1 num_sectors]);
    end
    select1
    select2
    indiv1=population(sector_table(select1,2),:)
    indiv2=population(sector_table(select2,2),:)
    cutpoint=round(num_city/2)
    offspring1=[indiv1(1:cutpoint) indiv2(cutpoint+1:num_city)]
    offspring2=[indiv1(1:cutpoint) indiv2(1:cutpoint)]
    offspring3=[indiv1(cutpoint+1:num_city) indiv2(cutpoint+1:num_city)]
    offspring4=[indiv1(cutpoint+1:num_city) indiv2(1:cutpoint)]
    
    %Mutation function
    
end

