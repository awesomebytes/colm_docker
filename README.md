# Environment to reproduce 32bits colm compiling error
Note that it needs more than **5GB** of free disk space to pull it.

You also **can't be running any Virtual Machine at the same time** (VirtualBox at least) or the qemu emulator in the Docker won't be able to start (see `Error on start` at the bottom of this README).

My host system had `virtualbox-5.2` installed, which may pull some  virtualization related dependencies to make this docker image work... if it doesn't work, you may need to install those.


# Pull the image
```bash
docker pull awesomebytes/colm_environment:1
```

# Run

```bash
docker run --privileged -v $HOME:/shared -it awesomebytes/colm_environment:1
```

Start the VM with the environment:
```bash
# This starts the qemu VM, takes 1min30s for me
./COLM-start

# IMPORTANT!!!!! login into the user when you are in the VM shell, the prompt looks like:
# sh-4.4#
su - abuild
# Now the prompt looks like:
# abuild@localhost:~>

# now go for business
cd ~/rpmbuild/BUILD/colm-0.13.0.5
make clean
./configure
make

# Wait a minute and you'll get:
# ./bootstrap1 -c -o gen/parse2.c -e gen/if2.h -x gen/if2.cc colm.lm
# bootstrap1: tree.c:953: colm_tree_downref: Assertion `tree->refs > 0' failed.
```


# Build if you prefer
You can also build the image yourself, it will take a while as it needs
to download a 4GB file and download & install 200mb worth of ubuntu packages.

```bash
docker build -t colm_environment .
```

Then your run command will be instead:

```bash
docker run --privileged -v $HOME:/shared -it colm_environment
```


# Error on start
The error in that case is:

```
ioctl(KVM_CREATE_VM) failed: 16 Device or resource busy
failed to initialize KVM: Device or resource busy
```