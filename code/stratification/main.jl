using JuMP
using DataFrames
using CSV
using HiGHS
using Random

function get_optimizer()
    # setup solvers
    oa_solver = optimizer_with_attributes(HiGHS.Optimizer,
    MOI.Silent() => true,
    "mip_feasibility_tolerance" => 1e-8,
    "mip_rel_gap" => 1e-6,
    )
    conic_solver = optimizer_with_attributes(Hypatia.Optimizer, 
    MOI.Silent() => true,
    )
    opt = optimizer_with_attributes(Pajarito.Optimizer,
    "time_limit" => 60, 
    "oa_solver" => oa_solver, 
    "conic_solver" => conic_solver,
    )
end

function to_one_hot(col)
    n = length(col)
    k = maximum(col) + 1
    A = zeros(Int, n, k)
    for (i, k) in enumerate(col)
        A[i, k+1] = 1
    end
    A
end


df = CSV.read("mock_df.csv", DataFrame)
A = hcat([to_one_hot(col) for col in eachcol(df)]...)

ns=2
sj = sum(A, dims=1)
st = sj / ns
n = nrow(df)
np = size(A, 2)
model = Model(HiGHS.Optimizer)
# model = Model(get_optimizer())
@variable(model, x[1:n], Bin)
@expression(model, s1, sum(A .* x, dims=1))
@expression(model, s2, sum(A .* (-x .+ 1), dims=1))
@variable(model, z1[1:np])
@constraint(model, z1 .>= st - s1)
@constraint(model, z1 .>= s1 - st)
@variable(model, z2[1:np])
@constraint(model, z2 .>= st - s2)
@constraint(model, z2 .>= s2 - st)
@objective(model, Min, sum(z1) + sum(z2))
optimize!(model)
solution_summary(model)
xv = value.(x)
df[!, "split"] = trunc.(Int, xv .+ 1)
combine(groupby(df, [:c1, :split]), nrow)
combine(groupby(df, [:c2, :split]), nrow)

Cz = zeros(Int, ns, n)
Cz[1, 1:4] .= 1
Cz[2, 5:9] .= 1
Cz[3, 10:11] .= 1
Cz




function run_model(A, ns)
    n = size(A, 1)
    np = size(A, 2)
    sj = sum(A, dims=1)
    st = sj / ns
    model = Model(HiGHS.Optimizer)
    @variable(model, C[1:ns,1:n], Bin)
    @constraint(model, sum(C, dims=1) .== 1)
    @variable(model, Z[1:ns, 1:np])
    @constraint(model, Z .>= C*A .- st)
    @constraint(model, Z .>= -(C*A .- st))
    @objective(model, Min, sum(Z)) 
    optimize!(model)
    Cv = value.(C)
    model, Cv
end

df = CSV.read("mock_df.csv", DataFrame)
n = 1_000
df = DataFrame([rand(1:10, n) for _ in 1:5], :auto)
A = hcat([to_one_hot(col) for col in eachcol(df)]...)

model, Cv = run_model(A, 4)
df[!, "split"] = vec(mapslices(argmax, Cv,dims=1))
combine(groupby(df, [:x1, :split]), nrow)
combine(groupby(df, [:x2, :split]), nrow)
combine(groupby(df, [:x3, :split]), nrow)
combine(groupby(df, [:x4, :split]), nrow)
combine(groupby(df, [:x5, :split]), nrow)
combine(groupby(df, [:split]), nrow)

solution_summary(model)