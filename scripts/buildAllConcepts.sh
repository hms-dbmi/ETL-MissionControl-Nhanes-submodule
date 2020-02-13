#/bin/bash

###
# This scripts will run the necassary steps to gather the requried files from s3
# and execute the generate the allConcepts.csv needed to generate javabin files for HPDS
#

mkdir data
mkdir completed
mkdir processing
mkdir mappings
mkdir resources


print "Pulling nhanes data and configuration from s3"

aws s3 cp s3://avillach-73-nhanes-etl/data/ ./data/ --recursive
aws s3 cp s3://avillach-73-nhanes-etl/mappings/ ./mappings/ --recursive
aws s3 cp s3://avillach-73-nhanes-etl/resources/ ./resources/ --recursive

print "Generating allConcepts.csv"

java -jar GenerateAllConcepts.csv

print "Finished generating allConcepts.csv"