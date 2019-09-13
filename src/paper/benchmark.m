function [x, dur, err] = benchmark()

Nstart= 4;
Nmax = 40;
Nstep= 4;

avgFactor = 10;   % how many times we repeat the same computation

count = (Nmax-Nstart)/Nstep + 1;  % number of tests
x   = zeros(1, count);
dur.LT    = zeros(1, count);
dur.plain = zeros(1, count);
dur.new   = zeros(1, count);

err.LT    = zeros(1, count);
err.plain = zeros(1, count);
err.new   = zeros(1, count);

i = 1;

for dof = Nstep : Nstep : Nmax
    model = autoTree(dof, 1, rand(1,1), 1);
    q     = rand(dof,1);

    t = cputime();
    for j = 1 : avgFactor
        H  = Halone(model, q);
        L  = LTL(H, model.parent);
        Li = invertLTriang(L);
        Hi1= LLTMult(Li);  % Li * Li'
    end
    dur.LT(i) = (cputime() - t) / avgFactor;

    t = cputime();
    for j = 1 : avgFactor
        H  = Halone(model, q);
        Hi2= inv(H);
    end
    dur.plain(i) = (cputime() - t) / avgFactor;

    t  = cputime();
    for j = 1 : avgFactor
        Hi3 = Hinv(model, q);
    end
    dur.new(i) = (cputime() - t) / avgFactor;

    x(i) = dof;


    err.LT(i) = sum(sum(abs(H * Hi1))) - dof;
    if(err.LT(i) > 1e-6)
        warning("LT method");
    end
    err.plain(i) = sum(sum(abs(H * Hi2))) - dof;
    if(err.plain(i) > 1e-6)
        warning("Plain inversion method");
    end
    err.new(i) = sum(sum(abs(H * Hi3))) - dof;
    if(err.new(i) > 1e-6)
        warning("Our algorithm");
    end

    i = i + 1;
end



