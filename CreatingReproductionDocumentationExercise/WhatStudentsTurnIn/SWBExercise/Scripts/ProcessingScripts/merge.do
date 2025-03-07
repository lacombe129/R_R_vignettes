*IMPORTANT NOTE ABOUT MANAGING THE WORKING DIRECTORY
/************************************************
Whenever this script is executed, the SWBExercise/ folder should be designated as Stata's working directory.

The user must check to see whether the SWBExercise/ folder is designated as Stata's working directory.  If not, the user must interactively change the working directory to the SWBExercise/ folder.
************************************************/
*/
*Clear memory
clear

*Settings
set more off


*Open the partially processed Pew data
use Data/IntermediateData/pew_intermediate.dta


*Merge with the partially processed World Bank data, matching on countryname
merge 1:1 countryname using Data/IntermediateData/wdi_intermediate.dta

/*
Keep only observations for countries that appear in both the
Pew data and the WDI data
*/
keep if _merge==3

*Drop the _merge variable
drop _merge

/*
The merged data will be our analysis data--i.e., the
data we use when we perform the analysis for this 
exercise.

We will give the merged dataset the name analysis.dta,
and store it in the AnalysisData/ folder.
*/
save Data/AnalysisData/analysis.dta, replace

