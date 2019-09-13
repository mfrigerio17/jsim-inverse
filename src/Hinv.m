function  varargout = Hinv( model, q)

Hi = zeros(model.NB, model.NB);

for i = 1:model.NB
  [ XJ, S{i} ] = jcalc( model.jtype{i}, q(i) );
  Xup{i} = XJ * model.Xtree{i};
  IA{i} = model.I{i};
end


for i = model.NB:-1:1
  aux  = IA{i} * S{i};
  m{i} = inv(S{i}' * aux);
  T{i} = aux * m{i};

  parent = model.parent(i);
  if parent ~= 0
    IA{parent} = IA{parent} + Xup{i}' * (IA{i} - T{i}*aux') * Xup{i};
  end
end


% Inward propagation of the bias force, foreach body, along the
% ancestors chain until the base.

for i = model.NB:-1:1
  j = i;
  pIn = T{i};
  while model.parent(j) > 0
    a = model.parent(j);

    pIn     = Xup{j}' * pIn;          % bias wrench in parent ('a') coordinates
    Hi(a,i) = - m{a} * S{a}' * pIn;   % h_{a<-i}
    Hi(i,a) = Hi(a,i);
    aux     = -S{a} * Hi(a,i);        % = Φ_a N_{a<-k} T_k
    pIn     = pIn + IA{a} * -aux;     %    pIn = N{a} * pIn;

    j = a;
  end
  acc{1}{i} = aux;
end


% The "bouncing feedback".
% Start from bodies at depth 2 (bodies at depth 1 are connected to the base),
% i.e. body #2.

Hi(1,1) = m{1};
for b = 2:model.NB
  par = model.parent(b);

  %if par ~= 0 % (*)

    Hi(b,b) = m{b} + T{b}' * Xup{b} * acc{par}{b};

    % For every body with larger id.. --> calculate only the upper triangular block
    for b2 = b+1 : model.NB
      a_parent   = Xup{b} * acc{par}{b2};
      Hi(b,b2)   = Hi(b,b2) + T{b}' * a_parent;
      Hi(b2,b)   = Hi(b,b2);                   % lower triangular is the same
      acc{b}{b2} = a_parent - S{b} * Hi(b,b2);
    end
  %end
end

% (*) useful only for improper models, as only body 1 should have 0 as parent;
% The opposite would mean that there are disconnected subtrees represented in
% the same model (like the 4 legs of a dog, but with the trunk considered fixed).



varargout{1} = Hi;
if(nargout>1)
  dbg.IA  = IA;
  dbg.T   = T;
  dbg.m   = m;
 %dbg.phi = phi;
 %dbg.p   = p;
 %dbg.N   = N;
 %dbg.NP  = NP;
  dbg.Xup = Xup;
  dbg.S   = S;
  dbg.acc = acc;
  varargout{2} = dbg;
end


