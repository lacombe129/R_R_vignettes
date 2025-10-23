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

*Open the WDI input data
import delimited using Data/InputData/wdi_input.csv

*Assign a label to the variable gdppc 
label variable gdppc "2002 GDP pc (PPP dollars)"

/*
Because this exercise is an exploration of the association
between income per capita and subjective well-being in income
low- and middle-income countries, we drop the observations for
upper-income countries, which we define as countries with 2002 
GDP per capita of more than 15,000 PPP dollars
*/
drop if gdppc>15000

/*
The processing of the WDI data necessary to prepare it for 
merging with the Pew data is now complete, so we save the current data in a new file called wdi_intermediate.dta, and store it in the IntermediateData/ folder
*/
save Data/IntermediateData/wdi_intermediate.dta, replace
