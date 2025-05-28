# Go AWS Lambda API with Custom CloudWatch Logging

This project demonstrates a production-ready setup using:

- ✅ AWS Lambda (written in Go)
- ✅ Terraform for deployment
- ✅ API Gateway trigger
- ✅ Custom CloudWatch Log Group (no default logging)

---

## Note: 

I’m currently learning AWS, Terraform, and Go!  
This project is part of my journey to understand:

- How to deploy serverless functions
- How CloudWatch logging works
- How IAM policies control permissions
- How to automate infrastructure using Terraform

---

## Prerequisites
- [Go](https://golang.org/) (v1.20+)
- [Terraform](https://terraform.io/)
- [AWS CLI](https://aws.amazon.com/cli/) (with `aws configure`)

---

## Setup & Deployment

### 1. Build the Lambda

```bash
make build
```

### 2. Zip the Lambda

```bash
make zip
```

### 3. Deploy with Terraform

```bash
make deploy
```


## Test the API
After deployment, Terraform will show an API URL like:

```text
https://<your-api-id>.execute-api.us-east-1.amazonaws.com/
```

### Test it:

```bash
curl https://<your-api-id>.execute-api.us-east-1.amazonaws.com/
```

Expected output:

```vbnet
Logged to custom CloudWatch group
```

## IAM Permissions
This setup:

✅ Allows logging only to /custom/lambda/logs

❌ Prevents access to /aws/lambda/<function-name>