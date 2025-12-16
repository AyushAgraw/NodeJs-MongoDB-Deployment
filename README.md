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
* Terraform will create necessary AWS resources (EC2, Security Groups, Docker container, etc.) automatically.
* App will be accessible via the public URL output by Terraform.

---

## Author

Ayush Agrawal
