function [] = genetic_route(num_city,city_distances,p)
    %Genetic Algorithm approach is used to calculate a feasible solution to
    %the TSP, finally comparing with other solutions
    
    %num_city cannot be not less than 5 for current population value of 50
    population_count=6;%May be experimented with, for instance, factorial(num_city-1)
    generation_count=50;%May be experimented with
    %Population must always be less than possible permutations,
    num_rows=size(p);%Needs Optimization
    random_individuals=randi([1 num_rows(1)],population_count,1);
    population=zeros(population_count,num_city);
    updated_population=zeros(population_count,num_city);
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
    
    %Fitness function
    function [value] = calc_fitness(chromo)
        value=0;
        for i=1:num_city
            value=value+chromo(i);
        end
    end
    
    %Eligibility function
    function [flag] = iseligible(updated_population,member)
        flag=1;
        for i=1:population_count
            if (updated_population(i,:)==member) 
                flag=0;return;
            end
        end
    end
    %for epoch=1:generation_count
    %Crossover function
    select1=4;
    select2=5;
    while(abs(select1-select2<=heavyweight))
        select1=randi([1 num_sectors]);
        select2=randi([1 num_sectors]);
    end
    indiv1=population(sector_table(select1,2),:);
    indiv2=population(sector_table(select2,2),:);
    cutpoint=round(num_city/2);
    offspring1=[indiv1(1:cutpoint) indiv2(cutpoint+1:num_city)];
    offspring2=[indiv1(1:cutpoint) indiv2(1:cutpoint)];
    offspring3=[indiv1(cutpoint+1:num_city) indiv2(cutpoint+1:num_city)];
    offspring4=[indiv1(cutpoint+1:num_city) indiv2(1:cutpoint)];
    index(1)=calc_fitness(indiv1);
    index(2)=calc_fitness(indiv2);
    index(3)=calc_fitness(offspring1);
    index(4)=calc_fitness(offspring2);
    index(5)=calc_fitness(offspring3);
    index(6)=calc_fitness(offspring4);
    prodigy1=find(index==(max(index)));
    index(prodigy1)=0.01;
    prodigy2=find(index==(max(index)));
    switch (prodigy1(1))
        case 1
            updated_population(1,:)=indiv1;
        case 2
            updated_population(1,:)=indiv2;
        case 3
            updated_population(1,:)=offspring1;
        case 4
            updated_population(1,:)=offspring2;
        case 5
            updated_population(1,:)=offspring3;
        case 6
            updated_population(1,:)=offspring4;
    end
    switch (prodigy2(1))
        case 1
            updated_population(2,:)=indiv1;
        case 2
            updated_population(2,:)=indiv2;
        case 3
            updated_population(2,:)=offspring1;
        case 4
            updated_population(2,:)=offspring2;
        case 5
            updated_population(2,:)=offspring3;
        case 6
            updated_population(2,:)=offspring4;
    end
    updated_population
    for i=3:population_count
    eligible=0;
    while(~eligible)
        select1=randi([1 num_sectors])
        member=population(sector_table(select1,2),:)
        eligible=iseligible(updated_population,member)
    end
    updated_population(i,:)=member
    end
    updated_population
    
    %Mutation function
    x=randi([1 population_count])
    y=randi([1 num_city])
    updated_population(x,y)=randi([1 num_city])
    population
    population=updated_population
    
    %end
            
end

