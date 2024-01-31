# structuralchange
RStudio package to generate structural change indicators: Herfindahl-Hirschman Index (HHI), Theil Index, Gini Index and Economic Complexity Index (ICE).

## Content
At the moment, you can download the R Script with the function to calculate the Revealed Comparative Advantage (RCA) matrix: [rca.R](/rca.R).[^1] This function allows calculate the RCA from any object of class *data.frame* or *tibble* that contains three columns.[^2] The output of this function will be used to estimate the ICE.

[^1]: Note: to construct this function we rely mainly on two sources: **1)** Mealy, P., Farmer, J. D. & Teytelboym, A. (2019). Interpreting economic complexity. *Science Advances*. 5(1). https://doi.org/10.1126/sciadv.aau1705; **2)** the *balassa_index* function from the package [economiccomplexity](https://github.com/pachadotdev/economiccomplexity/tree/master)
[^2]: The first column must present the **names or codes of the localities** to be studied; the second column, information on the **flow codes** to be studied (e.g., SIC for employment or HS for exports); the third column, **flow quantity** information for all locality-flow pairs.
