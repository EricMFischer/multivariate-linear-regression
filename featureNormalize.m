function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

% You need to set these values correctly
X_norm = X;
n = size(X, 2);
mu = zeros(1, size(X, 2));
sigma = zeros(1, size(X, 2));

% ====================== YOUR CODE HERE ======================
% Instructions: First, for each feature dimension, compute the mean
%               of the feature and subtract it from the dataset,
%               storing the mean value in mu. Next, compute the
%               standard deviation of each feature and divide
%               each feature by it's standard deviation, storing
%               the standard deviation in sigma.
%
%               Note that X is a matrix where each column is a
%               feature and each row is an example. You need
%               to perform the normalization separately for
%               each feature.
%
% Hint: You might find the 'mean' and 'std' functions useful.
%

% For each feature j, calculate mean and standard deviation.
% For column j of dataset, subtract mean and divide by standard deviation.
% Store mean value in mu and standard deviation value in sigma.
for j = 1:n
  mean_feature = mean(X(:,j));
  std_dev_feature = std(X(:,j));

  mu(1,j) = mean_feature;
  sigma(1,j) = std_dev_feature;

  X_norm(:,j) = (X(:,j) - mean_feature) / std_dev_feature;
end

end
