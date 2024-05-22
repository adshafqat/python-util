# Use the Red Hat Universal Base Image 8 with Python 3.12
FROM registry.access.redhat.com/ubi8/python-312

# Switch to the root user to install packages
USER root

# Install system packages
RUN yum -y update && \
    yum -y install \
    vim \
    openldap-clients && \
    yum clean all

# Install Python packages
RUN pip install --no-cache-dir \
    pyyaml \
    yq \
    requests

# Set the default command to start the container
CMD ["/bin/bash"]