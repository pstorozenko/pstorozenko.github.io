---
title: "Detecting Solar Panels from satellite images part 1 -- data preparation🛰️"
date: 2021-11-02T11:18:26+01:00
tags: ["machine-learning", "python", "appsilon"]
---

I'm writing a series of posts on detecting solar panels from satellite images at my company, [Appsilon](https://appsilon.com).
To be honest, not from satellite images but from [orthophotos](https://en.wikipedia.org/wiki/Orthophoto).
If you don't know what are orthophotos, the good news is that [the first post has been released recently!](https://appsilon.com/using-ai-to-detect-solar-panels-part-1/).

<!--more-->

The series covers an example ML project journey in python:

1. Data collection and preparation in [`pandas`](https://pandas.pydata.org/docs/) and [`pillow`](https://pillow.readthedocs.io/en/stable/).
2. Creating a simple ML model for image segmentation using [`fastai`](https://docs.fast.ai/).
3. Model visualization and serving using [`streamlit`](https://streamlit.io/).

If you are interested how to process (large, ~42GB) amounts of image data and how to prepare it for `fastai`, please feel free to read the post :).
It is written for different audience then my blog so keep it in mind ;).
Stay tuned for future posts!
