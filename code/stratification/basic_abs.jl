using JuMP
using HiGHS
using Random


A = [
    1 2
    2 4
    8 9
    9 -1
]
@show A
model = Model(HiGHS.Optimizer)
@variable(model, x[1:4, 1:2], Bin)
@constraint(model, sum(x, dims=2) .== 1)
@objective(model, Max, sum(x.*A))
optimize!(model)
value.(x)
argmax(A, dims=2)

A = [
    1 2
    -2 4
    8 -9
    9 -1
    1 3
    4 9
]
n, m = size(A)
@show A
model = Model(HiGHS.Optimizer)
@variable(model, x[1:n, 1:m], Bin)
@constraint(model, sum(x, dims=2) .== 1)
@objective(model, Max, sum(x.*A))
optimize!(model)
value.(x)


A = [
    1 2
    -2 4
    8 -9
    9 -1
    1 3
    4 9
]
n, m = size(A)
@show A
model = Model(HiGHS.Optimizer)
@variable(model, x[1:n, 1:m], Bin)
@constraint(model, sum(x, dims=2) .== 1)
@expression(model, t, sum(x.*A))
@variable(model, z>=0)
@constraint(model, t <= z )
@constraint(model, -t <= z )
@objective(model, Min, z)
optimize!(model)
value.(x)
value(z)
abs(sum(value.(x).*A))