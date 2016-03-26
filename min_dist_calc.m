function [ minimum_dist ] = min_dist_calc( distances, num_city )
    %Calculates minimum distance out of all the distance between the cities
  minx=1;
  miny=2;
  for i=1:num_city
      for j=1:num_city
          if ((distances(i,j)<distances(minx,miny))&&(distances(i,j)~=0))
              minx=i;
              miny=j;
          end
      end
  end
  minimum_dist=distances(minx,miny);
end

