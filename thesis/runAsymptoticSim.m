function runAsymptoticSim( binsearchfun, type, iterations, degrees, nodes )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

for k = 1:iterations
    for j = 1:numel(degrees)
        for i = 1:numel(nodes)            
            num_nodes = nodes(i);
            avg_degree = degrees(j);
            if num_nodes > avg_degree * 2
                fname = sprintf('graph_asymptotic_temp.txt');
                if (strcmp(type,'erdos'))
                    generateErdosRenyiGraphSNAP(num_nodes, avg_degree, fname);
                elseif (strcmp(type,'barabasi'))                    
                    generateBarabasiAlbertGraphSNAP(num_nodes, avg_degree, fname);
                else
                    error('type must erdos or barabasi');
                end                
                links = importdata(fname);
                bilinks = createBiGraph(links.data); 
                resultfileprefix = sprintf('%s_%d_%d', type, num_nodes, avg_degree);
                binsearchfun(bilinks, resultfileprefix);
            end
        end
    end
end

end

