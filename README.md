---
title: "README - run_analysis.R"
author: "Ian"
date: "Sunday, March 22, 2015"
output: html_document
---

### Background

This repository contains a R script produced for the course project of the *Getting and Cleaning Data* course of the *Data Science Specialization* provided by *Coursera*:

https://www.coursera.org/course/getdata

The script processes the data from a research study of *Human Activity Using Smartphones* to produce a 'tidy' rectangular dataset. 

### Input datasets

The original datasets, together with documentation of the study and of these original data, are available here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The script assumes that the data distributed from this site has been unzipped in the working directory preserving its directory structure.

### Output Dataset

The output dataset is written to a text file: "Getting_Cleaning_Project_Data.txt".

It comprises a single rectangular data table made up of 72 variables and 180 records, together with a header record that contains variable names.

The data fields are separated by spaces.

The data comprise 70 different measurements on each of 30 subjects while they were engaged in each of 6 activities.

The script produces a "wide" format dataset that comprises one record for each activity for each subject that contains subject and activity identifiers and all of the measurements.

A more detailed codebook is included in this repository.

### Description of the R script

The script was written using R 3.1.2 under Windows 7 SP1.

It performs 5 tasks successively:

1. Merging the *training* and the *test* datasets to create one data set. This step also prefixes the  measurements with *Subject* and *Activity* identifiers obtained from the *subject* and *y* tables.
2. Extracting the mean and standard deviation *features* of each measurement. 
3. Converting the *Activity* variable to a factor with descriptive activity names obtained from  the *activity_labels* table.
4. Setting the names of the measurement variables to be descriptive variable names obtained from the *features* table. (At this point the script writes the disaggregated data to a file).
5. Creating and writing to file an aggregated dataset containing the averages of the measures calulated across each *Activity* by *Subject* pairing. This dataset is in **wide** format (i.e. a file with the averages of the whole series of mean measurements for each *Activity* by *Subject* pairing on a single record).

Further comments on detailed aspects of some of these steps are included in the **run_analysis.R** script file.
