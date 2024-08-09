# Use a Debian-based image as the base
FROM debian:latest

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Update apt repositories, upgrade dpkg, and install any dependencies required for your package
RUN apt-get update && apt-get upgrade -y dpkg && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy your Debian package into the container
COPY ./hadoop-dist/target/hadoop-3.3.6.deb /tmp/hadoop.deb

# Install your Debian package
RUN dpkg -i /tmp/hadoop.deb || apt-get install -f -y

# Optional: Run any commands to verify the installation
# RUN hadoop version

# Command to keep the container running for inspection
CMD ["bash"]