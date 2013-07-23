%Runs the asymptotic analysis majority vote simulation

NODES = [100, 1000, 10000, 100000, 1000000];
DEGREES = [2 4 8 16];
ITERATIONS = 10;
TYPE = 'erdos';
handle = @majorityVoteBinarySearchElitePower;

runAsymptoticSim(handle, TYPE, ITERATIONS, DEGREES, NODES);