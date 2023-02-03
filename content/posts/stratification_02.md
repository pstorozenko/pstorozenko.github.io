---
title: "Smart Stratification #1: What is Stratification"
date: 2022-11-14T20:36:17+01:00
katex: true
tags: ["optimization", "julia"]
---

This post is part of the series on smart stratification.
Be sure to checkout the whole series.

In this post, we take a closer look on stratification and then what I call **smart stratification**.
Stratification is one of ways to **split your dataset**.
It assures that the ratio of factors from different levels is the same in the train and the test.

## Example of stratification

To understand it better let's take a look on our dataset:

|    | Name     | Sex   |   Age | Nationality   | FavoriteSeason   |
|---:|:---------|:------|------:|:--------------|:-----------------|
|  0 | Alice    | F     |    23 | UK            | Fall             |
|  1 | Bob      | M     |    50 | UK            | Winter           |
|  2 | Cecily   | F     |    46 | BE            | Spring           |
|  3 | Dan      | M     |    37 | BE            | Fall             |
|  4 | Eve      | F     |    37 | UK            | Summer           |
|  5 | Felix    | M     |    54 | PL            | Winter           |
|  6 | George   | M     |    23 | BE            | Summer           |
|  7 | Jan      | M     |    47 | PL            | Spring           |
|  8 | Małgosia | F     |    28 | PL            | Fall             |
|  9 | John     | M     |    23 | UK            | Fall             |
| 10 | Bart     | M     |    41 | BE            | Winter           |
| 11 | Fryderyk | M     |    59 | PL            | Summer           |
| 12 | Ann      | F     |    49 | UK            | Fall             |
| 13 | Eva      | F     |    50 | BE            | Winter           |
| 14 | Ola      | F     |    48 | PL            | Summer           |

We might want to have the same ratio of Poles, British and Belgians in train and test so we might split it in the following way:

Train:

|    | Name     | Sex   |   Age | Nationality   | FavoriteSeason   |
|---:|:---------|:------|------:|:--------------|:-----------------|
|  1 | Bob      | M     |    50 | UK            | Winter           |
|  5 | Felix    | M     |    54 | PL            | Winter           |
|  6 | George   | M     |    23 | BE            | Summer           |
|  7 | Jan      | M     |    47 | PL            | Spring           |
|  9 | John     | M     |    23 | UK            | Fall             |
| 10 | Bart     | M     |    41 | BE            | Winter           |
| 11 | Fryderyk | M     |    59 | PL            | Summer           |
| 12 | Ann      | F     |    49 | UK            | Fall             |
| 13 | Eva      | F     |    50 | BE            | Winter           |

Test:

|    | Name     | Sex   |   Age | Nationality   | FavoriteSeason   |
|---:|:---------|:------|------:|:--------------|:-----------------|
|  0 | Alice    | F     |    23 | UK            | Fall             |
|  4 | Eve      | F     |    37 | UK            | Summer           |
|  2 | Cecily   | F     |    46 | BE            | Spring           |
|  3 | Dan      | M     |    37 | BE            | Fall             |
|  8 | Małgosia | F     |    28 | PL            | Fall             |
| 14 | Ola      | F     |    48 | PL            | Summer           |

This division works well if we just want to have the same ratio of nations in train in test.
Note that there are much more males in the train set and females in the test set.
This may (or may not) be a problem as our model will be mostly tested on females.
Note that also because the majority of females ended up in the test set, there are only two in the training data on which model can learn, so it's hitting as twice!

## Benefits of simple stratification

It's simple and usually does the job.
To do this operation in python/julia/R we could calculate sizes of groups UK, BE, PL (all of them are of size 5) and then take say 60% of observations to one dataset and 40% to the other.
This approach is also easily extensible for stratification based few columns.
For example if we want to stratify also based on the sex, we can create baskets like `(F, UK)`, `(M, UK)`, `(F, BE)`, `(M, BE)`, `(F, PL)`, `(M, PL)`.
As you can see, even for just two columns we already have 6 different combinations.
If we wanted to take the `FavoriteSeason` into account, it would be 24!
With only 15 different rows, we see that such granularity doesn't make sense.
We're not able to find a single representative for many combinations, not mentioning splitting 60/40 into train and test.

