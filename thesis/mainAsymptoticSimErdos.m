%Runs the asymptotic analysis majority vote simulation

NODES = [100, 1000, 10000, 100000, 1000000];
DEGREES = [2 4 8 16 32 64 128 256];
ITERATIONS = 10;
TYPE = 'erdos';

runAsymptoticSim(TYPE, ITERATIONS, DEGREES, NODES);