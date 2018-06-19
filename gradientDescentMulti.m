function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

m = length(y);
n = length(theta); % n = number of features + 1
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta.
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    %

    % Storage for theta values to update simultaneously once we find them all
    updated_theta = zeros(n, 1);

    % Note: j is feature index, i is training example index
    for j = 1:n

        J_derivative = 0;
        for i = 1:m % hypothesis, actual, err, and theta_val are all per example i
            hypothesis = X(i, :) * theta;
            actual = y(i);
            err = hypothesis - actual;
            theta_val = X(i, j);
            J_derivative += (err * theta_val);
        end

        J_derivative /= m;
        updated_theta(j) = theta(j) - (alpha * J_derivative);
    end

    % Replace theta with updated_theta values that will act as a basis to further
    % minimize J(theta)
    theta = updated_theta;

    J = computeCost(X, y, theta);
    fprintf('Theta found by gradient descent after this iteration:\n');
    fprintf('%f\n', theta);
    fprintf('Value of cost function J(theta) after this iteration: %f\n', J);

    % Save the cost J in every iteration
    J_history(iter) = J;


end

end
