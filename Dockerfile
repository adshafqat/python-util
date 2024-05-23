# Use Red Hat Universal Base Image as the base image
FROM registry.access.redhat.com/ubi8/ubi

# Install necessary system packages
RUN yum update -y && \
    yum install -y python3 python3-pip openldap-clients vim bash && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    ln -s /usr/bin/pip3 /usr/bin/pip && \
    yum clean all

# Install Python packages
RUN python -m pip install --upgrade pip && \
    python -m pip install pyyaml yq requests

# Set default command to bash
CMD ["bash"]