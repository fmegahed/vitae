# vitae
I have created this repo to provide an example of how RMarkdown can be used to create a (mostly) data-driven CV. At the moment, I know that there are two R packages:  
  - [vitae](https://github.com/mitchelloharawild/vitae) which has excellent examples, but I was not able to easily merge my old latex CV to their format and I had some errors in [compiling some of their examples on my windows machine](https://github.com/rstudio/rstudio/issues/11552). This is probably due to issues on my end (coding skills, windows setup, etc).   
  - [datadrivencv](http://nickstrayer.me/datadrivencv/)

  I have used examples from both of their vignettes to build the data for my CV. However, I have resorted here to a traditional `pdf_document` in rmarkdown instead of using their templates. My pdf document capitalizes on some latex code that I have defined in the `structure.txt` file. 


## Some (Possibly) Cool Features in My Vitae Code

  - I am capitalizing on RMarkdown's parametrized reporting so you can change multiple inputs to "quickly" generate a CV.  
  - I capitalize on the [scholar package](https://cran.r-project.org/web/packages/scholar/index.html) to extract all my publications from google scholar. Using the parameterized reporting, I have introduced symbols to denote undergraduate and graduate students in the print out.  
  - I have also capitalized on code from the [Vitae Repo Issues](https://issueantenna.com/repo/mitchelloharawild/vitae/issues/208) to `swap_initials()`, and modified the excellent `format_publications()` from the [scholar package](https://cran.r-project.org/web/packages/scholar/index.html) to read in a tibble instead of re-scraping the data from the Google API.  


## Main Weakness

- In this form, all inputs are required. The current form is a paramaterized rmarkdown and not a package. **I am not releasing this as a package but rather here is how I generated my partially data-driven CV**.   
    * Remedies: 
        + if you do not want to utilize one input, you will have to delete its code (or add `include=FALSE`) to the code chunk.  
        + A lot of the paramters may not need to change; e.g., if you have not published with undergrads, you do not need to change my input paramaters since those names will not be in your publication list. 