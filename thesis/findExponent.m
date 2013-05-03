function [ exponent ] = findExponent( base, result )
%Finds the exponent from base and result

exponent = log(result) ./ log(base);

end

