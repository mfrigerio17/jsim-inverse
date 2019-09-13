function V = invertLTriang(A)

n = size(A,1);

for i = 1:n
    V(i,i) = 1/A(i,i);
end

for i = 2:n
    for j = i-1 : -1 : 1
        temp = 0;
        for k = j+1:i
            temp = temp + V(i,k)*A(k,j);
        end
        V(i,j) = -V(j,j) * temp;
    end
end


end
