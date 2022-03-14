---
title: "Playing With Style Transfer 🎨"
date: 2022-02-05T21:12:18+01:00
katex: true
tags: ["python", "machine-learning", "conference", "SFI 2022"]
---

[As mentioned earlier](/posts/sfi-conference), I will be giving a talk on [the 17th SFI IT Academic Festival](https://sfi.pl/en/) on the topic of style transfer and StyleGAN.
In this post I would like to show how easy it is to play with style transfer on your own!

## To tutorial or not to tutorial

It might be obvious for you to check Tensorflow/PyTorch tutorials if you wanted to learn how to create style-transfer system.
But what if you do not want to learn anything?
Maybe all you want is just to do the style transfer on your photos?
Tutorials with colab notebooks are the place where you can find all you need!

## What are the colab notebooks?

Some long time ago Google launched the service [Google Colab](https://colab.research.google.com/).
This is an online place where you can run your jupyter notebooks on machine with attached GPU for free!
Of course there is a limit on GPU time you can use, but it is usually enough to train some simple networks or fine-tune the pre-trained model.
If you are not familiar with colab yet, definitely try it out.
It might come handy, e.g., for student's project or recruitment assignment if you do not have GPU at home.

## Simple neural style transfer

We will go through the beginning of the [Neural style transfer](https://www.tensorflow.org/tutorials/generative/style_transfer) tutorial.
Press the big **Run in Google Colab** button on top and wait till the environment loads.

[![](/posts/playing-with-style-transfer/run_in_colab.png)](https://colab.research.google.com/github/tensorflow/docs/blob/master/site/en/tutorials/generative/style_transfer.ipynb)

You can work in colab almost the same you would work with jupyter notebooks!
The whole tutorial is just one massive jupyter notebook.
Scroll down to some code and hit <kbd>Shift</kbd> + <kbd>Enter</kbd> to run the first code cell!

![](/posts/playing-with-style-transfer/first_cell.png)

If you do the same with some further cells you will quickly obtain the following abstract dog.

![](/posts/playing-with-style-transfer/dog.png)

Just look how quick, painless and easy it was!
No need for environment setting or doing any other difficult stuff!

### Adjusting for images from the web

Since this is just a jupyter notebook you run, it is easy to adjust it to your needs.
Just edit lines:

```python
content_path = tf.keras.utils.get_file('YellowLabradorLooking_new.jpg', 'https://storage.googleapis.com/download.tensorflow.org/example_images/YellowLabradorLooking_new.jpg')
style_path = tf.keras.utils.get_file('kandinsky5.jpg','https://storage.googleapis.com/download.tensorflow.org/example_images/Vassily_Kandinsky%2C_1913_-_Composition_7.jpg')
```

With changing for example the yellow labrador dog url into the Warsaw University of Technology main building url and re-run a few cells.
```python
content_path = tf.keras.utils.get_file('1280px-Gmach_G%C5%82%C3%B3wny_Politechniki_Warszawskiej_2018.jpg', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4d/Gmach_G%C5%82%C3%B3wny_Politechniki_Warszawskiej_2018.jpg/1280px-Gmach_G%C5%82%C3%B3wny_Politechniki_Warszawskiej_2018.jpg')
```

![Abstract WUT Main Building](/posts/playing-with-style-transfer/ggpw_abstro.png)

### Adjusting for images from you local disk

If you want to upload an image from disk to process you can do it as well!
Just click here and there:

![](/posts/playing-with-style-transfer/upload.png)

and adjust a cell from

```python
content_image = load_img(content_path)
style_image = load_img(style_path)
```

to

```python
content_image = load_img("the-eiffel-tower.jpg")
style_image = load_img("a-summer-evening-in-the-city.jpg")
```

and re run everything.

![Eiffel Tower in Van Gogh Style](/posts/playing-with-style-transfer/eiffel.png)

A summer evening ~~in the city~~ with the Eiffel Tower.

## Summary

I hope this post made it clear how to do your own experiments with style transfer.
If you are curious how it works, what are the details of methods used, just follow the notebook till the end!
