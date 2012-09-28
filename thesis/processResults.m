%process the results from playVotingGame and plots.
% results = matrix of the following format: 
% 	result_map(:, 1) = elite_size;	
%	result_map(:, 2) = dislike_voters;
%	result_map(:, 3) = neutral_voters;
%	result_map(:, 4) = like_voters;
%   (see result of playVotingGame)
% title = file name of links file (see majrityVoteSim) to be used for plot title
% axismode = to be used for plot title. must be one of 'linear' or 'log'.
% determines if elite size will be sampled on linear or log scale
function proc_results = processResults(results, charttitle, axismode)

%total should be the same for all rows
total = sum(results(1, :));

if strcmp(axismode, 'linear') == 1
	proc_results = results / total * 100;
elseif strcmp(axismode, 'log') == 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%FIX THIS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	proc_results = log10(results) / log10(total);
else
	fprintf('ERROR: undefined steps mode for result processing. Use either linear or log \n');
end

fprintf('Plotting...\n');
figure;
hold on;
title(charttitle);
if strcmp(axismode, 'linear') == 1	
	area(proc_results(:, 1), proc_results(:, size(results, 2):-1:2));
	xlabel ("elite size (%)");
	ylabel ("voters (%)");
	color = "w";
	axis([0 100 0 100]);
elseif strcmp(axismode, 'log') == 1	
	area(proc_results(:, 1), proc_results(:, size(results, 2)));
	xlabel ("elite size (n^x)");
	ylabel ("voters (n^x)");
	color = "w";
	axis([0 1 0 1]);
else
	fprintf('ERROR: undefined axismode for result processing. Use either linear or log \n');
end

plot(proc_results(:, 1), proc_results(:, 1), 'LineWidth', 2, "Color", color);

if strcmp(axismode, 'linear') == 1	
	legend (["Like"; "Neutral"; "Dislike"; "Initial Like Voters"], "location", "eastoutside");
	% legend (["Like"; "Neutral+Dislike"; "Initial Like Voters"], "location", "eastoutside");
elseif strcmp(axismode, 'log') == 1	
	legend (["Like"; "Initial Like Voters"], "location", "northwest");
else
	fprintf('ERROR: undefined axismode for result processing. Use either linear or log \n');
end



legend("boxon");


% figure_file = strcat(charttitle, '-', axismode, '-results');
print bi_release_youtube_links_elite_4_common_1_linear_normalized -dpng;
