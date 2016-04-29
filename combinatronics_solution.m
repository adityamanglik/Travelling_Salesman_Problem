function [] = combinatronics_solution( num_city,city_distances )
    %%Making route using combinations solution
    %Reducing number of cities to make calculation feasible
    num=8;
    num=num_city;
    cities=1:num;
    p=perms(cities);
    num_rows=factorial(num);
    dataset=zeros(num_rows,1);
    for i=1:num_rows
        for j=2:num
            dataset(i)=dataset(i) + city_distances(p(i,j),p(i,j-1));
        end
    end
    best_sol=find(dataset==min(dataset));
    display('Perfect solution after evaluation of all permutations for all cities is:');
    true_solution=p(best_sol(1),:)%First element used as solution+reverse have been selected
    display('Perfect solution requires a distance of:');
    true_solution_dist=dataset(best_sol(1))
    
end

