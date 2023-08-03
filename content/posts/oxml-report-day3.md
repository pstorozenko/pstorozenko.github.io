---
title: "OxML Report Day3 📜"
date: 2023-07-23T23:00:00+01:00
katex: false
tags: ["conference", "OxML", "Oxford", "machine-learning", "appsilon"]
---

The report of all talks during the third day of OxML Health 2023 where I've been on behalf of [Appsilon](https://appsilon.com/)..

This day talks were on:

1. Introduction to Neural Networks - [Gitta Kutyniok](https://www.ai.math.uni-muenchen.de/members/professor/kutyniok/index.html)
2. Medical Expert's View on Impactful and Responsible ML in Health with EHR - [Kazem Rahimi](https://www.oxfordmartin.ox.ac.uk/people/kazem-rahimi/)
3. Chaotic Lecture on Graphs and ML - [Pietro Liò](https://www.cl.cam.ac.uk/~pl219/)

<!--more--> 

I understand it might be out-of-context for people not attending OxML.
If you're interested in something in particular, reach out to me on [LinkedIn](https://www.linkedin.com/in/piotr-pasza-storo%C5%BCenko/).

## Introduction to Neural Networks - Gitta Kutyniok

Gitta Kutyniok is a Professor at Ludwig-Maximilians-Universität München, where she focuses on the study of deep neural networks. Here are some of the key points she covered during her lecture:

1. Her presentation primarily focused on introducing the concept of deep neural networks.
2. She introduced an intriguing phenomenon known as [Double Descent](https://mlu-explain.github.io/double-descent/). The double descent curve refers to a graph illustrating the relationship between model complexity and generalization error. According to traditional wisdom (bias-variance tradeoff), as you increase model complexity past an optimal point, generalization error (error on unseen data) begins to increase. However, the double descent curve proposes that if you further increase model complexity, generalization error paradoxically decreases once again. This has been discovered in 2019.
3. An interesting remark by Professor Kutyniok was related to the limitations of medical imaging. For instance, in MRI scans, doctors sample certain points in Fourier space for measurements. However, mathematically, it's impossible to perfectly reproduce the original image of the patient's brain based solely on these points.
4. Finally, she advocated for the integration of physics into problem-solving to the greatest extent possible, using neural networks to model the remaining components. This underlines the significance of domain knowledge when developing and implementing complex machine learning models.

## Medical Expert's View on Impactful and Responsible ML in Health with EHR - Kazem Rahimi

Professor Kazem Rahimi, a Professor of Cardiovascular Medicine and Population Health at the University of Oxford and a consultant cardiologist at the Oxford University Hospitals NHS Trust, shared some fascinating insights on the intersection of machine learning (ML) and healthcare.

1. Kazem drew a compelling analogy between ML and the process of visiting a general practitioner (GP). He associated the steps of diagnosis, prognosis, and intervention with pattern recognition, forecasting, and causal prediction, respectively.
2. He highlighted the challenges associated with conducting good clinical trials in medicine, primarily due to the high costs involved. A proper randomized controlled trial (RCT) can cost upwards of $40k per person and between $40-50 million per study.
3. He pointed out that as far back as 1910, insurance companies were already examining the correlation between blood pressure and patient death rates to better adjust insurance prices.
4. Assessing the impact of a particular drug can be difficult due to potential interference from other medications. For example, if a patient is already taking 20 different drugs, isolating the effect of a new one becomes a complex task.
5. On a similar note, Kazem observed that frequent visits to a GP or hospital might indicate underlying health issues that haven't yet been diagnosed, a pattern that both ML and experienced healthcare professionals can identify.
6. Much of his lecture was dedicated to examining a recent case study in which paracetamol (acetaminophen) with sodium (the paracetamol solvable in water) was found to have twice the death hazard as paracetamol without sodium. Kazem broke down the study, debunking its conclusions by analyzing various factors. He pointed out biases and confounding factors, such as other health conditions, that could have skewed the results. If someone doesn't take paracetamol in pills, it usually may mean they can't swallow anything at all! Interestingly, this study was conducted using the [BHERT](https://github.com/deepmedicine/BEHRT) model which is BERT-like transformer trained on electronic health records (EHR).
7. To conclude, he emphasized that the absence of information can itself be informative. If there's no record of someone's hospital visits, it could either suggest they're healthy or that they can't afford medical care. This underscores the need to consider a broad range of factors in health-related ML applications to avoid misleading conclusions.


## Chaotic Lecture on Graphs and Multimodal Learning - Pietro Liò

Pietro Liò, a full professor at the Department of Computer Science and Technology at the University of Cambridge, with dual PhDs in Complex Systems and Genetics, provided a lecture on the application of graphs in machine learning. While entertaining and full of valuable references, the chaoticness of Pietro made the lecture somewhat ~challenging~ impossible to follow.

1. Many of the concepts he discussed were quite theoretical, leaning more towards academic research than practical applications. At least that was my impression.
2. Like many recent researchers, Pietro was excited about the potential of multimodal learning, an approach that combines different forms of data (modalities) in machine learning models.
3. He discussed the potential use of Graph Neural Networks (GNNs) for merging different modalities, hinting at a rich interplay between graph theory and multimodal learning.
4. His take on multimodalities was broad, suggesting that even different colors or frequencies from Raman spectroscopy could be considered distinct modalities. This perspective underscores the potential breadth of applications for multimodal learning.
5. Interestingly, Pietro seemed less interested in explainability, and more in model uncertainty. This suggests a focus on understanding the reliability of predictions, rather than the underlying decision-making process.
