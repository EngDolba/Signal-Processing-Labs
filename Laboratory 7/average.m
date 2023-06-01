function av = average(x)
% average: Calculate the average of a vector x.
% Inputs:
%   - x: Input vector
% Outputs:
%   - av: Average value of the input vector

N = length(x); % Get the length of the vector x and store it in N
av = (1/N) * sum(x); % Calculate the average by summing all elements in x and dividing by the length N
end
