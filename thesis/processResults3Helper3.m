function winning_point = processResults3Helper3( result, e )
%processResult3Helper Returns the first elite winning point for a given
%result (per elite power).
% Input:
% result - matrix with following line format:
%1. Elite power
%2. Elite size (absolute)
%3. Number of Dislike voters
%4. Number of Neutral voters
%5. Number of Like voters
winning_point = [-1, -1, -1];
for i = 1:size(result, 1)    
    elite_size = result(i, 1);
    num_dislikes = result(i, 2);
    num_neutral = result(i, 3);
    num_likes = result(i, 4);
    elite_power = result(i, 5);
    if num_likes > num_dislikes
        percent_win = (num_likes / (num_dislikes + num_likes)) * 100;
        n = num_dislikes + num_neutral + num_likes;
        if nargin < 2
            x = log(elite_size) / log(n);
        else
            x = log(elite_size) / log(e);
        end
        winning_point = [elite_power, x, percent_win];
        break
    end
end

end
