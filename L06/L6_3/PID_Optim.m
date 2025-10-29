options = optimoptions('particleswarm','PlotFcn',@pswplotbestf,...
    'SwarmSize',10,MaxIterations=30,UseParallel=false);
 lb = [20 1 1];
 ub = [80 5 100];
rng default
nvars = 3;
[x, fval] = particleswarm (@PSO_PID,nvars,lb,ub,options);

