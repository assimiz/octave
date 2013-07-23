function plotHorizontalLine( xval, ymin, ymax )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

x=[xval,xval];
y=[ymin,ymax];
plot(x,y,'--','Color',[0 0 0])
end

