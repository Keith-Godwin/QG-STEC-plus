# This script creates Inter-rater agreement for QG-STEC data using Krippendorff's alpha for the five sources of data detailed below. 
# It also creates the less useful % agreement just for informational purposes.
#
#
# File name and variable naming convention:
#
# Source: original data taken from CODA source (6 judges 2 evaluation sets gaps left in data i.e. 6 columns)
# Database: original data entered into database with minor errors removed (6 judges 2 evaluation data consolidated into 2 columns)
# ReEval: re-evaluation of STEC with original 4 systems: MRSQG, WLV, JUQGG and Leithbridge (3 judges 3 evaluations sets)
# Heilman: evaluation of just the Heilman system
# ReEval_Heilman: re-evaluation with Heilman system included  (3 judges 3 evaluations sets)
#
#
# QG-STEC data: 
#
# column = Judge
# row = each evaluation, i.e. each question evaluation. 
#
#
# Data values = interval criteria categories, e.g. Correctness has 4 categories 1 - 4 
#
#     NA means not available
#
#
# Requires irr: http://cran.r-project.org/web/packages/irr/index.html 
library("irr", lib.loc="~/R/x86_64-pc-linux-gnu-library/3.0")
#
# Set this path to the location of the data files.
#
path="~/Research/Dissertation/Analysis/R"
setwd(path)

# import source data

STEC_Source_Relevance <- read.delim("STEC_Source_Relevance.csv", header=F)
STEC_Database_Relevance <- read.delim("STEC_Database_Relevance.csv", header=F) 
STEC_ReEval_Relevance <- read.delim("STEC_ReEval_Relevance.csv", header=F)
STEC_Heilman_Relevance <- read.delim("STEC_Heilman_Relevance.csv", header=F)
STEC_ReEval_Heilman_Relevance <- read.delim("STEC_ReEval_Heilman_Relevance.csv", header=F)

STEC_Source_QuestionType <- read.delim("STEC_Source_QuestionType.csv", header=F)
STEC_Database_QuestionType <- read.delim("STEC_Database_QuestionType.csv", header=F)
STEC_ReEval_QuestionType <- read.delim("STEC_ReEval_QuestionType.csv", header=F)
STEC_Heilman_QuestionType <- read.delim("STEC_Heilman_QuestionType.csv", header=F)
STEC_ReEval_Heilman_QuestionType <- read.delim("STEC_ReEval_Heilman_QuestionType.csv", header=F)

STEC_Source_Correctness <- read.delim("STEC_Source_Correctness.csv", header=F)
STEC_Database_Correctness <- read.delim("STEC_Database_Correctness.csv", header=F)
STEC_ReEval_Correctness <- read.delim("STEC_ReEval_Correctness.csv", header=F)
STEC_Heilman_Correctness <- read.delim("STEC_Heilman_Correctness.csv", header=F)
STEC_ReEval_Heilman_Correctness <- read.delim("STEC_ReEval_Heilman_Correctness.csv", header=F)

STEC_Source_Ambiguity <- read.delim("STEC_Source_Ambiguity.csv", header=F)
STEC_Database_Ambiguity <- read.delim("STEC_Database_Ambiguity.csv", header=F)
STEC_ReEval_Ambiguity <- read.delim("STEC_ReEval_Ambiguity.csv", header=F)
STEC_Heilman_Ambiguity <- read.delim("STEC_Heilman_Ambiguity.csv", header=F)
STEC_ReEval_Heilman_Ambiguity <- read.delim("STEC_ReEval_Heilman_Ambiguity.csv", header=F)

STEC_Source_Variety <- read.delim("STEC_Source_Variety.csv", header=F)
STEC_Database_Variety <- read.delim("STEC_Database_Variety.csv", header=F)
STEC_ReEval_Variety <- read.delim("STEC_ReEval_Variety.csv", header=F)
STEC_Heilman_Variety <- read.delim("STEC_Heilman_Variety.csv", header=F)
STEC_ReEval_Heilman_Variety <- read.delim("STEC_ReEval_Heilman_Variety.csv", header=F)

# Create & populate with transposed matrix

STEC_Source_Relevance_matrix<-matrix(t(STEC_Source_Relevance),nrow=6)
STEC_Database_Relevance_matrix<-matrix(t(STEC_Database_Relevance),nrow=2)
STEC_ReEval_Relevance_matrix<-matrix(t(STEC_ReEval_Relevance),nrow=3)
STEC_Heilman_Relevance_matrix<-matrix(t(STEC_Heilman_Relevance),nrow=3)
STEC_ReEval_Heilman_Relevance_matrix<-matrix(t(STEC_ReEval_Heilman_Relevance),nrow=3)