In the majority of cases, stratification based on one column or set of columns do the job.

## Drawbacks of simple stratification

We might want to stratify not only on pairs of columns but on multiple columns separately.
For example we might want to have roughly the same number of people from both sexes, different nationalities and with favorite seasons across train and test.
This is surprisingly hard task since putting someone that is Male to one _box_ will simultaneously add someone who is for example Polish and their favorite season is Winter.

The solution to this problem I call **smart stratification** and that's the core idea behind this series of blogposts!

## Appendix - Simple stratification in pandas/polars/dataframes.jl

In the notebook I provide some simple implementations of simple stratification in pandas/polars/julia with benchmarks for those that are interested.
Of course these are not the only, and maybe even not the best ways to do so. :)
Since I implemented stratification using different principles each time, I'll comment code here.

### Stratification in pandas

This implementation leverages the index system of `pandas`.

```python
train_idx = (
    df
    .groupby("Nationality", group_keys=False)
    .apply(lambda d: d.sample(int(train_frac * d.shape[0]), random_state=42))
    .index
)
df["Split"] = "Val"
df.loc[train_idx, "Split"] = "Train"
```

This is (probably) the easiest way to do it in pandas, but I don't like the fact that we operate on the whole data frame and then just the index.
This could be optimized by taking only some column with `loc[]`, but it's still rather ugly.
However it works and it's simple!

### Stratification in polars

You may wonder what is `polars`.
This is _blazingly fast_ library for dataframes processing.
It takes some time to get familiar with it, but I tell you it's worth.
In the end, I feel like polars is more natural, and much cleaner than pandas.
If you want to see some examples of pandas <-> polars comparison, checkout lecture X from my course on datascience!
We doa bunch of comparisons between pandas and polars.

```python
df.with_column(
    pl.when(
        (pl.arange(0, pl.count()) < train_frac * pl.count())
        .shuffle(seed=42)
    )
    .then("Train")
    .otherwise("Val")
    .over("Nationality")
    .alias("Split")
)
```

This code requires more comment I think.
First we take `pl.arange(0, pl.count())` vector from $0$ to $n-1$ compare it to the required threshold of training samples `train_frac * pl.count()`.
This creates vector of `True`s and `False`s with `train_frac * pl.count()` `True` and then rest is `False`.
Because we want to take random rows, independently of their original order we have to shuffle the `True`, `False` vector with `.shuffle()`.
With this vector of `True`s and `False`s we use polars if-else construction of `pl.when(cond).then(...).otherwise(...)`.
**Now the windowing magic happens!!!**
With `.over("Nationality")` we do all the previous operations **separately for each level of `Nationality`**.
It's a bit like reversed groupby.
The `pl.count()` is calculated per `Nationality` _group_.
Not that with this approach we were working in a clean fashion, only on one vector and then glued it into the dataframe!

### Stratification in julia

Here I'm sure that pore profficient `Dataframes.jl` developer would be able to come up with smarter solution but I propose the following:

```julia
function split(x)
    n_row = length(x) 
    n_train = trunc(Int, n_row * train_frac)
    n_val = n_row - n_train
    split_v = vcat(repeat(["Train"], n_train), repeat(["Val"], n_val))
    return shuffle(split_v)
end
transform(groupby(df, "Nationality"), :Age => split => :Split)
```

It's pretty similar to the one from `polars` except we are using _dummy_ column `:Age` just to have _some_ column.

### Stratification in R, data.table

On one hand I don't like R in general, but on the other `data.table` is my favorite data wrangling package.
In a second you will see why:

```r
dt[, Split := ifelse(sample((1:.N) <= .N*train_frac), "Train", "Val"), Nationality]
```

We are doing something very similar to polars while keeping the code as simple and short as possible.
Lonely `,` in the beginning means that we take all rows.
Then for every group we will take vector from `1` to `.N`, shuffle it (with `sample(...)`), fill with `"Train"` and `"Val"`.
Finally we do it for every group in `Nationality` column.

## Summary

I hope that you liked that introduction to stratification, you know how it's working and that you should use it in your next ML project!
I also hope that you're interested in how **smart stratification** might be implemented, stay tuned for the next posts.
