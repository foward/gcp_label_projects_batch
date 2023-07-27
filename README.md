# Label Projects in Batch using GCloud 🔥

We can achieve this by running a shell script which makes use of commands gcloud and awk to parse CSV data row by row. Here's a shell script that should accomplish what you need.

First, make sure to install the Google Cloud SDK on your local machine. Follow the instructions here: https://cloud.google.com/sdk/docs/install

Here is a brief explanation of the script:

1. We use $IFS=';' as input field separator (IFS) for the read command to handle semi-colon separated CSV.
2. Each row of data is read into the project_id, application_id, application_cluster variables based on the semi-colon separation.
3. We use gcloud projects update command to update the labels for each project.
4. We have a loop that goes through the CSV file line by line and updates the labels for each project.
This script can then be executed directly from the terminal. Before you run this script, ensure that you're authenticated to gcloud. You can authenticate using the command:

```
gcloud auth login 
```
This will open a new window in your browser for you to log in.

Please remember to give your script execution permissions using chmod +x scriptname.sh before running it.
