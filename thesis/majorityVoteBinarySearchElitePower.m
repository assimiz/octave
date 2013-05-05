function majorityVoteBinarySearchElitePower( links, resultfileprefix, makeunique )
%MajorityVoteSimBinarySearch Runs the majority vote simulation.
%   Searching for the minimum elite power required to win the majority vote
%for a specified list of elite size values, using binary serach. Saves the
%result to a corresponding file name.
% links: matrix owhere each row contains two columns of source and
% destination node IDs.
% resultfileprefix: unique string to identify the result file.

if nargin<3, makeunique = 1; end
if nargin<2, resultfileprefix = 'result'; end

REVERSABILITIES = {'revertive', 'elite-non-revertive'};
ROUNDS = 65;%proved to be enough (x2 than diameter) for all networks
COMMON_POWER = 1;


links = fixLinks(links);
num_edges = size(links, 1) / 2; %2 directed edges are counted as one
num_nodes = size(unique(links), 1);
ELITE_SIZES = round([...
    num_nodes^.5,...
    num_edges^.5,...
    0.1*num_nodes,...
    0.1*num_edges...
]);

for j = 1:numel(REVERSABILITIES)
    reversability = REVERSABILITIES{j};
    acc_result = zeros(numel(ELITE_SIZES), 5);
    fprintf('Simulating for file %s and reversability %s...\n\n', resultfileprefix, reversability);
    for k = 1:numel(ELITE_SIZES)
        elite_size = ELITE_SIZES(k);
        power = 8192
        step = 8192;
        min_win_result = [-1, -1, -1, -1];
        fprintf('Searching for minimum elite power for size %d...\n\n', elite_size);
        while step >= 1 && power <= 8192
            elite_power = power;
            result = playVotingGame(links, elite_size, num_nodes, elite_power, COMMON_POWER, ROUNDS, reversability);
            num_dislike_voters = result(2);
            num_like_voters = result(4);
            %if elite won for this size, try smaller elite, else try
            %bigger.
            step = step / 2
            prev_power = power;
            if num_like_voters >= num_dislike_voters
                power = prev_power - step
                min_win_result = result;
            else
                power = prev_power + step
            end
            
        end
        acc_result(k, :) = [min_win_result elite_power];
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
        '-',num2str(ROUNDS), '-rounds', '-binary_search-elite_power-', reversability,...
        '-results', uniquestr, '.txt');
    fprintf('Writing results to file %s...\n', resultsfilename);
    dlmwrite(resultsfilename, acc_result, 'delimiter', ',', 'precision', '%i');
end
end




