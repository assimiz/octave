function winning_points = processResult3Helper( result )
%processResult3Helper Returns the first elite winning points for a given
%result (per elite power).
% Input:
% result - matrix with following line format:
%1. Elite power
%2. Elite size (absolute)
%3. Number of Dislike voters
%4. Number of Neutral voters
%5. Number of Like voters
winning_points = zeros(numel(unique(result(:, 1))), 3);
prev_elite_power = -1;
j = 0;
step = 1 / numel(find(result(:, 1) == 1));
for i = 1:size(result, 1)
    elite_power = result(i, 1);
    if elite_power ~= prev_elite_power
        prev_elite_power = elite_power;
        j = j + 1;
        x = step;
        wining_point_found = 0;
    end
    
    num_dislikes = result(i, 3);
    num_likes = result(i, 5);
    if num_likes > num_dislikes && wining_point_found == 0
        percent_win = (num_likes / (num_dislikes + num_likes)) * 100;
        winning_points(j, :) = [elite_power, x, percent_win];
        wining_point_found = 1;
    end
    x = x + step;    
end

end

