---
title: "OxML Report Day 1 📜"
date: 2023-07-21T23:00:00+01:00
katex: true
tags: ["conference", "OxML", "Oxford", "machine-learning", "appsilon"]
---

The report of all talks during the first day of OxML Health 2023 where I've been on behalf of [Appsilon](https://appsilon.com/).

This day talks were on:

1. Casual Inference - [Cheng Zhang](https://www.microsoft.com/en-us/research/people/chezha/)
2. Computer Vision in medicine - [Jorge Cardoso](https://www.kcl.ac.uk/people/jorge-cardoso)
3. Knowledge Representation - [Ali Eslami](http://arkitus.com/)

<!--more--> 

I understand it might be out-of-context for people not attending OxML.
If you're interested in something in particular, reach out to me on [LinkedIn](https://www.linkedin.com/in/piotr-pasza-storo%C5%BCenko/).

## Causal Inference - Cheng Zhang

Cheng Zhang, a Principal Researcher at Microsoft Research, primarily focuses on Approximate Inference and Causal Machine Learning. Her presentation primarily revolved around integrating neural networks into classical Bayesian network inference schemas.

1. She suggested that if we calculate some embeddings (in encoder-decoder networks) within our model, we can analyze latent variables instead of analyzing the decoded image/signal/...
2. A significant part of her presentation was dedicated to Bayesian methods centered around the ELBO (evidence lower bound). Although I found this portion a bit challenging to follow, it appeared that the concept of reinforced gradients with the gradient trick is crucial here. The formula given was $\frac{d}{dx}\log(f(x)) = \frac{1}{f(x)} \frac{d}{dx}f(x)$.
3. Zhang noted that KL divergence is just one form of the broader $\alpha$ divergence.
4. She offered an insightful comparison between GANs and VAE:
   - VAE results are often blurry
   - GANs present unstable training
   - Before the advent of diffusion models, VAEs with numerous layers outperformed GANs
   - The introduction of diffusion models led to a significant improvement in results
   - Currently, diffusion models are at the forefront of this field
   - She briefly questioned the potential of normalized flows
   - The recent research interest is notably leaning towards GPT models
5. The latter part of her talk pivoted towards causality, discussing causality discovery and causality inference. 
6. Importantly, she highlighted that conducting A/B tests in medicine is not feasible.
7. Lastly, she mentioned their use of multi-to-multi modality models.

## Computer Vision in Medicine - Jorge Cardoso

Jorge Cardoso, a Reader in Artificial Medical Intelligence at King’s College London, shared his insights on the application of computer vision in the healthcare industry.

1. He emphasized that the role of machine learning (ML) in medicine is not about making diagnoses, but rather about facilitating personalized knowledge discovery. The aim is to provide doctors with guidance, not to take over their diagnostic tasks.
2. He discussed the challenge of tracking certain body-related parameters in medicine. For instance, factors such as alcohol consumption can cause daily fluctuations in brain size, making it difficult to overlay and compare scans from different days.
3. Cardoso asserted that with high-quality data, simple models like logistic regression can yield impressive results.
4. He spoke about the substantial challenge posed by the analysis of CT/MRI scans. Given that a single object often comprises a 256x256x256 scan—equivalent to over ~5.3 of 1k RGB images—only 1-3 such scans can fit on a standard 16GB GPU, indicating a considerable resource demand.
5. Many methods, he noted, rely on consulting experts about what they seek in patient scans/images.
6. He highlighted a significant potential for data compression, given that brain structures are generally similar.
7. Augmentation in the medical domain is a complex issue. While necessary due to data scarcity, many augmentation methods can degrade image quality. Issues such as scaling and contrast adjustments become critical when precise measurements and tissue differentiation are involved. Successful augmentation requires a process of trial and error and robust test sets.
8. Cardoso advised that to make a real impact, researchers must be willing to loosen data quality restrictions.
9. He pointed out that data acquisition methods can vary widely between hospitals and even between different devices within a single hospital, making data standardization crucial.
10. Prior assumptions can bias your models, which can be beneficial but should always be considered.
11. Cardoso noted that many doctors prioritize modeling uncertainty over explainability. He mentioned that while it's beneficial for models to understand their limitations, current ML algorithms struggle with predicting "nothing," an issue known as "blank image modeling". A potential solution involves creating an autoencoder/diffusion model to calculate encoding for the input image in latent space, and then comparing the latent distribution with that of training chest images.
12. He emphasized that the text data in hospitals often diverges significantly from regular language usage. Medical professionals tend to use specific language structures, make frequent typos, and use numerous abbreviations.
13. To create large models in hospitals, federated learning is required. During training, model weights are shared across hospitals, ensuring that data doesn't leave the hospital.
14. He stressed the advantage of using well-validated frameworks like [MONAI](https://monai.io/) when aiming to deploy a model in a hospital. Those frameworks are much easier to get validation for.
15. Lastly, Cardoso presented the latent diffusion model (LDM) of brain CT that his team developed. Utilizing 100,000 different scans (256x256x256) of healthy brains, training took four months on 32 Nvidia A100 GPUs. He outlined the variety of applications of this model, including identifying suspicious regions in a scan, impainting them, and presenting comparative views to the doctor. He noted the importance of maintaining the 3D structure of the latents, rather than flattening them, as many methods that work in 2D fail in 3D. In my opinion it might be dangerous as it suggests that other parts of the brain are healthy.

## Knowledge Representation - Ali Eslami

Ali Eslami, Director and Principal Scientist at Google DeepMind in London, delivered an engaging and immensely inspirational talk on various aspects of knowledge representation.

1. Ali started by relating the concept of inference to Plato’s allegory of the cave. Taking the example of a vase casting a shadow in a cave, he elaborated on how we might stop at recognizing the object from its silhouette, but also try to infer its color, weight, temperature, and even smell. Although such information is lost in the shadow, we can still attempt estimations using our prior knowledge.
2. He noted that in practice, knowledge representation often involves devising some sort of latent space, through techniques like:
    - Autoencoder
    - GANs
    - VAE
    - Diffusion
    - Sequential autoencoders
3. He pointed out that in many methods, the latent can be conditioned on various attributes like class, label, or style.
4. He discussed how disentangling different parts of the latent space can assign meaningful representations. For example, in a 100-length vector, the first 10 parameters could be used for camera position estimation, the next 20 for image scale, and the rest for image content.
5. Ali highlighted the distinct approach of NeRFs, where a network is trained to generate views from different angles for a single object, based on multiple images taken from different viewpoints.
6. He also examined the game-changing impact of AlphaFold and the challenges that remain to be addressed. The AlphaFold model predicts the 3D structure of a protein based on its amino acid sequence, which allows for the exploration of structural flexibility and rigidity. The next step is to model interactions between multiple proteins.
7. In discussing GANs, Ali drew a distinction based on their lack of reliance on likelihood methods and the absence of an encoder to the latent dimension in the basic setup. Despite describing the training of GANs as a nightmare, he emphasized that playing with a trained model is incredibly enjoyable.
8. An inspiring example he shared was the unsupervised training of doodling and painting via the SPIRAL model. The team trained an algorithm to draw a face using 20 Photoshop operations, which they then used to program a robot that could physically paint on paper.
9. Ali discussed how knowledge representation could be learned, such as by predicting image rotation or using contrastive learning. He gave an example of selecting two images, A and B, augmenting A twice, and then stating that A1 is similar to A2, but both are different from B. This approach requires careful data selection to avoid picking the same image or the same entity twice.
10. In his conclusion, Ali identified two key challenges that make artificial intelligence field hard:
    1. Categorization (Cheetah vs. Leopard vs. Jaguar)
        - Subjective (this could be a subspecies, not a new species)
        - Truth is subjective and exists only in our mind
        - Representational form is clear (we work on images of animals taken from the side)
    2. Partial observability (Different images of the same tiger)
        - Objective (it's either the same or different entity)
        - Truth exists in reality
        - Representational form is mostly unclear.