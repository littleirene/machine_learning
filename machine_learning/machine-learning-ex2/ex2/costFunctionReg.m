function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

[m, n] = size(X);
thetasum = 0;
H = 0;

for j = 2:n
	thetasum += theta(j) * theta(j);
end

for i = 1:m
	x = X(i, :);
	z = x * theta;
	h = sigmoid(z);
	cost = (-y(i)) * log(h) - (1-y(i))*log(1-h);
	H += cost;
end

J = thetasum * lambda / (2 * m) + H / m;


for j = 1:n
	H = 0;
	for i = 1:m
		x = X(i, :);
		z = x * theta;
		h = sigmoid(z);
		cost = (h - y(i)) * x(j);
		H += cost;
	end
	if j == 1
		grad(j) = H / m;
	else
		grad(j) = H / m + lambda * theta(j) / m;
	end
end






% =============================================================

end
