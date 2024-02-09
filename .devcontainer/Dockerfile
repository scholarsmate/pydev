# Use UBI 9 minimal as the base image
FROM registry.access.redhat.com/ubi9/ubi-minimal:latest

# Install Python 3, sudo, and other necessary development tools
RUN microdnf update -y && \
    microdnf install -y python3 python3-devel gcc gcc-c++ make postgresql-devel git jq less findutils tar unzip sudo && \
    microdnf clean all
    
# Create a non-root user with a home directory, and grant sudo privileges
RUN useradd --create-home developer && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer

# Set the default user to the non-root user
USER developer

# Set the working directory in the container
WORKDIR /home/developer/app

# Set Python to use unbuffered output
ENV PYTHONUNBUFFERED=1

# Use a virtual environment for Python development
RUN python3 -m venv venv

# Activate the virtual environment for subsequent commands
ENV PATH="/home/developer/app/venv/bin:$PATH"

# Copy license list data into the container
COPY --chown=developer:developer ./license-list-data ./license-list-data

# Copy the development requirements file into the container
COPY --chown=developer:developer ./requirements-dev.txt ./

# Copy the app requirements file into the container
COPY --chown=developer:developer ./requirements.txt ./

# Download and install Python development dependencies within the virtual environment
RUN pip install --upgrade pip && pip download -r requirements-dev.txt -d ./dependencies-dev && pip install --no-cache-dir ./dependencies-dev/*

# Download app dependencies
RUN pip download -r requirements.txt -d ./dependencies

# Specify the command to run on container start
CMD ["/usr/bin/bash"]
