function f = dov(dof, nlr,cov, numPar)
t1 = tinv(0.16, dof);
t2 = tinv(0.84, dof);
C = diag(cov);
dovTeor = zeros(numPar);
for i = 1:numPar
    for j = 1:2
        if j==1
            dovTeor(i,j) = nlr(i) + t1*sqrt(C(i));  
        else
            dovTeor(i,j) = nlr(i) + t2*sqrt(C(i));  
        end            
    end
end
f = dovTeor;