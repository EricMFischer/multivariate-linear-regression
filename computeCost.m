function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.

% Vectorized Implementation

m = length(y);
predictions = X * theta;
sqr_errors = (predictions - y) .^ 2;

J = 1 / (2 * m) * sum(sqr_errors);
% J = 1 / (2 * m) * (predictions - y)' * (predictions - y);


% =========================================================================

end
