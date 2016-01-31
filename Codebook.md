Coursera - Getting and Cleaning Data - Codebook
=============================
 
 
Data source
-------------

A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Run_analyst.R
-------------
1. Create variable "url" with data source
2. Download data archive
3. Unzip data archive
4. Read csv with x_train set and create variable "train"
5. Read csv with y_train and add column to "train"
6. Read csv with train_subject and add column to "train"
4. Read csv with x_test set and create variable "test"
5. Read csv with y_test and add column to "test"
6. Read csv with test_subject and add column to "test"
7. Read csv with labels and create variable "label"
8. Name columns in "label"
9. Read csv with features and create variable "feat"
10. Merge "train" and "test"
11. Select columns including "mean" or "std" and create variable "col"
12. Subset "feat"
13. Subset "total"
14. Name columns in "total"
15. Merge "total" with "label"
16. Drop column
17. Calculate mean and create variable "tidy"
18. Write tidy data set