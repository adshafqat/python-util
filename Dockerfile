# Use the official Python base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Install system dependencies for yq (yq requires jq)
RUN apt-get update && apt-get install -y \
    jq \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install yq
RUN curl -L -o /usr/local/bin/yq \
    https://github.com/mikefarah/yq/releases/download/v4.13.4/yq_linux_amd64 && \
    chmod +x /usr/local/bin/yq

# Copy the requirements file into the container
COPY requirements.txt .

# Install the required Python libraries
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Set the entrypoint to a shell (optional, you can change it as needed)
ENTRYPOINT ["sh"]

# Or set the entrypoint to Python script if you have a main script to run
# ENTRYPOINT ["python", "main.py"]
