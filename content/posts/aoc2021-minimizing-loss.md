---
title: "Minimizing The Sum of Absolute Values -- Day 7 Advent of Code part 1 🎄"
date: 2022-01-04T21:00:59+01:00
tags: ["math", "programing", "julia", "aoc2021"]
---

This year I took part in the [advent of code event](https://adventofcode.com/).
If you've never heard about it, I attach tl;dr bellow.
Today, I'd like to share my solution for [Day 7 problem](https://adventofcode.com/2021/day/7), because I find it [very interesting](https://c.tenor.com/cU06Rf0SxeEAAAAC/rhel1-captain-obvious.gif).

1. In the first half of the post I describe comparison in time complexity of two solutions (programming).
2. In the second half I outline the proof of one solution (math).

## What is the Advent of Code

For sure you had some kind of advent calendar in the past (or you still have), e.g. with little chocolates.
You are supposed to eat one chocolate per day while counting days to Christmas Eve.
AoC is an advent calendar for coders.
Every day, a new programming task is revealed.
You can compete to be high either in a global ranking (which is unreasonably difficult) or among your friends in a private ranking (that's feasible, depending on your friends).

## Day 7 problem

This year you have to help Santa get to the bottom of the Mariana Trench.
Cutting story short, [on the way down you encounter a line with crabs](https://adventofcode.com/2021/day/7).
Those crabs are distributed somewhere along the line on positions $x_i$.
Each crab can move left or right.
You have to align all crabs on a single position $m$.
Choose $m$ so the total energy crabs have to use is minimized and find the cost of aligning crabs at $m$.
The energy of moving a single crab from location $x$ to $y$ equals $|x - y|$.

So to summarize:

1. You are given a vector of crabs positions e.g. $x = [4, 1, 12, 2, 6, 7, 0, 6]$. Note that all positions are integers.
2. Moving a single crab costs $d_i = |x_i - m|$.
3. You have to find $m$ to minimize $\sum d_i = \sum |x_i - m|$ and return $\text{cost}(m)$.

### Naive approach to finding $m$

We can observe that the optimal $m$ must lie somewhere between $\min x$ and $\max x$, so we can just calculate $\text{cost}(m) = \sum_i^N |x_i - m|$ for every $m \in (\min x, \max x)$ and choose the minimal cost.

```julia
function solution(x)
    cost(m) = sum(abs.(x .- m))
    min_x, max_x = extrema(x)
    costs = cost.(min_x:max_x)
    return minimum(costs)
end
```

Note that in `julia` using a function followed by dot `.` vectorizes it.
Writing `min_x:max_x` creates a range, think of it as a sequence of numbers from `min_x` to `max_x`.
So even though `cost` function expects a single number `m` as an input, calling `cost.(min_x:max_x)` calculates `cost(m)` for every `m` in `min_x:max_x` and stores it in the vector.
One could also write `[cost(m) for m in min_x:max_x]` which would be less _juliatic_.

This function is nice, but works only because `x` values are integers.
Imagine what would happen if `minimum(x) == -9223372036854775808` and `maximum(x) == 4611686018427387904`...
It would take a looooong time to run this code, no mather how many elements would be in $x$.

To put it into some mathematical terms, we would say it has [a time complexity](https://en.wikipedia.org/wiki/Time_complexity) of $O(n \times r)$ where $r$ is the range of vector $x$ so $r = x_{max} - x_{min}$ in our case and $n$ is the length of $x$.
We make $O(n)$ operation by calling `cost(m)` function.
Every call requires subtracting $m$ from every element of $x$ ($n$ operations), calculating the absolute value of every element ($n$ operations), summing the vector of length $n$ -- $n$ operations.
We have to call `cost(m)` $r$ times, hence $O(n \times r)$.
If you've never seen a big O notation, [take a look on the Wikipedia](https://en.wikipedia.org/wiki/Big_O_notation).

In case of our example vector $x$ it means a time required to run the algorithm would be _proportional_ to $8$ (number of vector elements) times $12$ (range of $x$ i.e. $12 - 0$).
Proportional by no means means equal, but by doubling elements range, we would double the execution time.
Doubling the range and doubling the vector length would quadruple the execution time and so on.

### A mathematical observation on minimizing the sum of absolute values

From my statistics and machine learning classes I remember _a commonly known fact_ that the **median** minimizes the sum of absolute differences.

This mean that our solution can be rewritten as

```julia
function solution2(x)
    return sum(abs.(x .- median(x)))
end
```

which is much shorter...

But is it faster?
Well, it surely is.
To calculate the median we have to sort the vector $x$ and take the middle element (or the average of two middle elements).
Sorting can be done in time $O(n\log(n))$.
Then we have to call the previously defined `cost` function for a single value of $m$ with $O(n)$.
Since $n\log(n) > n$ for large $n$, we say that term $n\log(n)$ dominates and the complexity of `solution2(x)` is of $O(n\log(n))$ where $n$ is the length of vector $x$.
The difference is more visible for large ranges and lengths of $x$, pick a few example $n$ and $r$ values.

### Why the median minimizes the sum of absolute values

Unfortunately it's not that easy to show formally that median minimizes the sum of absolute values $C(m;x) = \sum_i |x_i-m|$.

We can try to outline the idea behind why median might minimize this cost!

To find the minimum of function, we can take a derivative and set it to $0$.
Derivative of $C(m;x)$ with respect to $m$ is $ C'(m;x) = \sum_i \text{sgn}(x_i-m)$ when $x_i-m \neq 0$, with:
$$
\text{sgn}(x_i-m) = \begin{cases}
 -1 & \text{if } x_i-m < 0, \\\\ 0 & \text{if } x_i-m = 0, \\\\ 1 & \text{if } x_i-m > 0.
\end{cases},
$$
Situation when $x_i -m = 0$ is what makes this problem hard so we will act as if it never occurs 😎.
Now let's think what must happen so sum of numbers $1$ and $-1$ equals $0$.
This arise when there is an equal number of ones and minus ones.
In our case it means that the same number of $x_i-m$ have to be equal to one and minus one.
So half of $x_i$ elements must be lower than $m$ and half must be greater, this is exactly what median is!

This is not a formal proof as there might be no numbers like that.
Think of vector $x = [1, 1, 2]$.
There is no $m$ that would satisfy our requirements.
Median still works though.
If you are interested, there are a few resources that may help you understand it better :

1. [A nice StackExchange discussion](https://math.stackexchange.com/questions/113270/the-median-minimizes-the-sum-of-absolute-deviations-the-ell-1-norm) that takes look at different cases.
2. [This video that uses calculus.](https://www.youtube.com/watch?v=Skwtx8b3gsA).

## Summary

There are two things I wanted share in this post:

1. Learning math is important and it can really help you when dealing with algorithmic problems.
2. Very often we can take advantage of some mathematical fact, without proving it from the scratch.