STEC_Source_QuestionType_matrix<-matrix(t(STEC_Source_QuestionType),nrow=6)
STEC_Database_QuestionType_matrix<-matrix(t(STEC_Database_QuestionType),nrow=2)
STEC_ReEval_QuestionType_matrix<-matrix(t(STEC_ReEval_QuestionType),nrow=3)
STEC_Heilman_QuestionType_matrix<-matrix(t(STEC_Heilman_QuestionType),nrow=3)
STEC_ReEval_Heilman_QuestionType_matrix<-matrix(t(STEC_ReEval_Heilman_QuestionType),nrow=3)

STEC_Source_Correctness_matrix<-matrix(t(STEC_Source_Correctness),nrow=6)
STEC_Database_Correctness_matrix<-matrix(t(STEC_Database_Correctness),nrow=2)
STEC_ReEval_Correctness_matrix<-matrix(t(STEC_ReEval_Correctness),nrow=3)
STEC_Heilman_Correctness_matrix<-matrix(t(STEC_Heilman_Correctness),nrow=3)
STEC_ReEval_Heilman_Correctness_matrix<-matrix(t(STEC_ReEval_Heilman_Correctness),nrow=3)

STEC_Source_Ambiguity_matrix<-matrix(t(STEC_Source_Ambiguity),nrow=6)
STEC_Database_Ambiguity_matrix<-matrix(t(STEC_Database_Ambiguity),nrow=2)
STEC_ReEval_Ambiguity_matrix<-matrix(t(STEC_ReEval_Ambiguity),nrow=3)
STEC_Heilman_Ambiguity_matrix<-matrix(t(STEC_Heilman_Ambiguity),nrow=3)
STEC_ReEval_Heilman_Ambiguity_matrix<-matrix(t(STEC_ReEval_Heilman_Ambiguity),nrow=3)

STEC_Source_Variety_matrix<-matrix(t(STEC_Source_Variety),nrow=6)
STEC_Database_Variety_matrix<-matrix(t(STEC_Database_Variety),nrow=2)
STEC_ReEval_Variety_matrix<-matrix(t(STEC_ReEval_Variety),nrow=3)
STEC_Heilman_Variety_matrix<-matrix(t(STEC_Heilman_Variety),nrow=3)
STEC_ReEval_Heilman_Variety_matrix<-matrix(t(STEC_ReEval_Heilman_Variety),nrow=3)

# Calculate agreement %

STEC_Database_Relevance_Agreement <- agree(t(STEC_Database_Relevance_matrix), tolerance=0)
STEC_ReEval_Relevance_Agreement <- agree(t(STEC_ReEval_Relevance_matrix), tolerance=0)

STEC_Database_QuestionType_Agreement <- agree(t(STEC_Database_QuestionType_matrix), tolerance = 0)
STEC_ReEval_QuestionType_Agreement <- agree(t(STEC_ReEval_QuestionType_matrix), tolerance = 0)

STEC_Database_Correctness_Agreement <- agree(t(STEC_Database_Correctness_matrix), tolerance=0)
STEC_ReEval_Correctness_Agreement <- agree(t(STEC_ReEval_Correctness_matrix), tolerance=0)

STEC_Database_Ambiguity_Agreement <- agree(t(STEC_Database_Ambiguity_matrix), tolerance=0)
STEC_ReEval_Ambiguity_Agreement <- agree(t(STEC_ReEval_Ambiguity_matrix), tolerance=0)

STEC_Database_Variety_Agreement <- agree(t(STEC_Database_Variety_matrix), tolerance=0)
STEC_ReEval_Variety_Agreement <- agree(t(STEC_ReEval_Variety_matrix), tolerance=0)

# Calculate Krippendorff's alpha

STEC_Source_Relevance_Kripp<-kripp.alpha(STEC_Source_Relevance_matrix,"interval")
STEC_Database_Relevance_Kripp<-kripp.alpha(STEC_Database_Relevance_matrix,"interval")
STEC_ReEval_Relevance_Kripp<-kripp.alpha(STEC_ReEval_Relevance_matrix,"interval")
STEC_Heilman_Relevance_Kripp<-kripp.alpha(STEC_Heilman_Relevance_matrix,"interval")
STEC_ReEval_Heilman_Relevance_Kripp<-kripp.alpha(STEC_ReEval_Heilman_Relevance_matrix,"interval")

STEC_Source_QuestionType_Kripp<-kripp.alpha(STEC_Source_QuestionType_matrix,"interval")
STEC_Database_QuestionType_Kripp<-kripp.alpha(STEC_Database_QuestionType_matrix,"interval")
STEC_ReEval_QuestionType_Kripp<-kripp.alpha(STEC_ReEval_QuestionType_matrix,"interval")
STEC_Heilman_QuestionType_Kripp<-kripp.alpha(STEC_Heilman_QuestionType_matrix,"interval")
STEC_ReEval_Heilman_QuestionType_Kripp<-kripp.alpha(STEC_ReEval_Heilman_QuestionType_matrix,"interval")

