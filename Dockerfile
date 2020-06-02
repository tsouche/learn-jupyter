# Use an official Python runtime as a parent image
FROM ubuntu:20.04

# create the user 'tuto' with password 'tutorial', and grant sudo privilege
# RUN useradd --home /home/tuto/ --create-home --shell /bin/bash --password $(echo 'tutorial' | openssl passwd -1 -stdin) tuto
RUN useradd --home /home/tuto/ --create-home --shell /bin/bash --password $1$DCAWy5p7$NuOQUajtuxa5yQqHQa6iU.  tuto

RUN usermod -aG sudo tuto

# install docker
RUN apt-get update
RUN apt install -y docker.io
#RUN systemctl enable --now docker
RUN usermod -aG docker tuto

# install jupyter

# Set the working directory to /app
# WORKDIR /app

# Copy the current directory contents into the container at /app
# ADD . /app

# Install any needed packages specified in requirements.txt
# RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Make port 80 available to the world outside this container
# EXPOSE 80

# Define environment variable
# ENV NAME World

# Run app.py when the container launches
RUN su tuto
CMD ["/bin/bash"]
