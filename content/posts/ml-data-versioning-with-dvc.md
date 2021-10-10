---
title: "ML Data Versioning With DVC: How to manage machine learning data 🗃"
date: 2021-10-13T07:23:26+02:00
tags: ["dvc", "machine-learning"]
---

Recently I wrote [a post about DVC at my company's, Appsilon blog](https://appsilon.com/ml-data-versioning-with-dvc/).
[DVC](https://dvc.org/) is like a git, but for data, models and experiments.
It also allows for creating an automated experiments pipelines.

As a teaser I'll just say that, having prepared scripts for model training and evaluating, when new data is added to the repo, the whole training is run automatically.
Metrics are saved to appropriate files alongside with parameters, same with plots.
However, if you just upload a new test data, a part of pipeline will be run only.
This is a pretty simple case, but DVC is a very powerful tool, check out [different use cases in their docs](https://dvc.org/doc/use-cases).
