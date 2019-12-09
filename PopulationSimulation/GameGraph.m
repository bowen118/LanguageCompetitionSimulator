clear all; close all;

% PARAMETERS -- FEEL FREE TO CHANGE THESE

N = 500; % Population size
p = 0.1; % Probability that two nodes are connected
s_same = 1; s_diff = 0.2;
u = s_diff/(s_same+s_diff); % Mutation probability per node per round
v = s_same/(s_same+s_diff);
steps = 5000; % Number of time steps (rounds)

x = zeros(1,N); % Vector with 1 for D_1 and 0 for D_2
X = zeros(1,steps); % Vector of mean cooperation at time t

% Construct a Bernoulli graph
W = rand(N)<p; % Random binary matrix
W = triu(W',1)+triu(W',1)'; % Undirected, no self-interaction

[I, J] = find(W==1); % Find all edges
M = length(I); % Total number of edges
averageNeighbors = M/N;

% Simulate many rounds
hwait = waitbar(0,'Please wait. Processing evolutionary dynamics.');
for t = 1:steps
    if mod(t,3000)==0
        waitbar(t/steps,hwait,sprintf('Please wait. Processing evolutionary dynamics.\n%.1f %%',(t/steps)*100));
    end
    F = zeros(N); % Set fitness to 0
    for m = 1:M % Loop through edges and play games
        i = I(m); j = J(m);
        xi= x(i); xj= x(j);
        F(i,j) = s_same*xi*xj+s_diff*(1-xi)*xj+s_diff*xi*(1-xj)+s_same*(1-xi)*(1-xj); % Add payoff
    end
    f = sum(F')./sum(F'>0); %#ok<UDIM> % Average payoffs
    born= 1+sum((cumsum(f)/sum(f))<rand); % Choose node to replicate
    die = 1+sum((cumsum(W(born,:))/sum(W(born,:)))<rand); % Choose node to die
    x(die) = mod(x(born)+(rand<u),2); % Replace node, factoring in mutation probability
    % x = mod(x+(rand(1,N)<u),2); % Mutation
    X(t) = mean(x); % Store average cooperation
end
delete(hwait);
% Plot connection graph for population
figure('position', [200, 50, 600, 600])
% [B, XY] = bucky;
% gplot(W, XY, '-ok')
G = graph(W);
plot(G)
set(gca,'visible','off')

threshold = zeros(1,steps) + (1-sqrt(1-4*s_diff/(1-s_diff^2)))/2;

% Plot fraction of cooperators over time
figure('position', [50, 150, 1400, 400])
plot(X)
hold on
    plot(threshold)
hold off
ylim([0 1])
xlabel('Time steps')
ylabel('Fraction of Competing Language')

