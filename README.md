# Google Cloud SQL with Terraform Module

1 - Update provider.tf with your location to your google credentials file. 

2 - Update variables.tf with your required configuration.

#
## Cloud SQL Proxy

### Installing the Cloud SQL Proxy
1 - Download the proxy

```bash
 wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 -O cloud_sql_proxy
```

2 - Make the proxy executable
```
chmod +x cloud_sql_proxy
```

### Test connection to the database
1 - Start by running the Cloud SQL proxy for Cloud SQL instance. Run the below commands from the terraform repository folder.  Ensure to update the region if required.
```
export GOOGLE_PROJECT=$(gcloud config get-value project)
MYSQL_DB_NAME=$(terraform output -json | jq -r '.instance_name.value')
MYSQL_CONN_NAME="${GOOGLE_PROJECT}:europe-west2:${MYSQL_DB_NAME}"
```

2 - Run this command to start the proxy on the instance.
```
./cloud_sql_proxy -instances=${MYSQL_CONN_NAME}=tcp:3306
```

3 - Now you'll need to open up a new SSH shell.  Navigate to the terraform directory:
```
cd ~/terraform-folder
```

4 - Get the generated password for MYSQL:
```
echo MYSQL_PASSWORD=$(terraform output -json | jq -r '.generated_user_password.value')
```

5 -Test the MySQL connection.  If you have deployed with different default values, change this as requried.

```
mysql -u default -p --host 127.0.0.1 default
```

6 - When prompted, enter the value of MYSQL_PASSWORD, found in the output above, and press Enter.

You should successfully log into the MYSQL command line. Exit from MYSQL by typing Ctrl + d.

