* Encoding: UTF-8.

DATASET ACTIVATE DataSet1.
RECODE sex ('female'=1) ('male'=0) INTO sex_female.
EXECUTE.

COMPUTE Predicted_value=3.79985056700938+(-0.0543998478057822 * age)+(-0.297544899026357 * 
    sex_female)+(0.00143699992493417 * STAI_trait)+(0.0368849893560822 * pain_cat)+(-0.262440901020854 
    * mindfulness)+(0.610010031068996 * cortisol_serum).
EXECUTE.


COMPUTE RSS=(pain - Predicted_value) * (pain - Predicted_value).
EXECUTE.

COMPUTE TSS=(pain - 5.2) * (pain - 5.2).
EXECUTE.

DESCRIPTIVES VARIABLES=RSS TSS
  /STATISTICS=MEAN SUM STDDEV MIN MAX.
