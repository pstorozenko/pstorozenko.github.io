---
title: "Quarto, The New Rmarkdown 📃📜"
date: 2022-07-28T23:08:22+02:00
tags: ["r", "python", "quarto"]
---

Do you remember good old `rmarkdown`?

```md
---
title: "R markdown"
output: html_document
---

Hello ~world~ problems!
```

We have a great successor in the form of [`quarto`](https://quarto.org/) that is ready for 2022 and beyond!

<!--more-->

![ninja turtles meme](rmarkdown-turtles.png)

## Good old times and what is rmarkdown

Rmarkdown format allows you mixing your code with markdown text in a git-friendly way.
Usually it is used to create report-ish, latex-like documents.
After preparing the report, depending on your use case, you can:

* Automatically re-generate it on regular basis
* Export to pdf/html

You can also create the `beamer` presentation (latex-like) from `rmarkdown` file!
During my studies, I quickly fall in love with `rmarkdown` and started using its features for almost every lab report/presentation (❤️ [Metropolis beamer theme](https://github.com/matze/mtheme)).
The alternatives where just not there.

* Latex was very powerful, but required tons of boiler plate code
* You could run `python` in `rmarkdown` but it had its own problems (at least ~5 years ago).
* Working in jupyter notebooks with R was often painful...
* ... even with python it was sometimes _coarse_, especially when you wanted to export the results to html/pdf.

## Changing times

However, some time have passed and world changed!

1. VS Code has [a superb support for jupyter notebooks](https://code.visualstudio.com/docs/datascience/jupyter-notebooks), they're highly responsive, it's easy to change kernels without installing them. What is important it allows you to [compare notebooks using git](https://code.visualstudio.com/docs/datascience/jupyter-notebooks#_custom-notebook-diffing)!
2. I stopped using `R` regularly.
3. Using `rmarkdown` without `R` was wired. I had to open the whole `RStudio`, just to generate some pdf...
4. This meant I stopped using `rmarkdown` entirely.

## Future

This summer the `rmarkdown` successor `quarto` has been released!
It has all the features I loved in `rmarkdown` and fixes multiple problems like a perfect support of multiple languages and being language agnostic by design.
Additionally it is nicely supported in VS Code as well.

If you ever used `rmarkdown` go and checkout `quarto`!
Most of the time it will work as a drop-in replacement that is just better.

Stay tuned for my future posts about `quarto`!
