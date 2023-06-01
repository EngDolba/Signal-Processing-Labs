function sigmasquare = standardDispersion(x)
% standardDispersion: Calculate the standard dispersion (variance) of a dataset x.
% Inputs:
%   - x: Input dataset
% Outputs:
%   - sigmasquare: Standard dispersion (variance) of the input dataset

N = length(x); % Get the length of the dataset x and store it in N
avg = average(x); % Calculate the average of the dataset x using the average function

% Calculate the sum of squared differences between each element in x and the average
squared_diff = (x - avg).^2;

% Calculate the standard dispersion (variance) by summing the squared differences and dividing by the length N
sigmasquare = (1/N) * sum(squared_diff);
end
