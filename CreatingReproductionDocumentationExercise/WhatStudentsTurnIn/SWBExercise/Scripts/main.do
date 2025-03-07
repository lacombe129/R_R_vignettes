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

do Scripts/ProcessingScripts/import_pew.do

do Scripts/ProcessingScripts/import_wdi.do

do Scripts/ProcessingScripts/merge.do

do Scripts/AnalysisScripts/analysis.do 