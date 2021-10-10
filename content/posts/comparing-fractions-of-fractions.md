---
title: "Comparing fractions of fractions on COVID case 😷"
date: 2021-08-26T21:38:08+02:00
katex: true
tags: ["math", "probability"]
---

I had a little argue recently with one anti-vaxxer and I thought it will make an interesting blog content.
I tried to convince them that vaccinating is good because people are at least not dieing and what I've heard was:

> Ohh, vaccines are not helping at all. A friend of mine is working at the hospital at says that **50%** of covid patients were already vaccinated.

I decided not to argue nor check the data source, but rather _give it a try_.
What is important, it took place in the UK where over **70%** of population received at least one dose of vaccine.

Let's say that we have a population of $1\ 000\ 000$, from which $700\ 000$ is vaccinated and $300\ 000$ is not.
Now suppose that out of this million, $1\ 000$ people ended up in hospital, $500$ vaccinated and $500$ not.
So the probability of ending up in hospital while being vaccinated is $p_v  = \frac{500}{700\ 000} = \frac{5}{7\ 000}$ and probability of ending up in the hospital while not being vaccinated is $p_{nv}= \frac{500}{300\ 000} = \frac{5}{3\ 000}$.
We can see that the second probability is $\frac{p_{nv}}{p_{v}} = \frac{7}{3} \approx 2.334$ over twice as big!

This clearly shows the positive effect of vaccines even though _half of people taken to the hospital has been vaccinated_.
To _proof_ vaccines being non-effective 70% of people taken to the hospital because of covid should be vaccinated.
This might be confusing at first, but makes since after you think for a while.

Calculating above probabilities and understanding the underlying phenomena is closely related to the Bayes' theorem.
Probably the best online resource to understand the topic is a beautiful video from [3blue1brown](https://www.youtube.com/channel/UCYO_jab_esuFRV4b17AJtAw):

{{< youtube HZGCoVF3YvM >}}
