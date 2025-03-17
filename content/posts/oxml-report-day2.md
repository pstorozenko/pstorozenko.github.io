---
title: "OxML Report Day2 📜"
date: 2023-07-22T23:00:00+01:00
tags: ["conference", "OxML", "Oxford", "machine-learning", "appsilon"]
---

The report of all talks during the second day of OxML Health 2023 where I've been on behalf of [Appsilon](https://appsilon.com/)..

This day talks were on:

1. The State of Computer Vision and Many CV Experiments - [Cristian Rupprecht](https://chrirupp.github.io/)
2. ML Challenges in Oncology and Multi-omics data - [Mireira Crispin](https://www.oncology.cam.ac.uk/research/our-research/crispin)
3. What is a Multimodality and How To Work With It? - [Louis-Philippe (LP) Morency](https://www.cs.cmu.edu/~morency/)

<!--more--> 

I understand it might be out-of-context for people not attending OxML.
If you're interested in something in particular, reach out to me on [LinkedIn](https://www.linkedin.com/in/piotr-pasza-storo%C5%BCenko/).


## The State of Computer Vision and Many CV Experiments - Christian Rupprecht

Christian Rupprecht, a Departmental Lecturer in Computer Vision at VGG in Oxford, shared an informative talk on the history and current state of computer vision, and shared numerous experimental observations.

1. He started with a concise overview of the history of computer vision. I didn't know that the Rosenblatt perceptron has been [implemented with physical hardware](https://en.wikipedia.org/wiki/Perceptron) of that size.
2. He showcased that the idea of image decomposition into components like reflectance, specularity, shape, and object motion dates back to 1978, highlighting that it's not a new concept.
3. An interesting anecdote shared was how the iconic slow-motion scenes in the Matrix movie were created using a [series of cameras capturing video sequentially](https://www.youtube.com/watch?v=bKEcElcTUMk).
4. Christian engaged in an in-depth discussion on training signals for unsupervised, semi-supervised, and weakly-supervised learning.
    - He explained that a signal is something one can optimize for, with one straightforward example being the reconstruction of the input.
    - He also detailed another approach that involves having two inputs that are opposite with respect to each other. The aim is to train the model to make representations similar for similar inputs and distinct for different ones.
    - He emphasized that one could work on both the latent representation and the reconstruction, applying losses at different stages.
5. The lecture provided a comprehensive insight into unsupervised learning, which when considered along with Ali's lecture from the previous day, offers a deeper understanding.
6. Christian emphasized a theme where a model is initially trained in an unsupervised manner, then fine-tuned for the specific task.
7. He presented a captivating approach involving ImageNet where they
    1. Identified similar images in an unsupervised manner.
    2. Labeled images according to the clustering from the first step and ran regular classification training.
    3. Repeated the clustering process.
    4. This strategy achieved over 60% Top5 Accuracy on ImageNet.
8. Like previous speakers, Christian reiterated that training GANs is a challenging and painful process and should be avoided if possible. He noted that diffusion models are a superior alternative in this regard.
9. Nevertheless, he acknowledged that experimenting with GANs can be fascinating.
    - In one experiment, they manipulated a large GAN to disentangle the elements responsible for the background and foreground of an image.
    - They also identified the direction responsible for the brightness of images.
    - Interestingly, this process allowed them to create a segmenter that effectively segments the foreground of an image without requiring any model training!
    - He concluded by observing that better GANs could lead to better segmentors by using this method.

## ML Challenges in Oncology and Multi-omics data - Mireira Crispin

Mireira Crispin, an Assistant Professor at the University of Cambridge and Chief Digital Officer at [52North](https://52north.health/), delivered an enlightening talk on the challenges faced in applying Machine Learning to Oncology and Multi-omics data.

1. Mireira provided an insightful introduction to medical issues such as cancer.
2. She outlined a critical issue faced during cancer treatment: when cancer cells are treated sub-optimally, many weaker cells are killed, reducing the size of the tumor. However, the stronger cells that survive multiply, worsening the situation.
3. In 2023, she highlighted that many hospitals, including those in Oxford, digitize all data before analysis.
4. Annotating cells for segmentation is a straightforward task, with 1-2k images usually being sufficient.
5. On the other hand, annotating tissues is a far more complex task that requires considerable expertise. Even then, it might not always be clear how to annotate an image.
6. An important challenge in handling medical data is how to merge different scales of images, such as combining CT scans and biopsies.
7. She noted the enormous potential in transfer learning, such as training a model on one type of tissue (for which there is an abundance of images and labels) and then fine-tuning it on rarer tissues.
8. A point of concern was that very few papers mention the iteration of multiple types of data (i.e., multimodality).
9. Typically, researchers share their code but not their data, making the reproduction of results challenging. Usually, only a fraction of the dataset is made public.
10. As different research labs use different datasets, there is hardly any overlap between publications, posing another challenge in the field.

## What is Multimodality and How To Work With It? - Louis-Philippe (LP) Morency

Louis-Philippe Morency, a tenure-track Faculty member at CMU Language Technology Institute, leads the Multimodal Communication and Machine Learning Laboratory ([MultiComp Lab](http://multicomp.cs.cmu.edu/)). He presented a riveting talk on the concept of multimodality and ways to work with it. You can watch [this recording](https://www.youtube.com/watch?v=VIq5r7mCAyw) for a comprehensive understanding of multimodality from LP.

1. LP began by defining multimodality. It refers to the idea that when we communicate, some information is embedded in our words, some in our tone, and some in our gestures.
2. He then discussed various ways modalities can intersect. In many cases, information between modalities (e.g., image and its corresponding description) overlap. For instance, if we have an image of a girl standing in front of a house with the caption "Alice in front of her friend's house," there's a significant overlap between the image and the text (the presence of a girl and a house). However, details like the girl's ethnicity, the house's color, and the weather are solely present in the image, while the girl's name and the owner of the house are solely present in the text.
3. Interestingly, in certain cases, combining two modalities can **introduce new information into the system**. This phenomenon, known as **emergence**, is considered the holy grail of multimodal learning.
4. LP went on to discuss different ways of merging embeddings from different modalities. The timing of the merging process has its own pros and cons. For instance, it's beneficial to extract as much information as possible from a single modality, but it's also important to ensure that different modalities can interact with each other. If modalities are merged very late, it's impossible to achieve emergence.
5. Apart from merging at different stages of neural networks, there are several ways to combine two embeddings. These include concatenation, addition, multiplication, and more complex operations such as gating. Some 'attention-like' operations can also be performed.
6. Another challenge in multimodal learning is ensuring that two embeddings accurately represent the same content.
7. At times, one modality might dominate the others. To address this issue, LP suggested the use of residual training, which involves first training a model with one modality, then with the second modality but only fitting to the _unexplained_ part by modality one, and finally with a combination of the two. While the proper way to do this is still an open question, the idea itself holds promise.
8. He also pointed out that methods like CLIP ignore unique information present in either the text or the image. It is trained to extract only the mutual information...
9. Lastly, LP emphasized that statistical methods will play a crucial role in medical applications in the future.
