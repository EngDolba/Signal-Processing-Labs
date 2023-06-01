function ans = empcdf(X, t)
% empcdf: Calculate the empirical cumulative distribution function (CDF) of a dataset X.
% Inputs:
%   - X: Input dataset
%   - t: Threshold values for which the CDF is calculated
% Outputs:
%   - ans: Empirical CDF values for each threshold t

% Initialize an empty array a
a = zeros(1, length(t));

% Iterate over each threshold value t
for i = 1:length(t)
    % Count the number of elements in X that are less than or equal to t(i)
    a(i) = sum(X <= t(i));
end
%normalize the counts by the length of X:
 ans = a / length(X);

end
