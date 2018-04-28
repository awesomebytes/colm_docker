# Environment to reproduce 32bits colm compiling error
Note that it needs more than 5GB of free disk space to pull it.
You also can't be running any Virtual Machine at the same time (VirtualBox at least) or the qemu emulator in the Docker won't be able to start.


# Build

```bash
docker build -t colm_environment .
```
# Run

```bash
docker run --privileged -v $HOME:/shared -it colm_environment
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
