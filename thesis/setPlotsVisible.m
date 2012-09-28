%sets plots printing visibility. this can be used to speed up runtime
%when we actually want to save plot/figure to file.
%
%visible must be one of 'on' or 'off'.
%
function setPlotsVisible(visible)
set(0, 'defaultfigurevisible', visible);