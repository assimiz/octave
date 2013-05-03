function majorityVoteBinarySearch( links, resultfileprefix, makeunique )
%MajorityVoteSimBinarySearch Runs the majority vote simulation.
%   Searching for the minimum elite size required to win the majority vote
%for a specified list of elite power values, using binary serach. Saves the
%result to a corresponding file name.
% links: matrix owhere each row contains two columns of source and
% destination node IDs.
% resultfileprefix: unique string to identify the result file.

if nargin<3, makeunique = 1; end
if nargin<2, resultfileprefix = 'result'; end

REVERSABILITIES = {'revertive', 'elite-non-revertive'};
ROUNDS = 65;%proved to be enough (x2 than diameter) for all networks
ELITE_POWERS = [1 2 4 8 16 32 64 128 256 512 1024 2048 4096 8092];
COMMON_POWER = 1;
FACTOR_PRECISION = 2;


links = fixLinks(links);
num_nodes = size(unique(links), 1);

for j = 1:numel(REVERSABILITIES)
    reversability = REVERSABILITIES{j};
    acc_result = zeros(numel(ELITE_POWERS), 5);
    fprintf('Simulating for file %s and reversability %s...\n\n', resultfileprefix, reversability);
    factor = 1.0
    step = 0.5;
    for k = 1:numel(ELITE_POWERS)
        elite_power = ELITE_POWERS(k);
        prev_factor = -1.00;
        fprintf('Searching for minimum elite size for power %d...\n\n', elite_power);
        while ~strcmpi(num2str(factor, FACTOR_PRECISION), num2str(prev_factor, FACTOR_PRECISION))
            elitesize = round(num_nodes ^ factor);
            result = playVotingGame(links, elitesize, num_nodes, elite_power, COMMON_POWER, ROUNDS, reversability);
            num_dislike_voters = result(2);
            num_like_voters = result(4);
            %if elite won for this size, try smaller elite, else try
            %bigger.
            step = step / 2
            prev_factor = factor;
            if num_like_voters >= num_dislike_voters
                factor = prev_factor - step
                min_win_result = result;
            else
                factor = prev_factor + step
            end
            
        end
        acc_result(k, :) = [elite_power min_win_result];
        step = factor / 2
    end
    
    %writing the result to a file
    if ~exist('results', 'dir')
        mkdir('results');
    end
    
    if makeunique
        uniquestr = datestr(now,'-SSFFF');
    else
        uniquestr = '';
    end
    resultsfilename = strcat('./results/', resultfileprefix,...
        '-',num2str(ROUNDS), '-rounds', '-binary_search-', reversability,...
        '-results', uniquestr, '.txt');
    fprintf('Writing results to file %s...\n', resultsfilename);
    dlmwrite(resultsfilename, acc_result, 'delimiter', ',', 'precision', '%i');
end
end




