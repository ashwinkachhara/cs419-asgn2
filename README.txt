### cs419-asgn2

Machine Learning Assignment 2

Classification under Uncertainty
Dataset: Gene expression dataset http://www.ncbi.nlm.nih.gov/geo/ with accession number GSE 2187

Construction of Kernel that compares distributions (![REF](https://raw.github.com/ashwinkachhara/cs419-asgn2/master/jebara04a.pdf)




 
## Notes


Omitted Files: (only 2 replicates)
GSM43425#148
GSM43426#149
GSM43427#150
GSM43428#151
GSM43549#272
GSM43550#273
GSM43659#382
GSM43660#383
GSM43730#453
GSM43731#454
GSM43747#470
GSM43748#471
GSM43839#562
GSM43840#563

Problems faced:

missing values caused lots of NaN's
low values of variances cause singularity in the variance matrix => normalization?

Finally, took identity matrix as the covariance matrix in all the cases
, otherwise, the gram matrix was coming to be identically zero

65% Toxicant
90% Statin
78% Azole
76% Fibrate

K gives inf values for rho <0.5
K gives 0 values for rho >0.5

Taking log K?

