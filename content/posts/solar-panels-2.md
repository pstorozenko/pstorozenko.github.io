---
title: "Detecting Solar Panels from satellite images part 2 -- machine learning in fastai 🤖"
date: 2021-11-29T16:18:26+01:00
tags: ["machine-learning", "python", "appsilon"]
---

[As mentioned a month ago](/posts/solar-panels-1), I write a series of posts on detecting solar panels from satellite images at my company, [Appsilon](https://appsilon.com).
In this post I focus on using `fastai` python library to deliver a working ML model in few hours!

<!--more-->

The series covers an example ML project journey in python:

1. Data collection and preparation in [`pandas`](https://pandas.pydata.org/docs/) and [`pillow`](https://pillow.readthedocs.io/en/stable/).
2. Creating a simple ML model for image segmentation using [`fastai`](https://docs.fast.ai/).
3. Model visualization and serving using [`streamlit`](https://streamlit.io/).

In general I'm not a fan of `fastai` for long-lasting projects as it is often weird, code is ugly and documentation is irritating to say the least.
On the other hand it really allows doing super quick [PoCs](https://en.wikipedia.org/wiki/Proof_of_concept).
I spend once a few hours on tinkering my resnet-based model written in pytorch-lightning that was able to achieve 0.94 F1 on some classification task only to get 0.96 F1 out-of-the-box with `fastai`.
[Their introductory course to ML in pytorch](https://course.fast.ai/) is a valuable resource for those who want to get a quick walkthrough on how to approach different ML problems.

[Check out my post if you want to see fastai in action!](https://appsilon.com/detecting-solar-panels-with-fastai-part-2/)
