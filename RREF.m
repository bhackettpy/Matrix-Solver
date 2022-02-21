function [A_RREF] = RREF(A)

A

%% Differentiate between a regular and augmented matrix
[r,c] = size(A);

if r == c
    col = c;
else
    col = c - 1;
end

%% First, check to see if a 1 exists in the first column
swap_check = find(A(:,1)==1);

if ~isempty(swap_check) && swap_check(1) ~= 1
    B = A(swap_check,:);
    C = A(1,:);
    
    A(1,:) = B;
    A(swap_check,:) = C;
    
    A  
else
    A(1,:) = A(1,:)/A(1,1);
    A
end

%% 1st column row mathematics
zero_check = find(A(:,1)==0);

if ~isempty(zero_check)
    for i = 2:r
        if i == zero_check
            continue
        end
        scalar = A(i,1);
        A(i,:) = A(i,:) - scalar*A(1,:);
        A
    end
else
    for i = 2:r
        if A(i,1) == 0
            A
            continue
        else
            scalar = A(i,1);
            A(i,:) = A(i,:) - scalar*A(1,:);
            A
        end
    end
end
    
%% Check for 0'd out row
if sum(A(1,:)==zeros(1,c)) == 4 | sum(A(2,:)==zeros(1,c)) == 4 | sum(A(3,:)==zeros(1,c)) == 4
    A
    error('This problem has a dependent solution and can be solved from this point on manually')
end


%% 2nd-on column row mathematics
for j = 2:col
    
    zero_check = find(A(:,j)==0);
    scalars = A(:,j);
        
    scalar_ind = find(A(:,j)~=0);
        
    for i = 1:r
        %Zero tolerance check and zero row check
        A(abs(A)<1e-3) = 0;
        if sum(A(1,:)==zeros(1,c)) == 4 | sum(A(2,:)==zeros(1,c)) == 4 | sum(A(3,:)==zeros(1,c)) == 4
            A
            error('This problem has a dependent solution and can be solved from this point on manually')
        end
        %1st Row, 2nd OR 3rd Column
        if i == 1
            if j == 2
                if i == zero_check
                    A
                    continue
                else
                    A(i,:) = A(i,:) - A(i,j)/scalars(scalar_ind(2))*A(scalar_ind(2),:);
                    scalars(1) = A(i,j);
                    A
                end
            else
                if i == zero_check
                    A
                    continue
                else
                    A(i,:) = A(i,:) - A(i,j)/scalars(scalar_ind(end))*A(scalar_ind(end),:);
                    scalars(1) = A(i,j);
                    A
                end
            end
            
        %2nd Row    
        elseif i == 2
                %2nd Column
                if j == 2
                    A(i,:) = A(i,:)/A(i,j);
                    A
                %3rd Column
                else
                    if i == zero_check
                        A
                        continue
                    else
                        A(i,:) = A(i,:) - A(i,j)/scalars(scalar_ind(end))*A(scalar_ind(end),:);;
                        scalars(2) = A(i,j);
                        A
                    end
                end
            
        %3rd Row    
        elseif i == 3
            %3rd Column
            if j == 3                   
                if A(i,j) == 1
                    A
                    continue
                else
                    A(i,:) = A(i,:)/scalars(3);
                    scalars(3) = A(i,j);
                    A
                end
            %2nd Column
            else
                if i == zero_check
                    A
                    continue
                else
                    A(i,:) = A(i,:) - scalars(3)*A(2,:);
                    scalars(3) = A(i,j);
                    A
                end
            end
        end             
    end
end


A_RREF = A;


end
