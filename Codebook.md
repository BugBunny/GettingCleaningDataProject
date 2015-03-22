---
title: "Getting & Cleaning Project Data -- Codebook"
author: "Ian"
date: "Sunday, March 22, 2015"
output: html_document
---
### Background

This dataset was prepared as a course project for the *Getting and Cleaning Data* course of the *Data Science Specialization* provided by *Coursera*:

https://www.coursera.org/course/getdata

It derives from a research study of *Human Activity Using Smartphones*. The original data from which this dataset was produced, together with documentation of both the study and these original data, are available here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Data format

The dataset is stored in a text file: "Getting_Cleaning_Project_Data.txt".

It comprises a single rectangular data table made up of 72 variables and 180 records, together with a header record that contains variable names.

The data fields are separated by spaces.

### Overview of content

The data comprise 70 measurements on 30 subjects engaged in 6 activities. They are stored in "wide" format with one record for each activity for each subject that contains all of the measurements. In addition to these 70 measurements, each record contains Subject and Activity identifiers as its first 2 variables.

The **Subjects** are numbered 1 to 30.

The six **Activities** are:

1. "WALKING"
2. "WALKING_UPSTAIRS"
3. "WALKING_DOWNSTAIRS"
4. "SITTING"
5. "STANDING"
6. "LAYING""

The 70 **measurements** are subject-activity-specific means of a series of individual-level measurements, paired with their standard deviations. Some measurements refer to the velocity and acceleration of movements in 3D space and the data on these include both the means and standard deviations of the measurements on the X, Y and Z axes. Other measures comprise single pairings of a mean and standard deviation.
