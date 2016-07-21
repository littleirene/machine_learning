function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

% ====================== Part One ===============================
X = [ones(m,1), X];

% First layer,size(a1) = 5000 * 401
a1 = X;

% Hidden layer, size(Theta1) = 25 * 401
z2 = a1 * Theta1';   %size(z2) = 5000 * 25
a2 = sigmoid(z2);
a2 = [ones(m, 1), a2];   %size(a2) = 5000 * 26

% Output layer, size(Theta2) = 10 * 26
z3 = a2 * Theta2';    %size(z3) = 5000 * 10
a3 = sigmoid(z3);     %size(a3) = 5000 * 10

% reshape Y
Y = zeros(m, num_labels);  %size(Y) = 5000 * 10
for i = 1 : m
	Y(i,y(i)) = 1;
end

% Compute unregularied cost function
cost = sum(sum(log(a3) .* Y + log(1 - a3) .* (1 - Y)));

J = - cost / m;

% Compute regularized cost function
regular1 = sum(sum(Theta1(:, 2:end).^2));
regular2 = sum(sum(Theta2(:, 2:end).^2));

J += lambda * (regular1 + regular2) / (2 * m);

% ====================== Part Two ================================
% Output layer
delta3 = a3 - Y;  %size(delta3) = 5000 * 10

% Hidden layer
delta2 = (delta3 * Theta2) .* sigmoidGradient([ones(m,1),z2]); % (5000 * 10) * (10 * 26) .* (5000 * 26) 
delta2 = delta2(:,2:end);    %size(delta2) = 5000 * 25

Theta1_grad += delta2' * a1; % (25 * 401) = (25 * 5000) * (5000 * 401)
Theta2_grad += delta3' * a2; % (10 * 26) = (10 * 5000) * (5000 * 26)

Theta1_grad = Theta1_grad / m;
Theta2_grad = Theta2_grad / m;

% ===================== Part Three ===============================
% regularization
Theta1_temp = lambda / m * Theta1;
Theta2_temp = lambda / m * Theta2;

Theta1_temp(:, 1) = zeros(size(Theta1, 1), 1);
Theta2_temp(:, 1) = zeros(size(Theta2, 1), 1);

Theta1_grad += Theta1_temp;
Theta2_grad += Theta2_temp;







% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end