FROM centos:7

# Install required packages
RUN yum -y update && \
    yum -y install java-11-openjdk-devel.x86_64 wget

# Download and extract Atlassian Crowd
RUN cd /opt && \
    wget https://www.atlassian.com/software/crowd/downloads/binary/atlassian-crowd-5.1.2.tar.gz -O crowd.tar.gz && \
    tar -xzf crowd.tar.gz -C ./ && \
    mv atlassian-crowd-* crowd && \
    rm crowd.tar.gz


# Set up the Crowd home directory
RUN mkdir -p /var/crowd-home && \
    chmod -R 777 /var/crowd-home

RUN echo "crowd.home=/var/crowd-home" >> /opt/crowd/crowd-webapp/WEB-INF/classes/crowd-init.properties

# Expose the HTTP and HTTPS ports
EXPOSE 8095 8096

# Start Atlassian Crowd
CMD ["/opt/crowd/start_crowd.sh", "-fg"]

