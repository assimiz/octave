function asymptoticSym( type )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

NODES = [100, 1000, 10000, 100000, 1000000];
DEGREES = [2 4 8 16 32 64 128 256];
ITERATIONS = 100;

runAsymptoticSim(type, ITERATIONS, DEGREES, NODES);
end

