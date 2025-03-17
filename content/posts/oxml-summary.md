---
title: "OxML Health 2023 - Summary 🌍📚❤️‍🩹"
date: 2023-07-20T23:00:00+01:00
tags: ["conference", "OxML", "Oxford", "machine-learning", "appsilon"]
---

Long time no see ^^
Today, I'd like to share my experience from [OxML Health Summer School](https://www.oxfordml.school/) that I attended in person this year on behalf of [Appsilon](https://appsilon.com/).

<!--more--> 

## Intro

The event was a great experience, I'm glad that I was able to go there.
It was (VERY) expensive in my opinion (£1100 entry fee + other costs for 4 days). I'm very thankful to [Appsilon](https://appsilon.com/) that they sponsored my trip 🙏.
Apart from this fact, it was great to meet so many Ph.D. students and young professionals working in ML and exchange experiences, problems, and so on.

In this post, I describe:
1. General insights from presenters' talks
2. What do attendees to OxML do for a living

In the next posts, I'll provide a detailed report on each day's talks under the [#OxML]({{< relref "/tags/OxML" >}}) tag.


## General insights from presenters' talks

0. The main message I'll remember is **how crucial it is to focus on the most vulnerable people**. It's much more important and impactful to help thousands of poor people than just a few rich people. Everyone should think about it when planning their efforts.
1. Researchers don't like to train GANs. Despite all the efforts, they're very tricky to train. However, it's nice to play with an already-trained GAN.
2. Explainability is not that much important to medical experts.
    1. Often it's more important for them to know the uncertainty than the explainability.
    2. ML models are often just a suggestion that something should be explored in more detail, kind of biomarkers.
3. There's a huge hype around multimodality nowadays.
    1. Multimodality - creating an ML system that works on, e.g., text and images at the same time.
    2. It may also mean working on different kinds of images, e.g. MRI and CT scans of the brain.
    3. Or even combining CTs of different parts of the body.
4. A lot of problems revolve around VAE/diffusion networks.
    1. Generation of _fake_ signals for other methods.
    2. Bringing different modalities together.
5. A/B tests are usually not possible in medicine.
6. The holy grail (one of very many it seems 🙈) is personalized recommendations per patient with all the restrictions regarding data privacy taken into account.
7. We're far from getting a diagnosis from ML. Most research focuses on providing knowledge discovery and assisting doctors. 

## What do attendees to OxML do for a living

I was curious about what other people do.
Here is the list of problems people tackle at work/during Ph.D. studies.

1. 3D reconstruction of colony imagery - NERF-like problem
2. Predicting the outcomes of surgery before it happens - maybe the patient is in a high-risk group and we don't know it
3. Estimating transition matrices for diseases per patient in the hospital - maybe some patients have to be isolated from other individuals in particular
4. Gene expression data generation
5. Brain EEG signals for modifying StyleGAN latent space - we can change people's skin color _with our thoughts_ 
6. Predicting the trajectory of patients - given the history, what will be the diseases the patient will have? Trajectory in the space of diseases and parameters like blood pressure
7. Multiple folks from Johnson&Johnson
8. Skin cancer prediction from photos
9. Bones fracture predictions based on XRays of the spine and CTs of hands and legs - study targeted to elderly people (70+), mostly with osteoporosis
10. New visualization methods for biological data
11. Analysis of genomic data of cancer cells to measure the speed of cells duplication and treat diseases early
12. Per crop plant (like on a field) prediction of diseases - farmers know which plants to remove/spray/treat/kill with lasers
13. Prediction of possible gestational diabetes (diabetes that strikes pregnant woman) based on health parameters.

## Outro

I tried to make this post/list to be appealing to _everyone_.
If you have a different point of view, please reach out to me on [LinkedIn](https://www.linkedin.com/in/piotr-pasza-storo%C5%BCenko/) ^^

This post will be followed by 4 posts, for each day, that will describe in more detail what I found interesting during which talk.
