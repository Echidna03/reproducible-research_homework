# Reproducible research: version control and R

Q1-3. https://github.com/Echidna03/logistic_growth/tree/main

Q4.

Observations from running random_walk.R: The start and finish locations of paths 1 and 2 are not set, but vary along with the route between them, in addition, the overall distance along each axis travelled varies significantly between the two paths, despite the fact that both walk paths take the same number of steps (500), for example on my initial run path1 moved between -2 and 2 (total distance 4) along the the x axis, whilst path2 moved between 8 and 0 (total distance 8). Furthermore, when the code is run a second time, two totally different walk paths are produced, these have no apparent relation to the previous two, with different start and end points.

'Random' number generation in R is not truly random, but instead pseudorandom- random numbers are generated based on a seed value which is fed into an algorithm which approximates randomness. This seed value is not necessarily random in and of itself, and may be based on a value like the time or an inbuilt hardware random number generator. The results from each seed are deterministic- a seed will always produce the same set of 'random' values. As such, in order to make 'random' results reproducible, we can specify an initial seed value to be fed into the algorithm.

<img width="1085" alt="Screen Shot 2023-12-07 at 12 05 00 PM" src="https://github.com/Echidna03/reproducible-research_homework/assets/114155443/3026cafd-3328-413d-9b4c-07ceef287621">

Q5.

The Cui_etal2014 table has 13 columns and 33 rows

A linear model can be fitted to the data by using a log transformation of both axes.

<img width="471" alt="Screen Shot 2023-12-07 at 1 24 55 PM" src="https://github.com/Echidna03/reproducible-research_homework/assets/114155443/dca70d6d-72c5-4705-838e-080f69e7538e">

The values I found for $\alpha$ and $\beta$ are as follows:

$\alpha$ = 1.1515 (the gradient)

$\beta$ = exp(7.0748) = 1181.807 (the exponent of the intercept)

The p values for $\alpha$ and $\beta$ were  8.784 6.44e-10 and 9.196 2.28e-10  respectively, both of these values are <0.5 and as such are statistically significant. The values for $\alpha$ and $\beta$ in the paper were 1.52 and 1182 and respectively, these values are very similar to the ones I found in my analysis.

This is the code required to reproduce the figure shown:

install.packages("ggplot2")
install.packages("janitor")

library(ggplot2)
library(janitor)

Cui_etal_clean<- clean_names(Cui_etal2014)

Cuilm <- lm(log(virion_volume_nm_nm_nm) ~ log(genome_length_kb), Cui_etal_clean)

ggplot(aes(x = log(genome_length_kb), y =log(virion_volume_nm_nm_nm)), data =Cui_etal_clean) +
  
  geom_point() +
  geom_smooth(method = lm) +
  theme_bw() + 
  xlab("Log[Genome Length(kb)]")+
  ylab("Log[Virion volume (nm3)]")

The estimated volume for a virus with ssDNA of 300kb is 

**$`V =  1181.807*300000^{1.515}`$**

**$`V = 2395806191 nm3`$**

## Instructions

The homework for this Computer skills practical is divided into 5 questions for a total of 100 points (plus an optional bonus question worth 10 extra points). First, fork this repo and make sure your fork is made **Public** for marking. Answers should be added to the # INSERT ANSWERS HERE # section above in the **README.md** file of your forked repository.

Questions 1, 2 and 3 should be answered in the **README.md** file of the `logistic_growth` repo that you forked during the practical. To answer those questions here, simply include a link to your logistic_growth repo.

**Submission**: Please submit a single **PDF** file with your candidate number (and no other identifying information), and a link to your fork of the `reproducible-research_homework` repo with the completed answers. All answers should be on the `main` branch.

## Assignment questions 

1) (**10 points**) Annotate the **README.md** file in your `logistic_growth` repo with more detailed information about the analysis. Add a section on the results and include the estimates for $N_0$, $r$ and $K$ (mention which *.csv file you used).
   
2) (**10 points**) Use your estimates of $N_0$ and $r$ to calculate the population size at $t$ = 4980 min, assuming that the population grows exponentially. How does it compare to the population size predicted under logistic growth? 

3) (**20 points**) Add an R script to your repository that makes a graph comparing the exponential and logistic growth curves (using the same parameter estimates you found). Upload this graph to your repo and include it in the **README.md** file so it can be viewed in the repo homepage.
   
4) (**30 points**) Sometimes we are interested in modelling a process that involves randomness. A good example is Brownian motion. We will explore how to simulate a random process in a way that it is reproducible:

   - A script for simulating a random_walk is provided in the `question-4-code` folder of this repo. Execute the code to produce the paths of two random walks. What do you observe? (10 points)
   - Investigate the term **random seeds**. What is a random seed and how does it work? (5 points)
   - Edit the script to make a reproducible simulation of Brownian motion. Commit the file and push it to your forked `reproducible-research_homework` repo. (10 points)
   - Go to your commit history and click on the latest commit. Show the edit you made to the code in the comparison view (add this image to the **README.md** of the fork). (5 points)

5) (**30 points**) In 2014, Cui, Schlub and Holmes published an article in the *Journal of Virology* (doi: https://doi.org/10.1128/jvi.00362-14) showing that the size of viral particles, more specifically their volume, could be predicted from their genome size (length). They found that this relationship can be modelled using an allometric equation of the form **$`V = \beta L^{\alpha}`$**, where $`V`$ is the virion volume in nm<sup>3</sup> and $`L`$ is the genome length in nucleotides.

   - Import the data for double-stranded DNA (dsDNA) viruses taken from the Supplementary Materials of the original paper into Posit Cloud (the csv file is in the `question-5-data` folder). How many rows and columns does the table have? (3 points)
   - What transformation can you use to fit a linear model to the data? Apply the transformation. (3 points)
   - Find the exponent ($\alpha$) and scaling factor ($\beta$) of the allometric law for dsDNA viruses and write the p-values from the model you obtained, are they statistically significant? Compare the values you found to those shown in **Table 2** of the paper, did you find the same values? (10 points)
   - Write the code to reproduce the figure shown below. (10 points)

  <p align="center">
     <img src="https://github.com/josegabrielnb/reproducible-research_homework/blob/main/question-5-data/allometric_scaling.png" width="600" height="500">
  </p>

  - What is the estimated volume of a 300 kb dsDNA virus? (4 points)

**Bonus** (**10 points**) Explain the difference between reproducibility and replicability in scientific research. How can git and GitHub be used to enhance the reproducibility and replicability of your work? what limitations do they have? (e.g. check the platform [protocols.io](https://www.protocols.io/)).
