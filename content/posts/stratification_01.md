---
title: "Smart Stratification #0: Why do we split datasets"
date: 2022-11-14T20:36:17+01:00
katex: true
tags: ["optimization", "julia", "smart-stratification"]
---

Quite often while working on data science/machine learning problems you have to divide dataset with stratification.
I decided to write this miniseries in which we will develop an advanced optimization-based algorithm for stratifying datasets.

But let's start from the very beginning -- why do we even split the data.

## Why do we split data

This paragraph might be obvious for some of you but fits here nicely.
If you develop an ML system, you want to train it on some data, and leave different data for testing purpose, to verify its performance.
The good analogy are the students and the teacher.
The teacher does some exercises with students during classes (the training set) and leaves (usually) different questions for an exam (the test set).

The idea is that the students learn how to _solve_ the problems, not _what is the answer_ to each question.
For example the teacher might show the following exercise during classes (the training set):

> If Alice has 3 apples and Bob has 3 apples, how much do they have together?

and after explaining _the math_, pray that students learn that the correct answer is $3+4=7$ and not just _plain number 7_.
Then the teacher can ask during the exam (the test set):

> If Alice has 5 apples and Bob has 9 appels, how much do they have together?

the correct answer is 5+9 = 14, and not _7_.

Similarly if you have the following dataset:

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

An example division of the dataset is:

Train:

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

Test:

|    | Name     | Sex   |   Age | Nationality   | FavoriteSeason   |
|---:|:---------|:------|------:|:--------------|:-----------------|
| 10 | Bart     | M     |    41 | BE            | Winter           |
| 11 | Fryderyk | M     |    59 | PL            | Summer           |
| 12 | Ann      | F     |    49 | UK            | Fall             |
| 13 | Eva      | F     |    50 | BE            | Winter           |
| 14 | Ola      | F     |    48 | PL            | Summer           |

Is this a good way of splitting the dataset?
Well, it is some way.

## Is it a correct split?

It is surprisingly challenging issue to divide data into reasonable splits in the applied DS/ML.
Coming back to the students/teachers example, when creating an exam, you want to make it diverse and challenging.
But at the same time if you have 20 questions from Units A, B, C you want them in both, the training and the test datasets.
You don't want to solve all problems from Unit A during classes and leave all problems from C for the exam (or at least you shouldn't...).

In our case we might want to assume the same ration of sexes in both datasets, or the same distribution of ages.
On the other hand, we may also want to train the model only on people from Poland and the UK and test on people from Belgium because we want to enter the new market, say France, and we want to check whether our model is country-independent.

It is often the case that given time-dependent data, e.g., stock prices or products sales, that you don't want to split data randomly.
In the end you don't want to predict the sales on 13th of November based on prices from 11, 12, 14 and 15th of November, but rather price on 15th and forward, based on 14th and earlier.

Sometimes you have a lot of data, with quasi-duplicates, e.g., multiple images from a single [camera trap](https://en.wikipedia.org/wiki/Camera_trap) separated by only fraction of a second, that were triggered by a single animal.
Then, to prevent so called data leakage (situation in which the same _information_ ends up in train and test), you may divide datasets based on camera trap itself.

As you see, we are finding more and more potential pitfalls.
Try to be aware of them the next time you will be dividing dataset into train and test.
