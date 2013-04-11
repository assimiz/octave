% clear all; 
close all;
clc

network = 'facebook';

[reversible_filename, elite_non_reversible_filename] = ...
    getFilesFromFolder( './results-sim3/2/networks', network );

[reversible_m_square_filename, elite_non_reversible_m_square_filename] = ...
    getFilesFromFolder( './results-sim3/2/networks/elite=m^.5', network );


generateReversabilityCompFigure( reversible_filename, ...
    elite_non_reversible_filename,  reversible_m_square_filename,...
    elite_non_reversible_m_square_filename);