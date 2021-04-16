# Terraform Web Server with vars example

This folder contains a web server with vars example of a [Terraform](https://www.terraform.io/) file on Google Cloud Platform (GCP).

This Terraform file deploys a single web server on Google Cloud Platform (GCP). The web server returns "Hello, World" for the URL `/` listening on port 8080, which is defined as a variable.

## Requirements

* You must have [Terraform](https://www.terraform.io/) installed on your computer.
* You must have a [Google Cloud Platform (GCP)](https://cloud.google.com/) account.
* You must have downloaded a Google Cloud Platform credentials file.
* You must have enabled the Google Compute Engine API.
* It uses the Terraform Google Cloud Provider that interacts with the many resources supported by Google Cloud Platform (GCP) through its APIs.
* This code was written for Terraform 0.10.x.

## Using the code

* Configure your Google Cloud access keys.

  Two ways in order to configure credentials:

  * Configure `GOOGLE_APPLICATION_CREDENTIALS` environment variable. The variable must contain the path to the credentials file.

    To set these variable on Linux, macOS, or Unix, use `export`:

    ```bash
    export GOOGLE_APPLICATION_CREDENTIALS="~/.gcloud/terraform-examples-code.json"
    ```

    To set these variable on Windows, use `set`:

    ```bash
    set GOOGLE_APPLICATION_CREDENTIALS="C:\Users\USERNAME\.gcloud\terraform-examples-code.json"
    ```

  * Configure `GOOGLE_CREDENTIALS` environment variable. The variable must contain the content of the credentials file and not the path to it.

    To set these variable on Linux, macOS, or Unix, use `export`:

    ```bash
    export GOOGLE_CREDENTIALS="$(cat ~/.gcloud/terraform-examples-code.json)"
    ```

* Initialize working directory.

  The first command that should be run after writing a new Terraform configuration is the `terraform init` command in order to initialize a working directory containing Terraform configuration files. It is safe to run this command multiple times.

  ```bash
  terraform init
  ```

* Modify google project details and specify the VM Name

  The terraform will be deployed on google project with the VM name which is defined as an input variable `GOOGLE_PROJECT_ID` and `VM_NAME`  in `vars.tf` file.

  If you want to modify the Google Project and Vm name,  you will be able to do it in several ways:

  * Loading variables from command line flags.

    Run Terraform commands in this way:

    ```bash
    terraform plan -var 'GOOGLE_PROJECT_ID=cc-dev-sandbox-20200619'
    ```

    ```bash
    terraform apply -var 'GOOGLE_PROJECT_ID=cc-dev-sandbox-20200619'
    ```

  * Loading variables from a file.

    When Terraform runs it will look for a file called `terraform.tfvars`. You can populate this file with variable values that will be loaded when Terraform runs. An example for the content of the `terraform.tfvars` file:

    ```bash
    GOOGLE_PROJECT_ID = "cc-dev-sandbox-20200619"
    VM_NAME = "test-utkarsh-code-pipes"
    ```

  * Loading variables from environment variables.

    Terraform will also parse any environment variables that are prefixed with `TF_VAR`. You can create an environment variable `TF_VAR_GOOGLE_PROJECT_ID` and `TF_VAR_VM_NAME`:

    ```bash
    TF_VAR_GOOGLE_PROJECT_ID=cc-dev-sandbox-20200619
    TF_VAR_VM_NAME=test-utkarsh-code-pipes
    ```

  * Variable defaults.

    Change the value of the `default` attribute of `GOOGLE_PROJECT_ID` and `VM_NAME`  input variable in `vars.tf` file.

* Validate the changes.

  Run command:

  ```bash
  terraform plan
  ```

* Deploy the changes.

  Run command:

  ```bash
  terraform apply
  ```

* Test the web server.

   You can test it in two ways:
  
  * Running this command:

    ```bash
    curl http://<server_public_ip>:8000/
    ```

  * Writing in your browser this URL: `http://<server_public_ip>:8000/`

  You should get a `Hello, Team Code Pipes, Your Automation works!!!` response message.

* Test the deploy.

  When the `terraform apply` command completes, use the Google Cloud console, you should see the new Google Compute instance.

* Clean up the resources created.

  When you have finished, run command:

  ```bash
  terraform destroy
  ```
