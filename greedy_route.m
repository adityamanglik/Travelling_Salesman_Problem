function [route, greedy_distance] = greedy_route( num_city,city_distances,backup_distances,max_dist )
    %%Making route using Nearest neighbour approach
    route(1)=randi([1 num_city],1,1);
    for i=2:num_city
        min_nn=1;
        for j=2:num_city
            if (city_distances(route(i-1),j)<city_distances(route(i-1),min_nn))
                min_nn=j;
            end
        end
        route(i)=min_nn;
        city_distances(:,route(i-1))=max_dist*1.414+1;
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
end

