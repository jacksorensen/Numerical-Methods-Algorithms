function [L,U,P] = luFactor(A)
%This function gives the lower and upper triangular matrix from the LU
%decompostion of A.
%A is a coefficient matrix
%L is an output lower triangular matrix
%U is an output upper triangular matrix
%P is the pivot matrix
[r,c] = size(A);
%Error to make sure the input is a square matrix
if r~=c
    error('Matrix is not Square')
end
%Sets up the lower triangular matrix
L = eye(r);
%Sets up the pivot matrix
P=L;
%Sets up the upper triangular matrix
U=A;
%First pivot
for i=1:r
    if abs(A(i,1))>abs(A(1,1))
        temp=A(1,:);
        A(1,:)=A(i,:);
        A(i,:)=temp;
        temp_3=P(1,:);
        P(1,:)=P(i,:);
        P(i,:)=temp_3;
    end
end
%First elimination
for j=2:r
    L(j,1)=(A(j,1)/A(1,1));
    U(j,:)=A(j,:)-L(j,1)*A(1,:);
end
%Second pivot
for k=2:r
    if abs(A(k,2))>abs(A(2,2))
        temp_2=A(2,:);
        A(2,:)=A(k,:);
        A(k,:)=temp_2;
        temp_4=P(2,:);
        P(2,:)=P(i,:);
        P(i,:)=temp_4;
    end
end
%Second Elimination
for u=3:r
    L(u,2)=(U(u,2)/U(2,2));
    U(u,:)=U(u,:)-L(u,2)*U(2,:);
end
    

        
        

