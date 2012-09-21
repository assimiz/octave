%process the results from playVotingGame and plots.
% results = matrix of the following format: 
% 	result_map(:, 1) = elite_size;	
%	result_map(:, 2) = dislike_voters;
%	result_map(:, 3) = neutral_voters;
%	result_map(:, 4) = like_voters;
%   (see result of playVotingGame)
% linksfile = file name of links file (see majrityVoteSim) to be used for plot title
% axismode = to be used for plot title. must be one of 'linear' or 'log'.
% determines if elite size will be sampled on linear or log scale
function proc_results = processResults(results, linksfile, axismode)

%total should be the same for all rows
total = results(1, 1) + results(1, 2) + results(1, 3);

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
area(proc_results(:, 1), proc_results(:, 4:-1:2));
plot(proc_results(:, 1), proc_results(:, 1), 'LineWidth', 2, "Color", "w");
title(substr(strtok(linksfile, '.'), findstr (strtok(linksfile, '.'), '/')(end) + 1));
if strcmp(axismode, 'linear') == 1
	xlabel ("elite size (%)");
	ylabel ("voters (%)");
	axis([0 100 0 100]);
elseif strcmp(axismode, 'log') == 1
	xlabel ("elite size (n^x)");
	ylabel ("voters (n^x)");
else
	fprintf('ERROR: undefined axismode for result processing. Use either linear or log \n');
end

legend ("blue: like\ngreen: neutral\nred: dislike\nwhite: initial like voters", "location", "eastoutside");
legend("boxon");

% figure_file = strcat(linksfile, '-', axismode, '-results.png');
% print figure_file -dfig;