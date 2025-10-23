*IMPORTANT NOTE ABOUT MANAGING THE WORKING DIRECTORY
/************************************************
Whenever this script is executed, the SWBExercise/ folder should be designated as Stata's working directory.

The user must check to see whether the SWBExercise/ folder is designated as Stata's working directory.  If not, the user must interactively change the working directory to the SWBExercise/ folder.
************************************************/
*/

*Clear memory
clear

*Declare Stata version
version 18

*Settings
set more off

*Open the WDI input data
import delimited using Data/InputData/wdi_input.csv, varnames(1)

*Assign a label to the variable gdppc 
label variable gdppc "GDP pc, PPP international $"

 
*Generate a new variable, called lngdppc, equal to the natural log of gdppc
gen lngdppc=ln(gdppc)

*Label the variable lngdppc
label variable lngdppc "Natural log of GDP pc"

save Data/IntermediateData/wdi_intermediate.dta, replace
