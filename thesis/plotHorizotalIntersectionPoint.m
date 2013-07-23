function done = plotHorizotalIntersectionPoint( curve, xval, marker, color )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

done = 0;
hline = [ones(1, length(curve(:, 1)))*xval; (0:1/(length(curve(:, 1))-1):1)];
p = InterX([curve(:, 1)'; curve(:, 2)'], hline);
if ~isempty(p)
    plot(p(1), p(2), marker, 'MarkerSize',...
            6, 'MarkerFaceColor', color, 'Color',color);
    done = 1;
end
end

