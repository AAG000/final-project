# User Management Web Application

This project is a web application for managing users developed using a 3-Tier Architecture infrastructure on AWS. The application allows users to add, update, delete, and display user information using MySQL as the database.

## Project Components

1. **Web Tier**: Contains the user interface for the user management application.
2. **Application Tier**: Contains the application logic and communicates with the database.
3. **Database Tier**: Stores user information using MySQL.

## Technologies Used

- **AWS**: For hosting the infrastructure.
- **Flask**: The web framework used for developing the application.
- **MySQL**: The database used for storing user information.
- **Docker**: For containerizing the application.
- **Terraform**: For infrastructure as code (IaC) management.

## Setup Steps

### 1. Setting Up the Web Application

- We developed a Flask application that includes interfaces for managing users.
- The `Flask-MySQLdb` library was used to connect to the MySQL database.

### 2. Setting Up MySQL Database

- A MySQL database was set up on an EC2 instance in the database tier.
- The database, user, and permissions were created using a script in the `user_data` for the EC2 instance.

### 3. Setting Up Infrastructure with Terraform

- Terraform files were configured to define the infrastructure, including VPC, subnets, EC2 instances, and load balancers.
- Terraform was applied to create the resources on AWS.

### 4. Running the Application

- After applying Terraform, the Flask application was launched on the EC2 instance in the application tier.

## How to Run the Project

1. Ensure you have an AWS account and sufficient permissions to create resources.
2. Initialize Terraform by running:
   ```bash
   terraform init
