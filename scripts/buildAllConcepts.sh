#/bin/bash

###
# This scripts will run the necassary steps to gather the requried files from s3
# and execute the generate the allConcepts.csv needed to generate javabin files for HPDS
#

if [! -d "completed" ]; then
   mkdir completed
fi
if [! -d "processing" ]; then
   mkdir processing
fi
if [! -d "mappings" ]; then
   mkdir mappings
fi
if [! -d "resources" ]; then
   mkdir resources
fi


printf "Pulling nhanes data and configuration from s3"

aws s3 cp s3://avillach-73-nhanes-etl/data/ ./data/ --recursive
aws s3 cp s3://avillach-73-nhanes-etl/mappings/ ./mappings/ --recursive
aws s3 cp s3://avillach-73-nhanes-etl/resources/ ./resources/ --recursive

printf "Generating allConcepts.csv"

java -jar GenerateAllConcepts.jar

printf "Finished generating allConcepts.csv"