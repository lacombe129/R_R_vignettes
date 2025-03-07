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


*Open the analysis data
use Data/AnalysisData/analysis.dta

****************************************************
*HISTOGRAM AND SUMMARY STATISTICS FOR VARIABLE meanswb
****************************************************
*Generate histogram
*And save the histogram in the Output/Figures/ folder
*with the filename Figure1.gph
histogram meanswb, ///
	percent ///
	t1(Histogram of Mean SWB) ///
	t2(FIGURE 1) ///
	saving(Output/Figures/Figure1.gph, replace)


*Generate summary statistics
*And save in the Output/Tables/ folder
*with the filename Table1.log
quietly capture log close
quietly log using Output/Tables/Table1.log, replace
tabstat meanswb, stat(n mean sd min max p25 p50 p75)
quietly log close


**************************************************
*HISTOGRAM AND SUMMARY STATISTICS FOR VARIABLE gdppc
**************************************************
*Generate histogram
*And save the histogram in the Output/Figures/ folder
*with the filename Figure2.gph
histogram gdppc, ///
	percent ///
	t1(Histogram of GDP pc) ///
	t2(FIGURE 2) ///
	saving(Output/Figures/Figure2.gph, replace)

	
*Generate summary statistics
*And save in the Output/Tables/ folder
*with the filename Table2.log
quietly capture log close
quietly log using Output/Tables/Table2.log, replace
tabstat gdppc, stat(n mean sd min max p25 p50 p75)
quietly log close


****************************************************
*HISTOGRAM AND SUMMARY STATISTICS FOR VARIABLE lngdppc
****************************************************
*Generate histogram
*And save the histogram in the Output/Figures/ folder
*with the filename Figure3.gph
histogram lngdppc, ///
	percent ///
	t1(Histogram of natural log of GDP pc) ///
	t2(FIGURE 3) ///
	saving(Output/Figures/Figure3.gph, replace)
 

*Generate summary statistics
*And save in the Output/Tables/ folder
*with the filename Table3.log
quietly capture log close
quietly log using Output/Tables/Table3.log, replace
tabstat lngdppc, stat(n mean sd min max p25 p50 p75)
quietly log close


****************************************************
*SCATTERPLOT OF meanswb AGAINST gdppc
****************************************************
*Generate the scatterplot
*And save the scatterplot in the Output/Figures/ folder
*with the filename Figure4.gph
scatter meanswb gdppc, ///
	t1(Scatterplot of Mean SWB against GDP pc) ///
	t2(FIGURE 4) ///
	saving(Output/Figures/Figure4.gph, replace)

	
****************************************************
*SCATTERPLOT OF meanswb AGAINST lngdppc
****************************************************	
*Generate the scatterplot
*And save the scatterplot in the Output/Figures/ folder
*with the filename Figure5.gph
scatter meanswb lngdppc, ///
	t1(Scatterplot of Mean SWB against natural log of GDP pc) ///
	t2(FIGURE 5) ///
	saving(Output/Figures/Figure5.gph, replace)
	

*Generate the scatterplot with a line of best fit
*And save the scatterplot and line of best fit
*in the Output/Figures/ folder
*with the filename Figure6.gph
scatter meanswb lngdppc || lfit meanswb lngdppc, ///
	t1(Scatterplot of Mean SWB against natural log of GDP pc) ///
	t2(FIGURE 6 ) ///
	saving(Output/Figures/Figure6.gph, replace)	
	