STEC_Source_Correctness_Kripp<-kripp.alpha(STEC_Source_Correctness_matrix,"interval")
STEC_Database_Correctness_Kripp<-kripp.alpha(STEC_Database_Correctness_matrix,"interval")
STEC_ReEval_Correctness_Kripp<-kripp.alpha(STEC_ReEval_Correctness_matrix,"interval")
STEC_Heilman_Correctness_Kripp<-kripp.alpha(STEC_Heilman_Correctness_matrix,"interval")
STEC_ReEval_Heilman_Correctness_Kripp<-kripp.alpha(STEC_ReEval_Heilman_Correctness_matrix,"interval")

STEC_Source_Ambiguity_Kripp<-kripp.alpha(STEC_Source_Ambiguity_matrix,"interval")
STEC_Database_Ambiguity_Kripp<-kripp.alpha(STEC_Database_Ambiguity_matrix,"interval")
STEC_ReEval_Ambiguity_Kripp<-kripp.alpha(STEC_ReEval_Ambiguity_matrix,"interval")
STEC_Heilman_Ambiguity_Kripp<-kripp.alpha(STEC_Heilman_Ambiguity_matrix,"interval")
STEC_ReEval_Heilman_Ambiguity_Kripp<-kripp.alpha(STEC_ReEval_Heilman_Ambiguity_matrix,"interval")

STEC_Source_Variety_Kripp<-kripp.alpha(STEC_Source_Variety_matrix,"interval")
STEC_Database_Variety_Kripp<-kripp.alpha(STEC_Database_Variety_matrix,"interval")
STEC_ReEval_Variety_Kripp<-kripp.alpha(STEC_ReEval_Variety_matrix,"interval")
STEC_Heilman_Variety_Kripp<-kripp.alpha(STEC_Heilman_Variety_matrix,"interval")
STEC_ReEval_Heilman_Variety_Kripp<-kripp.alpha(STEC_ReEval_Heilman_Variety_matrix,"interval")

# Output results 

# Source and Database should be similar. Expect to have small differences due to fixing of some minor errors in original data.

print("Original Coda source data for QG-STEC")
STEC_Source_Relevance_Kripp
STEC_Source_QuestionType_Kripp
STEC_Source_Correctness_Kripp
STEC_Source_Ambiguity_Kripp
STEC_Source_Variety_Kripp

print("Original data cleaned and entered into database QG-STEC")
STEC_Database_Relevance_Kripp
STEC_Database_QuestionType_Kripp
STEC_Database_Correctness_Kripp
STEC_Database_Ambiguity_Kripp
STEC_Database_Variety_Kripp

print("Re-evaluated QG-STEC excluding Heilman")
STEC_ReEval_Relevance_Kripp
STEC_ReEval_QuestionType_Kripp
STEC_ReEval_Correctness_Kripp
STEC_ReEval_Ambiguity_Kripp
STEC_ReEval_Variety_Kripp

print("Heilman evaluation")
STEC_Heilman_Relevance_Kripp
STEC_Heilman_QuestionType_Kripp
STEC_Heilman_Correctness_Kripp
STEC_Heilman_Ambiguity_Kripp
STEC_Heilman_Variety_Kripp

print("Re-evaluated QG-STEC including Heilman")
STEC_ReEval_Heilman_Relevance_Kripp
STEC_ReEval_Heilman_QuestionType_Kripp
STEC_ReEval_Heilman_Correctness_Kripp
STEC_ReEval_Heilman_Ambiguity_Kripp
STEC_ReEval_Heilman_Variety_Kripp

print("Percentage agreement original QG-STEC")
STEC_Database_Relevance_Agreement
STEC_Database_QuestionType_Agreement
STEC_Database_Correctness_Agreement
STEC_Database_Ambiguity_Agreement
STEC_Database_Variety_Agreement

print("Percentage agreement re-evaluated QG-STEC")
STEC_ReEval_Relevance_Agreement
STEC_ReEval_QuestionType_Agreement
STEC_ReEval_Correctness_Agreement
STEC_ReEval_Ambiguity_Agreement
STEC_ReEval_Variety_Agreement

# Calculate the judges category selection frequency per criterion

#Relevance

table(STEC_Database_Relevance$V1)
table(STEC_Database_Relevance$V2)

table(STEC_ReEval_Relevance$V1)
table(STEC_ReEval_Relevance$V2)
table(STEC_ReEval_Relevance$V3)
#Correctness

table(STEC_Database_Correctness$V1)
table(STEC_Database_Correctness$V2)


table(STEC_ReEval_Correctness$V1)
table(STEC_ReEval_Correctness$V2)
table(STEC_ReEval_Correctness$V3)
