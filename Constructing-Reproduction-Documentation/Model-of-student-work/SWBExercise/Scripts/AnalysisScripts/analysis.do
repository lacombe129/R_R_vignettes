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

*Open the analysis data
use Data/AnalysisData/analysis.dta

****************************************************
*TABLE OF SUMMARY STATISTICS FOR meanswb AND gdppc
****************************************************
asdoc tabstat gdppc meanswb, statistics(mean sd p25 p50 p75) ///
	save(Output/Tables/Table1.rtf) replace

	
****************************************************
*HISTOGRAMS OF meanswb AND gdppc
****************************************************	
*Histogram for meanswb
histogram meanswb, percent saving(Output/Figures/Figure1.gph, replace)

*Histogram for gdppc
histogram gdppc, percent saving(Output/Figures/Figure2.gph, replace)


****************************************************
*SCATTERPLOT OF meanswb AGAINST gdppc
****************************************************
scatter meanswb gdppc || lfit meanswb gdppc, saving(Output/Figures/Figure3.gph, replace)






