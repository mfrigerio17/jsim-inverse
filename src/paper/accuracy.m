function [x, err] = accuracy()

% Degrees Of Freedom
Nstart= 20;
Nmax  = 30;
Nstep = 2;

avgFactor = 5;

count = (Nmax-Nstart)/Nstep + 1;
x   = zeros(1, count);

sidx = 1;
for taper = [1, 0.9]

    err_LT    = zeros(1, count);
    err_plain = zeros(1, count);
    err_new   = zeros(1, count);
    condition = zeros(1, count);
    i = 1;

    for dof = Nstart : Nstep : Nmax
      model = autoTree(dof, 1, 0, taper);

      cum_err_LT    = 0;
      cum_err_plain = 0;
      cum_err_new   = 0;

      for j = 1 : avgFactor
        q  = rand(dof,1);
        H  = Halone(model, q);

        % LTL method
        L  = LTL(H, model.parent);
        Li = invertLTriang(L);
        Hi = LLTMult(Li);  % Li * Li'
        cum_err_LT = cum_err_LT + sum(sum(abs(H * Hi))) - dof;

        % Plain matrix inversion
        Hi = inv(H);
        cum_err_plain = cum_err_plain + sum(sum(abs(H * Hi))) - dof;

        % New algorithm
        Hi = Hinv(model, q);
        cum_err_new = cum_err_new + sum(sum(abs(H * Hi))) - dof;
      end

      err_new(i)   = cum_err_new / avgFactor;
      err_LT(i)    = cum_err_LT  / avgFactor;
      err_plain(i) = cum_err_plain / avgFactor;

      if(err_new(i) > 1e-6)
        warning( ["For the new method: " num2str(err_new(i))] );
      end
      if(err_LT(i) > 1e-6)
        warning( ["For the LTL method: " num2str(err_LT(i))] );
      end
      if(err_plain(i) > 1e-6)
        warning(["For the plain matrix inversion method: " num2str(err_plain(i))]);
      end

      %condition(i) = cond(H);
      x(i) = dof;
      i = i + 1;
    end

    err(sidx).LT    = err_LT;
    err(sidx).plain = err_plain;
    err(sidx).new   = err_new;
    err(sidx).taper = taper;
%    err(sidx).condition = condition;

    sidx = sidx + 1;

end

