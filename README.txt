Re-evaluation of the Question Generation Shared Task & Evaluation Challenge (QG-STEC) 2010 Task B Questions from declarative sentences.
Keith Godwin

Contact
=======

Any queries please contact:

Keith.Godwin@open.ac.uk
Paul.Piwek@open.ac.uk

Overview
========

This zip file contains the data I used to realise the aim and objectives of my research project. The data files have been grouped by the relevant objective.

The aim of the research was to obtain a more accurate picture of the state-of-the-art of question generation by improving the quality of the QG-STEC data and re-analysing that data.

As a result of this research, we published a short paper at the INLG-2016 in Edinburgh (September 7-8, 2016). 

	INLG_Godwin_Piwek_2016.pdf



CONTENTS of QGSTEC2010-ReEvaluation.zip
=======================================

    1 - README.txt

Objective 1: Produce an additional set of re-evaluated QG-STEC data

    2 - Database.odb
    3 - RevisedJudgesGuidelines.pdf
    4 - ReEvaluated-data.xml
    5 - Evaluation.xsl

Objective 2: Assess the quality of the new data using IRR statistics.

    6 - Krippendorff.R
    7 - Export-Subsets.zip

Objective 3 & 4: Produce an analysis of the QG-STEC with new evaluation data for comparison and synthesis with original QG-STEC analysis.

    8 - DataSummary.xls
        DataSummary.ods



Description
===========


1 README.txt
============

This document gives a simple guide to the files required to follow my research method.


2 - Database.odb
================

LibreOffice Base file. When the evaluation was carried out each evaluator had their own version of the database. This database has imported the main data tables from each evaluator's database. Included are also data tables that were imported from the original QGSTEC.

Main data tables:

Original QGSTEC evaluations

A - tblEvaluationA 
B - tblEvaluationB 

Re-evaluated QGSTEC evaluations

1 - tblEvaluation1 
2 - tblEvaluation2 
KG - tblEvaluationKG

Queries:

The majority of the queries select subsets of data used to export into the csv files in section 8 below. The naming convention describes the data subset:

"QryKrippendorff" + <"_KG_1_2" | "_A_B"> + <Rel|QType|Corr|Amb|Var> + <""|"_HSolo"|"H">

Examples:

QryKrippendorff_KG_1_2_Amb - evaluation data from KG 1 & 2 datatables for the Ambiguity criterion above excluding any evaluation of Heilman System.

QryKrippendorf_KG_1_2_Amb_HSolo - same as above but just Heilman evaluation data.

QryKrippendorf_KG_1_2_AmbH - same as above but including all systems.

Form:

DataEntry - This form was used by the evaluators to collect new judgements. Currently it is pointing to tblEvaluationKG. This can be modified to point to any of the main data tables.


3 - RevisedJudgesGuidelines.pdf
===============================

This is the final document that was produced by the evaluators during the collaborative training process. It represents the annotation scheme and the manual used to re-evaluated the data.


4 - ReEvaluated-data.xml
========================

This file is in the same XML format that the original QG-STEC produced. The re-evaulated data tables above were exported into this format. Firstly by created a csv then building them using a python script.

The XML schema consisted of a root 'dataset' element with a child element called 'instance' for each test instance. The 'text' element contained the input to the QG system and the 'targetQuestionType' element specified the question type to be generated. Participant's submissions (anonymised as a, b, c, d and e) are in the 'submission' element with the corresponding ratings for the quality of the generated questions (with multiple raters). 

----------------------------------------------------------------------------------
<dataset>
<instance id="1">
	<id>OpenLearn</id>
	<source>A103_3</source>
	<text>The view that prevailed was that there should be a fitting public memorial to the 49,076 gunners who died.</text>
	<targetQuestionType>how many</targetQuestionType>
	<submission id="a">
		<question type="how many">To the how many gunners who died was the idea that prevailed there should be a public fitting memorial?
		<rating rater="ss" relevance="1" questionType="1" correctness="4" ambiguity="1" variety="2" />
        <rating rater="ha" relevance="1" questionType="1" correctness="1" ambiguity="1" variety="2" />
		</question>
		<question type="how many">The how many gunners who died was the idea that prevailed there should be a public memorial fitting to?
		<rating rater="ss" relevance="4" questionType="1" correctness="4" ambiguity="1" variety="2" />
        <rating rater="ha" relevance="1" questionType="1" correctness="2" ambiguity="1" variety="2" /> 
		</question>
	</submission>
</instance>
----------------------------------------------------------------------------------
Figure 5.1 Example 



5 - Evaluation.xsl
==================

Also included in this folder is the XSLT file used to translate the ratings into a table. Again, this was taken from the original QG-STEC.


6 - Krippendorff.R
==================
This script creates Krippendorff alpha for sources of data defined in Section 8. It also creates the less useful % agreement just for informational purposes.


7 - Export-Subsets.zip
======================

This zip file contains the csv export from Database.odb to produce various reliability calculations. These will be imported by Krippendorff.R.
The file name indicates what type of source they come from followed by the criteria:

Source: original data taken from CODA source (6 judges 2 evaluation sets gaps left in data i.e. 6 columns)
Database: original data entered into database with minor errors removed (6 judges 2 evaluation data consolidated into 2 columns)
ReEval: re-evaluation of QG-STEC with original 4 systems: MRSQG, WLV, JUQGG and Leithbridge (3 judges 3 evaluations sets)
Heilman: evaluation of just the Heilman system
ReEval_Heilman: re-evaluation with Heilman system included  (3 judges 3 evaluations sets)

E.g. STEC_ReEval_Correctness Re-evaluation of QG-STEC for Correctness criterion.


8 - DataSummary.ods
    DataSummary.xls 
===================

LibreOffice Calc file. Stipped down version of spreadsheet used for calculations.

"Extracted calculations" & "Old Extracted Calculations" sheets provides summary results by criteria and resource etc. for re-evaluated and original QG-STEC respectively.

The criteria in the "Summary" sheet and the 'Filter' column in the "Full Results" sheet will affect the results in "Extracted Calculations". Filter is use to mask rows based on user defined filters. Summary defines acceptability. 

Note: I have produced two formats .ods (Open Office Calc) and .xls (Microsoft Excel). I don't use Microsoft Excel so I can't guarantee the results in Datasummary.xls


