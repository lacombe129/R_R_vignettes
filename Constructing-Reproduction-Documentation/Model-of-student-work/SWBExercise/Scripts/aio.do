*IMPORTANT NOTE ABOUT MANAGING THE WORKING DIRECTORY

/************************************************
Whenever this script is executed, the SWBExercise/ folder should be designated as Stata's working directory.

The user must check to see whether the SWBExercise/ folder is designated as Stata's working directory.  If not, the user must interactively change the working directory to the SWBExercise/ folder.
************************************************/
*/



do Scripts/ProcessingScripts/pew_processing.do

do Scripts/ProcessingScripts/wdi_processing.do

do Scripts/ProcessingScripts/merge.do

do Scripts/AnalysisScripts/analysis.do 