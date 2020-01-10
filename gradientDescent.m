%%The function perform gradient descent to learn theta values
% Parameters:
% X is the matrix of the normalized features for all the examples (m)
% y is the vector of the targets for all the examples (m)
function theta = gradientDescent(X,Y,theta)

alpha = 0.0001;%set the learning rate
itarations = 55000;% set the number of steps taken by gradient descent

for i = 1:itarations

%Write the code to update theta values simultaneously

len=length(X);
lenT=length(theta);
for j=1:lenT
theta(j)=theta(j)-alpha*(1/len)*sum(((X*theta)-Y).*X(:,j));
end

%Print the cost J to see how it will be decreased in each iteration
disp(calculateCost(X,Y,theta));


end

end 


