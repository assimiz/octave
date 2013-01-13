function proc_results = processResults2(results, figurefilename, charttitle, axismode, n, m)

total = sum(results(1, 3:end));
%				elite power   Dislikes		Neutral		  Likes
proc_results = [results(:, 1) results(:, 3) results(:, 4) results(:, 5)];
if strcmp(axismode, 'linear') == 1	
	proc_results(:, 2:4) = proc_results(:, 2:4)	/ total * 100;
elseif strcmp(axismode, 'log') == 1
	proc_results(:, 2:4) = log10(proc_results(:, 2:4)) / log10(total)
	proc_results(find(proc_results == -Inf)) = 0;
elseif strcmp(axismode, 'x-log-y-linear') == 1
	proc_results(:, 2:4) = proc_results(:, 2:4)	/ total * 100;
else
	fprintf('ERROR: undefined steps mode for result processing. Use either linear or log \n');
end

fprintf('Plotting...\n');
figure;
hold on;
title(charttitle);
area_handle = 0;
X = proc_results(:, 1);
max_power = max(proc_results(:, 1));
if strcmp(axismode, 'linear') == 1
	area_handle = area(X, proc_results(:, end:-1:2));
	xlabel ('elite power');
	ylabel ('voters (%)');
	color = [.8 .8 1];
	axis([1 max_power 0 100]);
	% plot(X, X, 'LineWidth', 2, 'Color', color);
	plot(get(gca,'XLim'),[50 50],'k--');  % Plot dashed line
elseif strcmp(axismode, 'log') == 1	
	area_handle = area(X, proc_results(:, 2));
	set(area_handle(1), 'FaceColor', 'red');
	area_handle = area(X, proc_results(:, 3));
	set(area_handle(1), 'FaceColor', 'green');
	area_handle = area(X, proc_results(:, 4));
	set(area_handle(1), 'FaceColor', 'blue');
	xlabel ('elite size (n^x)');
	ylabel ('voters (n^x)');
	color = [.8 .8 1];
	axis([0 1 0 1]);
	plot(X, X, 'LineWidth', 2, 'Color', color);
	%plot vertical line on x where n^x = m^.5
	%calculate x where n^x = m^.5
	%x = log_n(m^.5) = log(m^.5) / log(n)
	x = log(m^.5) / log(n);
	plot([x x],get(gca,'YLim'),'k--');  % Plot dashed line
	%plot horizonta line on y where n^y = n/2
	%calculate y where n^y = n/2
	%y = log_n(n/2) = log(n/2) / log(n)
	y = log(n/2) / log(n);
	plot(get(gca,'XLim'),[y y],'k--');  % Plot dashed line
	%plot(x_val,y_val,'r*');     % Mark intersection with red asterisk
elseif strcmp(axismode, 'x-log-y-linear') == 1	
	area_handle = area(X, proc_results(:, end:-1:2));
	set(gca, 'Xscale', 'log');
	xlabel ('elite power');
	ylabel ('voters (%)');
	color = [.8 .8 1];
	axis([1 max_power 0 100]);
	% plot(X, X, 'LineWidth', 2, 'Color', color);
	plot(get(gca,'XLim'),[50 50],'k--');  % Plot dashed line
else
	fprintf('ERROR: undefined axismode for result processing. Use either linear or log \n');
end

if strcmp(axismode, 'linear') == 1
	legend_handle = legend ('Like', 'Neutral', 'Dislike', 'Initial Like Voters', 'location', 'northeast');
	% legend ('Like', 'Neutral+Dislike', 'Initial Like Voters', 'location', 'eastoutside');
    % set(legend_handle, 'Color', 'none');
elseif strcmp(axismode, 'log') == 1
	legend_handle = legend ('Dislike', 'Neutral', 'Like', 'Initial Like Voters', 'location', 'northeast');
	% legend ('Like', 'Neutral+Dislike', 'Initial Like Voters', 'location', 'northwest');    
%     set(legend_handle, 'Color', [.7 .9 .7]);
elseif strcmp(axismode, 'x-log-y-linear') == 1
	legend_handle = legend ('Like', 'Neutral', 'Dislike', 'location', 'northeast');
	% legend ('Like', 'Neutral+Dislike', 'Initial Like Voters', 'location', 'northwest');    
%     set(legend_handle, 'Color', [.7 .9 .7]);
else
	fprintf('ERROR: undefined axismode for result processing. Use either linear or log \n');
end

% set(legend_handle,'TextColor',[0, 0, 0]);
legend('boxon');
grid on;


print('-dpng', figurefilename);