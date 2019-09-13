function Res = LLTMult(L)
  [row, col] = size(L);
  Res = zeros(row,col);

  for r = 1 : row
    for c = 1 : col
      s = 0;
      for el = 1 : min(r,c)
        s = s + L(r,el) * L(c,el);
      end
      Res(r,c) = s;
    end
  end
end
