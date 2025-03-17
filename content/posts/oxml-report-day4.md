---
title: "OxML Report Day4 📜"
date: 2023-07-24T23:00:00+01:00
tags: ["conference", "OxML", "Oxford", "machine-learning", "appsilon"]
---

The report of all talks during the fourth day of OxML Health 2023 where I've been on behalf of [Appsilon](https://appsilon.com/)..

This day talks were on:

1. Insightful Lecture on ML for Mental Health - [Munmun De Chodhury](http://www.munmund.net/)
2. Drug Discovery with ML - [Ravi Patel](https://www.linkedin.com/in/ravi-patel-841a52138/)
3. How to make sure the Market wants your solution - [Reza Khorshidi](https://www.swissre.com/profile/Reza_Khorshidi/ep_cd4b47)

<!--more--> 

I understand it might be out-of-context for people not attending OxML.
If you're interested in something in particular, reach out to me on [LinkedIn](https://www.linkedin.com/in/piotr-pasza-storo%C5%BCenko/).

## Mental Health and Machine Learning - Munmun De Chodhury

Munmun De Chodhury, an Associate Professor in the School of Interactive Computing at Georgia Tech, delivered an engaging lecture on the intersection of machine learning and mental health. Although the talk was less technical in nature, it was filled with insightful information and proved to be quite inspiring.

1. She began with an interesting fact about sleep and cardiovascular diseases, highlighting that beyond 6-7 hours of sleep per day, focusing on exercise and stress reduction might be more beneficial to cardiovascular health.
2. De Chodhury emphasized the importance of **prioritizing vulnerable populations when developing digital mental health solutions**. She argued that it's crucial to help those struggling financially first, as higher earners are generally better equipped to find help.
3. In a thought-provoking retrospective, she noted how, in 2013, it was believed that 'big data' would provide answers to all our questions. Now, the term is hardly used.
4. Through her research studying Instagram and Twitter data, she found that 15-20% of new mothers exhibited signs of depression. These women became more isolated, posted more negatively, and showed a general decline in well-being.
5. Interestingly, De Chodhury found that patterns of seasonal depression were similar across the US, regardless of the local climate. The consistency of these patterns suggests that factors other than weather contribute to seasonal depression.
6. De Chodhury emphasized the importance of identifying and treating mental illnesses between the ages of 14 and 19. She argued that treatment becomes significantly more challenging later in life.
7. The discussion on data accuracy was intriguing. While some argue that social media posts may not always reflect reality and that we should rely on medical data, others point out that people may be more honest on social media than in the doctor's office for a variety of reasons (e.g., fear of judgment or embarrassment). She stressed the need for preventive measures and early intervention, especially among the most vulnerable.

## Drug Discovery with ML - Ravi Patel

Ravi Patel, an Advanced AI Scientist at [BenevolentAI](https://www.linkedin.com/company/benevolentai/), delivered a talk on the role of machine learning in drug discovery. While specifics on the approach and technologies used were kept confidential, he discussed the general pipeline, challenges, and strategies used in their work.

1. Patel outlined the typically long and expensive process of drug discovery, citing research that indicated an average of \$2.6 bln and 10 years are needed for a single drug study. He also noted the high failure rate of drug studies, with 90% failing and 30-50% of patients responding poorly to approved drugs.
2. BenevolentAI's drug discovery pipeline aims to combine patient data, such as multiomics, with unstructured literature and an internal knowledge graph. This is intended to facilitate a comprehensive understanding of the drug discovery process.
3. To better understand the needs of drug discovery experts, BenevolentAI sought to comprehend their strengths and weaknesses. They identified the main limitations as the speed of reviewing materials and the sheer quantity of materials one can go through.
4. Patel proposed two methods for making the system explainable:
    1. They calculate the embedding of a query and compare it against the embeddings of all sentences in the database. This provides a form of indirect explainability.
    2. They first extract relevant fragments, then generate a response based on them. Using SHAP values, they attempt to explain why each part of the response was generated. Patel claimed this enhanced explainability, but I doubt it.
5. In the Q&A section, Patel shared that they mostly work on prompt engineering rather than training large language models (LLMs). He did not disclose specifics about the models they use. However, they train a lot of knowledge representation models.
6. To limit the models' hallucinations, they employ an orchestrator with translators. This helps to keep the models' responses grounded in the data and prevent unwarranted extrapolations.

## How to make sure the Market wants your solution - Reza Khorshidi

Reza Khorshidi, the Chief Scientist for Investments at AIG and a principal investigator in the Deep Medicine program at The University of Oxford, provided valuable insights on the intersection of machine learning, business, and investments.

1. Khorshidi started by discussing the difference between `model.fit()` and `market.fit()`. He stressed that creating a technically excellent solution isn't enough; there needs to be a market for the solution or the ability to create a market for it. This business-oriented view is often overlooked by those in academic settings.
2. He noted the shift in perspective brought about by the rise of cheap and efficient hardware capable of performing ML predictions. Drawing an analogy with photography's shift from a chemistry problem to a computing problem, he highlighted how the ubiquity and low cost of technology have transformed the way we perceive challenges.
3. Khorshidi pointed out the pitfalls of random sampling in patient studies, sharing an example where it would be more insightful to stratify patients by their villages as patients tend to exchange information and even medication within communities.
4. He examined the transformative potential of AI in reshaping markets, citing
    1. The impact of autonomous cars on ride-hailing services like Uber. Now the problem is about matching cars with customers, not drivers and customers.
    2. [Anticipatory shipping](https://www.forbes.com/sites/onmarketing/2014/01/28/why-amazons-anticipatory-shipping-is-pure-genius/) on e-commerce platforms like Amazon. 
    3. On a similar note, because of LLM solutions like ChatGPT and Copilot, [StackOverflow already experienced a 54% drop](https://observablehq.com/@ayhanfuat/the-fall-of-stack-overflow) in usage 😱. On the other hand, SO already works on the [OverflowAI](https://stackoverflow.blog/2023/07/27/announcing-overflowai/).
5. A recurring theme in Khorshidi's talk was the importance of [user adoption](https://appsilon.com/reasons-why-shiny-user-adoption-fails/). He suggested focusing not only on creating a solution but also on how it will be accepted and used.
6. Discussing `market.fit()`, Khorshidi proposed balancing three aspects: feasibility (can we do it?), desirability (will they buy it?), and viability (should we do it?).
7. Khorshidi engaged in a detailed discussion on the topic of explainability. He questioned the practical value of detailed model explanations, such as those produced by GPT models, and pointed out that our understanding of "explainable" models like linear regression is simplistic as it assumes the independence of features. In reality, changes in one feature, like blood pressure, often correspond with changes in other features. Therefore, the perceived explainability might be more illusory than we think.