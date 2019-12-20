# DEVENV for DGX

Quick and dirty deep learing environment in Docker for a shared DGX type of 
server.

It is set-up in a way to allow it to work as a local environment in Google 
Colab.

Unfortunately that means it is completely in secure.  Do not run this on a 
machine exposed to the internet.

## Logging in

You must use SSH port forwarding to access the DGX from Colab.  Before
running the following commands be sure to log in using a command like:

```bash
ssh -p PORT username@dgx-server -L8888:localhost:8888
```

replace PORT and 8888 with the ports you were assigned.

## Building

Edit the Dockerfile and replace the port for jupyter with the port you are
assigned because Colab expects the port number to be the same.

Be sure to name the container using your username.  For example devenv-wmeddie.

```bash
sudo docker build -t local/devenv-username:0.1 .
```

## Running

SSH into the DGX and turn on port forwarding 
Run the run.sh script to start the container.

```bash
sudo ./run.sh --port 8888 --data /mnt/data1 --gpu 0 --name username
```
