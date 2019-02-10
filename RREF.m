%% Computing the Reduced Row Echelon Form of a Matrix
% Nikhil Balwani (1641070), MATLAB code

%% Function declaration
function M = RREF(Matrix)

    M = Matrix;                                                             % The matrix to return, leaving the original matrix untouched
    lead = 1;                                                               % To store the position of leading 1 in the current row
    rows = size(M, 1);                                                      % Number of Rows in the matrix
    columns = size(M, 2);                                                   % Number of Columns in the matrix
    
    for r = 1:rows                                                          % Iterating through the rows in the matrix for operations
        if lead > columns                                                   % If the lead position has exceeded the number of columns, break the iteration
            break;
        end
        
        i = r;                                                              % Starting from the current row
        
        while M(i, lead) == 0                                               % While the current leading position in the row is a zero
            i = i + 1;                                                      % Incrementing i
            
            if i > rows                                                     % If only zeros are scanned in the current position
                i = r;                                                      % Assigning r to i
                lead = lead + 1;                                            % Incrementing the leading position by 1
                
                if lead > columns                                           % Lead should not exceed the number of columns
                    break;
                end
            end
        end
        
        
        if i ~= r
            temp = M(i, :);                                                 % Swapping the two rows
            M(i, :) = M(r, :);
            M(r, :) = temp;
        end
        
        if M(r, lead) ~= 0                                                  % If the leading position is non zero, divide the row by M(r, lead) to produce a 1 in the pivot position
            M(r, :) = M(r, :) / M(r, lead);
        end 
        
        for i = 1:rows                                                      % Iterating through the rows again
            if i ~= r                                                       % i should not equal r
                M(i, :) = M(i, :) - M(i, lead) * M(r, :);                   % Row operation, subtracting the lead position times rth row from the ith row
            end
        end
        
        lead = lead + 1;                                                    % Incrementing lead
    end        
end