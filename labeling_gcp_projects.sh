#!/bin/bash

# Make sure to install the Google Cloud SDK before running this script.
# Replace /path/to/your_file.csv with the path to your CSV file.

csv_file_path="your_file.csv"

{ read; while IFS=';' read -r project_id application_id application_cluster || [[ -n "$line" ]];
do 
    application_id=${application_id,,}
    application_cluster=${application_cluster,,}

    # Remove leading or trailing spaces
    project_id=$(echo $project_id | xargs)
    application_id=$(echo ${application_id,,} | xargs)
    application_cluster=$(echo ${application_cluster,,} | xargs)

    # Replace non-alphanumeric characters with underscore
    application_id=${application_id//[^a-z0-9]/-}
    application_cluster=${application_cluster//[^a-z0-9]/}


    echo "Reading: Project ID: $project_id, Application ID:=$application_id, Application Cluster: =$application_cluster"
     

    if [[ $application_id =~ ^[a-z]([-a-z0-9]*[a-z0-9])?$ ]] && [[ $application_cluster =~ ^[a-z]([-a-z0-9]*[a-z0-9])?$ ]]; then
        gcloud alpha projects update $project_id --update-labels application_id=$application_id,application_cluster=$application_cluster
    else
        echo "Either Application ID or Application Cluster does not match the allowed label format."
    fi

done; } < "$csv_file_path"



