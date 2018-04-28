FROM ubuntu:16.04

# Install basic stuff
RUN apt-get update
RUN apt-get install build-essential autoconf automake -y
RUN apt-get install vim nano emacs less wget curl -y

# Get the reproduceable environment
WORKDIR /tmp
RUN wget http://inai.de/files/colm/COLM-img
RUN wget http://inai.de/files/colm/COLM-initrd
RUN wget http://inai.de/files/colm/COLM-kernel
RUN wget http://inai.de/files/colm/COLM-start
RUN chmod +x COLM-start

# Install the tools to make this image run
RUN apt-get install qemu-system-x86 qemu-kvm -y

# Start the environment
ENTRYPOINT ["/bin/bash"]
