%% Tutorial#3 - Implement Multivariate Regression Using Gradient Descent and Normal Equation

% Clear all variables and close all plots
clear all; close all; 

%% ******************* Loading Data *******************
data = load('dataset.dat')
disp('The dataset was loaded sucessfully!');

X = data(:,1:end-1);% features
y = data(:,end);% targets

disp('Press any key to continue.');
pause;

%% ******************* Features Normalization *******************
norm_X = X;% contains normalized features
mu = zeros(1,size(X,2));% includes the mean of each feature
sd = zeros(1,size(X,2));% includes the standard deviation of each feature

for i = 1:size(X,2)
    mu(i) = mean(X(:,i));
    sd(i) = std(X(:,i));
    norm_X(:,i) = (norm_X(:,i) - (mu(i)*ones(size(X, 1),1)))./sd(i);
end

disp('The features were normalized.');
disp('Press any key to continue.');
pause;

%% ******************* Cost for Zero Theta *******************
norm_X = [ones(length(y),1) , norm_X];
J = calculateCost(norm_X,y,zeros(size(norm_X,2),1));
disp('The cost when theta values are zeros:');
disp(J);
disp('Press any key to continue.');
pause;
%% ******************* Gradient Descent **********************
theta = gradientDescent(norm_X,y,zeros(size(norm_X,2),1));
disp('Theta values are');
disp(theta);
disp('Press any key to continue.');
pause;
%% ******************** Make Predictions *********************
x_norm = ([28,100,50]-mu)./sd;
p = [1,x_norm] * theta; % prediction
fprintf('The predicted mean January high temperature of a county with 28 latitude, 100 longitude, and 50 elevation is %f\n',...
p);