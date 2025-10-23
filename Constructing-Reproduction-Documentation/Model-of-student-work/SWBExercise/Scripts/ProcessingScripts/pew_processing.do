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
import delimited using Data/InputData/pew_input.csv


/*The next command collapses the individual-level data to country-level means.

This will generate a new dataset with one
observation for each country, and two variables:
	countryname
	swb (which in this version of the dataset will be
		equal to the mean of the  individual-level
		swb variable for all respondents in each 
		country)
*/
collapse swb, by(country)

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
The preceding commands in this do-file have done everything necessary to prepare the Pew data for merging with the WDI data.  The next command saves this partially processed data in a new file called pew_intermediate.dta, and stores it in the IntermediateData/ folder
*/
save Data/IntermediateData/pew_intermediate.dta, replace
