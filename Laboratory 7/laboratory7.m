x1 = randn(1,1e4); % Generate a vector of 10,000 random numbers from a standard normal distribution
N = length(x1); % Store the length of the vector in the variable N
ux = mean(x1); % Calculate the mean of the vector and store it in the variable ux
sigmasquare = var(x1); % Calculate the variance of the vector and store it in the variable sigmasquare
b = 3; % Set the value of b to 3
a = 3; % Set the value of a to 3
x2 = a*x1+b; % Apply a linear transformation to the vector x1 using the values of a and b
%plot(x2) % Uncomment this line if you want to plot the transformed vector x2

% Calculate the probability density function (pdf) of x2 assuming a normal distribution
pdf = (1/(sqrt(2*pi)*sqrt(var(x2))))*exp(-1/(2*var(x2)).*((x2-mean(x2)).^2));

ecf = empcdf(rand(1,200),-1:0.001:2); % Calculate the empirical cumulative distribution function (ecf) using 200 random numbers between -1 and 2
plot(ecf); % Plot the empirical cumulative distribution function

dist = rand(1,200); % Generate a vector of 200 random numbers
transformed_dist = dist.*(-log(1-dist)/3); % Apply a transformation to the vector dist using the formula -ln(1-dist)/3 and store the result in the variable transformed_dist

