using Pkg
path = "static/posts/pizza-twice-as-big"
Pkg.activate("code/pizza-twice-as-big")
Pkg.instantiate()
using Plots
using JuMP
import Ipopt
using Distributions

function circle(r, x, y)
    t = 0:0.001:2π
    x .+ r .* sin.(t), y .+ r .* cos.(t)
end
pcircle(r, x, y; kwargs...) = plot(circle(r, x, y), seriestype=:shape, opacity=.2; kwargs...)
pcircle!(r, x, y; kwargs...) = plot!(circle(r, x, y), seriestype=:shape, opacity=.4; kwargs...)

begin
    n = 20
    maR = 13.0
    miR = 7.0
    avR = (maR + miR) / 2
    runi = Uniform(0.2, 1.5)
end

begin
    model = Model(Ipopt.Optimizer)
    # set_optimizer_attribute(model, "print_level", 7)
    @variable(model, -avR <= x[i = 1:n] <= avR, start = (rand() - 0.5) * avR/2)
    @variable(model, -avR <= y[i = 1:n] <= avR, start = (rand() - 0.5) * avR/2)
    @variable(model, miR <= R <= maR, start = avR)
    r = rand(runi, n)
    @NLconstraint(model, [i = 1:n, j = (i+1):n], ((x[i] - x[j])^2 + (y[i] - y[j])^2) >= (r[i] + r[j]) ^ 2)
    @NLconstraint(model, [i = 1:n], (x[i] ^ 2 + y[i] ^ 2) <= (R - r[i]) ^ 2)
    @NLobjective(model, Min, R)
    optimize!(model)
end

# sv = readlines(rd)
# redirect_stdout(original_stdout)


begin
    RR = value(R)
    xv = value.(x)
    yv = value.(y)
    p = pcircle(RR, 0, 0, aspect_ratio=:equal, xaxis=false, yaxis=false, legend=false, ticks = false)
    for i in 1:n
        pcircle!(r[i], xv[i], yv[i])
    end
    p
end


# begin
#     # begin
#     #     model = Model(Ipopt.Optimizer)
#     #     @variable(model, -R <= x[i = 1:n] <= R, start = (rand() - 0.5) * R/2)
#     #     @variable(model, -R <= y[i = 1:n] <= R, start = (rand() - 0.5) * R/2)
#     #     r = rand(n) * R / 2
#     #     # @NLconstraints(model, begin
#     #     #     [i = 1:n, j = (i+1):n], (x[i] - x[j])^2 + (y[i] - y[j])^2 >= (r[i] + r[j]) ^ 2
#     #     # end)
#     #     @NLconstraint(model, [i = 1:n, j = (i+1):n], ((x[i] - x[j])^2 + (y[i] - y[j])^2) >= (r[i] + r[j]) ^ 2)
#     #     e2 = @NLexpression(model ,sum((x[i] ^ 2 + y[i] ^ 2) - (R - r[i]) ^ 2 for i in 1:n))
#     #     @NLobjective(model, Min, e2)
#     #     # @NLobjective(model, Min, 
#     #     #     sum((x[i] - x[j])^2 + (y[i] - y[j])^2 - (r[i] + r[j]) ^ 2 for i = 1:n, j = (i+1):n) +
#     #     #     sum(x[i] ^ 2 + y[i] ^ 2 - (R - r[i]) ^ 2 for i in 1:n)
#     #     # )
#     #     optimize!(model)
#     # end
    
#     # begin
#     #     model = Model(Ipopt.Optimizer)
#     #     @variable(model, -avR <= x[i = 1:n] <= avR, start = (rand() - 0.5) * avR/2)
#     #     @variable(model, -avR <= y[i = 1:n] <= avR, start = (rand() - 0.5) * avR/2)
#     #     @variable(model, miR <= R <= maR, start = avR)
#     #     r = rand(runi, n)
#     #     # @NLconstraints(model, begin
#     #     #     [i = 1:n, j = (i+1):n], (x[i] - x[j])^2 + (y[i] - y[j])^2 >= (r[i] + r[j]) ^ 2
#     #     # end)
#     #     @NLconstraint(model, [i = 1:n, j = (i+1):n], ((x[i] - x[j])^2 + (y[i] - y[j])^2) >= (r[i] + r[j]) ^ 2)
#     #     e2 = @NLexpression(model, sum((x[i] ^ 2 + y[i] ^ 2) - (R - r[i]) ^ 2 for i in 1:n))
#     #     @NLobjective(model, Min, e2 + 4 * R^2)
#     #     # @NLobjective(model, Min, 
#     #     #     sum((x[i] - x[j])^2 + (y[i] - y[j])^2 - (r[i] + r[j]) ^ 2 for i = 1:n, j = (i+1):n) +
#     #     #     sum(x[i] ^ 2 + y[i] ^ 2 - (R - r[i]) ^ 2 for i in 1:n)
#     #     # )
#     #     optimize!(model)
#     # end
# end

# xv = Vector{Vector{Float64}}()
# yv = Vector{Vector{Float64}}()
# Rv = Vector{Float64}()
# function mcallback(cb_data)

#     global xv, yv, R
#     push!(xv, value.(alg_mod.x[1:n]))
#     push!(yv, value.(alg_mod.x[n+1:2n]))
#     push!(Rv, value(alg_mod.x[2n+1]))
#     return true
# end


# MOI.List

# begin
#     anim = Animation()
#     for (x, y, R) in zip(xv[1:50:end], yv[1:50:end], Rv[1:50:end])
#         p = pcircle(R, 0, 0, aspect_ratio=:equal, xaxis=false, yaxis=false, legend=false,)
#         for i in 1:n
#             pcircle!(r[i], x[i], y[i])
#         end
#         frame(anim)
#     end
#     for _ in 1:10 frame(anim) end
#     gif(anim, "$(path)/many_pizzas.gif", fps=5)
# end

