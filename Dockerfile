# Use an official Python runtime as a parent image
FROM ubuntu:20.04

# create the user 'tuto' with password 'tutorial', and grant sudo privilege
# RUN useradd --home /home/tuto/ --create-home --shell /bin/bash --password $(echo 'tutorial' | openssl passwd -1 -stdin) tuto
# RUN useradd --home /home/tuto/ --create-home --shell /bin/bash --password $1$DCAWy5p7$NuOQUajtuxa5yQqHQa6iU.  tuto

# RUN usermod -aG sudo tuto

# install docker
RUN apt-get update
RUN apt-get install -y docker.io
RUN systemctl enable docker && systemctl start docker
RUN usermod -aG docker tuto

# install jupyter
#RUN apt-get install -y python3-pip
RUN pip install jupyterlab notebook

# install bash kernel for jupyter
RUN pip install bash_kernel
RUN python3 -m bash_kernel.install



# Set the working directory to /learn-docker
WORKDIR /learn-docker

# Copy the current directory contents into the container at /app
# ADD . /app

# Make port 8888 available to the world outside this container
# EXPOSE 8888

# Run jupyter when the container launches
# RUN su tuto
CMD ["jupyter", "notebook"]
