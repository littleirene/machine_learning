function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
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
    %       of the cost function (computeCost) and gradient here.
    %
    %n = length(X(1,:)');
    %the = zeros(2, 1);
    H = 0;
    
    for i = 1:m,
        x = X(i,:);
        h = x*theta - y(i);
        H += h;
    end;
    theta0 = theta(1) - alpha * (H / m);

    H = 0;
    for i = 1:m,
        x = X(i,:);
        h = (x*theta - y(i)) * x(1,2);
        H += h;
    end;
    theta1 = theta(2) - alpha * (H / m);
    
    J_history(iter) = computeCost(X, y, theta);

    theta(1) = theta0;
    theta(2) = theta1;
end


    % ============================================================

    % Save the cost J in every iteration
    

%plot(iter, J_history)


end
