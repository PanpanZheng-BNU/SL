using Plots, Random, Statistics

function min_sq(x::Array, y::Array)
    x_bar,y_bar = mean(x), mean(y)
    beta_1 = sum((x .- x_bar).*(y .- y_bar))./sum((x.-x_bar).^2)
    beta_0 = y_bar - beta_1*x_bar
    return [beta_1, beta_0]'
end





N = 100;
x = randn(N); 
y = 10 .* x .+ 2randn(N) .+ 2*ones(N)
x1 = x .- mean(x)*ones(N);
y1 = y .- mean(y)*ones(N);

f(xx) = min_sq(x,y) * [xx, 1]
f1(xx) = min_sq(x1,y1) * [xx, 1]
scatter(x,y)
plot!(x->f(x))
plot!(x->f1(x))




using Random
Random.seed!(1)
n=100;p=2;
beta=[1,2,4];
x=randn(n,2)
X=hcat(ones(n),x);
y=sum([beta[i] .* X[:,i] for i in 1:3])
(X'*X)^(-1)*X'*y


function min_sq_matrix(X::Matrix, y::Array)
    return (X'*X)^(-1)*X'*y
end



