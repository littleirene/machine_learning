function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    %
    n = size(X, 2);
    theta1 = zeros(n, 1);
    for j = 1:n
        H = 0;
        for i = 1:m
            x = X(i,:);
            h = (x*theta - y(i)) * x(j);
            H += h;

        end
        theta1(j) = theta(j) - alpha * (H / m);
    end



    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCostMulti(X, y, theta);

    for j = 1:n
        theta(j) = theta1(j);
    end

end

end
