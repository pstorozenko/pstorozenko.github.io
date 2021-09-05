using Pkg
path = "static/posts/pizza-twice-as-big"
Pkg.activate("code/pizza-twice-as-big")
Pkg.instantiate()
using Plots

rectangle(w, h, x, y) = Shape(x .+ [0,w,w,0], y .+ [0,0,h,h])
function circle(r, x, y)
    t = 0:0.001:2π
    x .+ r .* sin.(t), y .+ r .* cos.(t)
end

prectangle(w,h,x,y; kwargs...) = plot(rectangle(w, h, x, y), opacity=.4; kwargs...)
prectangle!(w,h,x,y; kwargs...) = plot!(rectangle(w, h, x, y), opacity=.4; kwargs...)
pcircle(r, x, y; kwargs...) = plot(circle(r, x, y), seriestype=:shape, opacity=.4; kwargs...)
pcircle!(r, x, y; kwargs...) = plot!(circle(r, x, y), seriestype=:shape, opacity=.4; kwargs...)

begin  # Five squares
    sq_anim = Animation()
    prectangle(2, 2, -1, -1, xlim=(-2, 2), ylim=(-2, 2), aspect_ratio=:equal, xaxis=false, yaxis=false, legend=false)
    frame(sq_anim)
    prectangle!(1, 1, -1, -1)
    frame(sq_anim)
    prectangle!(1, 1, -1, 0)
    frame(sq_anim)
    prectangle!(1, 1, 0, -1)
    frame(sq_anim)
    prectangle!(1, 1, 0, 0)
    for _ in 1:5 frame(sq_anim) end
    gif(sq_anim, "$(path)/squares.gif", fps=1)
end

begin # Five cicles
    cl_anim = Animation()
    pcircle(2, 0, 0, xlim=(-2, 2), ylim=(-2, 2), aspect_ratio=:equal, xaxis=false, yaxis=false, legend=false)
    frame(cl_anim)
    pcircle!(1, 0, 1)
    frame(cl_anim)
    pcircle!(1, 1, 0)
    frame(cl_anim)
    pcircle!(1, 0, -1)
    frame(cl_anim)
    pcircle!(1, -1, 0)
    frame(cl_anim)
    plot!([-√2, √2], [-√2, √2], color=:black)
    plot!([-√2, √2], [√2, -√2], color=:black)
    frame(cl_anim)
    plot!([0.4, 1.05], [0.625, 1.45], arrow=:arrow, linewidth=2, color=:black)
    plot!([1.05, 0.4], [1.45, 0.625], arrow=:arrow, linewidth=2, color=:black)
    for _ in 1:10 frame(cl_anim) end
    gif(cl_anim, "$(path)/circles.gif", fps=1)
end

begin # Three squares
    sqh_anim = Animation()
    plot(Shape([(0, 0), (0, 1), (1, 1), (1, 0)]), xlim=(-0.5, 2), ylim=(-0.5, 2), aspect_ratio=:equal, xaxis=false, yaxis=false, legend=false, opacity=.4, color=:blue)
    frame(sqh_anim)
    plot!(Shape([(1, 0), (0, 1), (1, 2), (2, 1)]), opacity=.4, color=:red)
    for _ in 1:3 frame(sqh_anim) end
    plot(Shape([(1, 0), (0, 1), (1, 2), (2, 1)]), opacity=.4, color=:red, xlim=(-0.5, 2), ylim=(-0.5, 2), aspect_ratio=:equal, xaxis=false, yaxis=false, legend=false)
    plot!(Shape([(0, 1), (1, 1), (1, 0)]), opacity=.4, color=:blue)
    plot!(Shape([(0, 1), (1, 2), (1, 1)]), opacity=.4, color=:blue)
    for _ in 1:10 frame(sqh_anim) end
    gif(sqh_anim, "$(path)/half_square.gif", fps=1)
end

begin # Three circles
    cirh_anim = Animation()
    pcircle(2, 0, 0, xlim=(-2, 2), ylim=(-2, 2), aspect_ratio=:equal, xaxis=false, yaxis=false, legend=false)
    frame(cirh_anim)
    pcircle!(√2, 2-√2, 0)
    frame(cirh_anim)
    pcircle!(√2, -2+√2, 0)
    frame(cirh_anim)
    plot!([0, 0], [-2, 2], color=:black)
    plot!([-2, 2], [0, 0], color=:black)
    frame(cirh_anim)
    plot!([(0.3, 0.3), (0.5, 1.65)], color=:black, linewidth=2, arrow=:arrow)
    plot!([(0.5, 1.65), (0.3, 0.3)], color=:black, linewidth=2, arrow=:arrow)
    for _ in 1:10 frame(cirh_anim) end
    gif(cirh_anim, "$(path)/half_circles.gif", fps =1)
end

