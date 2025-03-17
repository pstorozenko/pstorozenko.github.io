---
title: "Cloud Run as Cold Storage for ML Models"
date: 2025-03-18T00:39:07+01:00
tags: ["machine-learning", "python", "appsilon"]
---

Where to store your models if you want to access them _rarely_?
Let's say you want to be able to access them in few months, but you don't want to pay for the running server all the time.

This may not be the regular issue, but we faced this challenge when working on some PoC that was supposed to be shown to clients every few months.
We didn't want to pay for the server all the time, didn't have to maintain it, but we wanted to have the model ready to be served in a few minutes.
**The way I solved this was by wrapping the ML model in a FastAPI app with BentoML and deploying it on Google Cloud Run as a docker container.**

This way we pay only for the time the model is being loaded and served.
The cold start takes under half a minute, and the model is ready to serve predictions.

It may not be the best solution if you use the model a lot, but wrapping _anything_ into docker container is great assurance that it will work in the future.
You sleep better knowing that it will work in the future.
