function  varargout = Hinv_fb( model, q)

Hi = zeros(model.NB-6, model.NB-6);

for i = 7:model.NB
  [ XJ, S{i} ] = jcalc( model.jtype{i}, q(i-6) );
  Xup{i} = XJ * model.Xtree{i};
  IA{i} = model.I{i};
end
IA{6} = model.I{6};


for i = model.NB:-1:7
  aux  = IA{i} * S{i};
  m{i} = inv(S{i}' * aux);
  T{i} = aux * m{i};            % the T operator for body i

  parent = model.parent(i);
  IA{parent} = IA{parent} + Xup{i}' * (IA{i} - T{i}*aux') * Xup{i};
end

phi{6} = inv(IA{6}); % can do it more efficiently with specialized formula for symmetric matrix ?

acc = cell(model.NB,1);
for body = 1:model.NB
  acc{body} = cell(model.NB, 1);
end

Fi = zeros(6, model.NB-6);

for i = model.NB:-1:7
  j = i;
  pIn = T{i};
  while model.parent(j) > 6
    a = model.parent(j);

    pIn = Xup{j}' * pIn;         % bias wrench in parent ('a') coordinates
    Hi(a-6,i-6) = - m{a} * S{a}' * pIn;
    Hi(i-6,a-6) = Hi(a-6,i-6);
    aux = - S{a} * Hi(a-6,i-6);
    pIn = pIn + IA{a} * -aux;

    j = a;
  end
  %p{6}{i} = Xup{j}' * pIn;
  acc{6}{i} = phi{6} * Xup{j}' * pIn;
  Fi(:,i-6) = - acc{6}{i};
end

% Calculate the bouncing feedback.

for b = 7:model.NB
  par = model.parent(b);

    % The diagonal element
    Hi(b-6,b-6) = m{b} + T{b}' * Xup{b} * acc{par}{b};

    % For every body with larger id..
    for b2 = b+1 : model.NB
      a_parent     =  Xup{b} * acc{par}{b2};
      Hi(b-6,b2-6) = Hi(b-6,b2-6) + T{b}' * a_parent;
      Hi(b2-6,b-6) = Hi(b-6,b2-6);

      acc{b}{b2} = a_parent - S{b} * Hi(b-6,b2-6);
    end
end



varargout{1} = phi{6};
varargout{2} = Fi;
varargout{3} = Hi;
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
  varargout{4} = dbg;
end


