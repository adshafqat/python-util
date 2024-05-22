# Use an official Python runtime as a parent image
FROM python:3.11

# Set the working directory in the container
WORKDIR /usr/src/app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    jq \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir pyyaml yq requests psycopg2-binary
RUN apt-get update && apt-get install -y ldap-utils vim 


# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Command to keep the container running
CMD ["tail", "-f", "/dev/null"]