using Pkg
path = "static/posts/pizza-twice-as-big"
Pkg.activate("code/pizza-twice-as-big")
Pkg.instantiate()
using Plots
using JuMP
import Ipopt

model = Model(Ipopt.Optimizer)
set_optimizer_attribute(model, "print_level", 7)
@variable(model, -2.0 <= x <= 2.0, start = -2.0)
@NLobjective(model, Min, (x - 1.0) ^ 2)
optimize!(model)
value(x)
