*IMPORTANT NOTE ABOUT MANAGING THE WORKING DIRECTORY
/*
***********************************************
Whenever this script is executed, the SWBExercise/ folder should be designated as Stata's working directory.

Before beginning work with this script, the user must check to see whether the SWBExercise/ folder is designated as Stata's working directory.  

If not, the user must interactively change the working directory to the SWBExercise/ folder.
************************************************
*/

*Clear memory
clear

*Settings
set more off


/*********
WE WILL FIRST MODIFY THE PEW DATA TO CREATE AN
INDIVIDUAL-LEVEL INTERMEDIATE DATA FILE
*********/
*Open the Pew input data
import delimited using Data/InputData/pew_input.csv, varnames(1)


/*
The variable swb, the respondent's self-reported overall
life satisfaction on a scale of 0 (least satisfied) to 
10 (most satisfied), is a string variable, with values of
"Zero", "One", "Two", ..., "Ten".

The following commands generate a new variable called swb, whose values are the numeric form of the string values in the variable q2.  (That is, if the value of q2 is "Zero", the value of swb will be 0; if the value of q2 is "One", the value of swb will be 1; and so on.)
*/
replace swb="0" if swb=="Zero"
replace swb="1" if swb=="One"
replace swb="2" if swb=="Two"
replace swb="3" if swb=="Three"
replace swb="4" if swb=="Four"
replace swb="5" if swb=="Five"
replace swb="6" if swb=="Six"
replace swb="7" if swb=="Seven"
replace swb="8" if swb=="Eight"
replace swb="9" if swb=="Nine"
replace swb="10" if swb=="Ten"

/*
The next command converts the swb variables
from string to numeric.
*/
destring swb, replace

/*The next command collapses the individual-level data to country-level means.

This will generate a new dataset with one
observation for each country, and two variables:
	countryname
	swb (which in this version of the dataset will be
		equal to the mean of the  individual-level
		swb variable for all respondents in each 
		country)
*/
collapse swb, by(countryname)

/*In this collapsed dataset, the variable swb represents
the mean of swb for all individuals in the original 
dataset from each country. 

To reflect this fact, the next command changes the name of the variable swb to meanswb.
*/
rename swb meanswb

/*
The next command assigns the label "Mean SWB"
to the variable meanswb.
*/
label variable meanswb "Mean SWB"


/*
The preceding commands in this do-file have done everything necessary to prepare the Pew data for merging with the WDI data.  The next command saves this partially
processed data in a new file called pew_intermediate.dta, and stores it in the IntermediateData/ folder
*/
save Data/IntermediateData/pew_intermediate.dta, replace
