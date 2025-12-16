# Node.js & MongoDB Deployment on AWS with Terraform

This repository contains a complete setup for deploying a Node.js application with a MongoDB backend on AWS using Docker and Terraform.

---

## Pre-requisites

Before you begin, ensure you have the following installed and configured:

* [Git](https://git-scm.com/)
* [Terraform](https://www.terraform.io/downloads)
* [AWS CLI](https://aws.amazon.com/cli/)
* AWS CLI must be configured with your environment variables or `aws configure`

---

## Quick Start

Follow these steps to deploy the application:

1. **Clone the repository**

```bash
git clone https://github.com/AyushAgraw/NodeJs-MongoDB-Deployment.git
cd NodeJs-MongoDB-Deployment/Terraform
```

2. **Initialize Terraform**

```bash
terraform init
```

3. **Apply Terraform configuration**

```bash
terraform apply --auto-approve
```

4. **Access the application**

* After Terraform completes, it will output a URL.
* Wait for 2 minutes to allow the Docker container to start.
* Open the URL in your browser to access the deployed app.

---

## How It Works

* Running `terraform apply` will create the complete AWS infrastructure including:

  * VPC
  * Subnet
  * Route Table
  * Internet Gateway (IGW)
  * EC2 instance with security group
  * Other necessary networking components

* During instance creation, a shell script is executed which:

  * Builds a multi-stage Docker container for the Node.js app
  * Uses a non-root user inside the container
  * Installs and runs `npm` inside the container
  * Connects the app to a MongoDB Atlas database

* The Node.js To-Do app hosted in the container can store and retrieve information from MongoDB, reflecting updates live on the website.

* To perform a security scan using Trivy:

  1. SSH into the EC2 instance
  2. Run the command:

```bash
trivy image nodejs-deployment:v1
```

---

## Project Structure

```
NodeJs-MongoDB-Deployment/
├── app/                # Node.js application code
│   ├── models/
│   │   └── Todo.js
│   ├── public/
│   │   └── index.html
│   └── routes/
│       └── todoRoutes.js
├── Terraform/          # Terraform code for AWS infrastructure
├── .env                # Environment variables
├── .gitignore
├── Dockerfile          # Dockerfile for Node.js app
├── package.json
└── server.js
```

---

## Notes

* Ensure MongoDB connection details in `.env` are correct.
* Terraform will create all necessary AWS resources automatically.
* App will be accessible via the public URL output by Terraform.

---

## Author

Ayush Agrawal
