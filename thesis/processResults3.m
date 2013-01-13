clear all; close all; clc

files = getAllFiles('./results-sim3');
markers = ['+', 'o', '*', '.', 's', 'd', 'p'];
colors = ['r', 'b', 'g', 'm', 'c', 'g', 'y'];
figure;
hold on;
set(gca, 'Xscale', 'log');
m = 0;
for i = 1:numel(files)
    filename = files{i};
    if ~isempty(strfind(filename, 'no_monopoly'))
        m = m + 1;
        winning_points = processResult3Helper(load(filename));
        subplot(3, 3, m);
        hold on;
        axis([0 3050 0 1]);        
        set(gca, 'Xscale', 'log');
        set(gca, 'YMinorGrid', 'off');
        set(gca,'FontSize', 8);
        set(gca, 'XMinorTick', 'on');
        set(gca, 'XTickMode', 'manual');        
        set(gca, 'XTick', [1 2 4 8 16 32 64 128 256 512 1024 2048]); 
        set(gca, 'YTick', [.1 .2 .3 .4 .5 .6 .7 .8 .9 1.0]);
%         rotateticklabel(gca, 90);
        grid on;
        ylabel ('elite size (n^x)');
        xlabel (sprintf('elite power\n'));
        plot(winning_points(:, 1), winning_points(:, 2), '-bo', 'MarkerSize', 5);
        if strfind(lower(filename), 'barabasi')
            title('Barabasy-Albert', 'FontWeight', 'bold', 'FontSize', 10);
        elseif strfind(lower(filename), 'erdos')
            title('Erdos-Renyi', 'FontWeight', 'bold', 'FontSize', 10);
        elseif strfind(lower(filename), 'facebook')
            title('Facebook', 'FontWeight', 'bold', 'FontSize', 10);
        elseif strfind(lower(filename), 'twitter')
            title('Twitter', 'FontWeight', 'bold', 'FontSize', 10);
        elseif strfind(lower(filename), 'youtube')
            title('Youtube', 'FontWeight', 'bold', 'FontSize', 10);
        elseif strfind(lower(filename), 'slashdot')
            title('Slashdot', 'FontWeight', 'bold', 'FontSize', 10);
        elseif strfind(lower(filename), 'epinions')
            title('Epinions', 'FontWeight', 'bold', 'FontSize', 10);
        elseif strfind(lower(filename), 'flickr')
            title('Flickr', 'FontWeight', 'bold', 'FontSize', 10);               
        end
    end
end
 
m = 0;
for i = 1:numel(files)
    filename = files{i};
    if isempty(strfind(filename, 'no_monopoly'))
        m = m + 1;
        winning_points = processResult3Helper(load(filename));
        subplot(3, 3, m);
        hold on;
        set(gca, 'Xscale', 'log');
        axis([0 3050 0 1]);
        ylabel ('elite size (n^x)');
        xlabel ('elite power');
        plot(winning_points(:, 1), winning_points(:, 2), '-r.'); 
        legend ('revertive', 'non-revertive', 'location', 'northeast');
    end
end

files = getAllFiles('./results-sim3/elite=m^.5');
m = 0;
for i = 1:numel(files)
    filename = files{i};
    if ~isempty(strfind(filename, 'no_monopoly'))
        m = m + 1;
        winning_point = processResults3Helper2(load(filename));
        if winning_point(1, 1) > 0
            subplot(3, 3, m);
            hold on;
            plot(winning_point(1, 1), winning_point(1, 2), 'b*');
        end
    end
end


files = getAllFiles('./results-sim3/elite=m^.5');
m = 0;
for i = 1:numel(files)
    filename = files{i};
    if isempty(strfind(filename, 'no_monopoly'))
        m = m + 1;
        winning_point = processResults3Helper2(load(filename));
        subplot(3, 3, m);
        hold on;
        plot(winning_point(:, 1), winning_point(:, 2), 'r*');         
    end
end
