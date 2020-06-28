# Xash3d Engine Docker AARCH64
This is a Docker image which builds Xash3d engine (armhf) under a AARCH64 linux distro.

It's been used and tested under Manjaro Arm on a Pinebook Pro laptop.

## How to build
First install Docker:
```
sudo pacman -S docker
```
Then start docker service:
```
sudo systemctl start docker
```
Run `build_container.sh` to download and build the engine:
```
./build_container.sh
```
It should ask for `sudo` password (needed for Docker)

## Preparing game files
Install half life on a windows PC (or a VM).
You need the `valve` directory which is found inside the installed game.

Copy the `valve` directory inside this repository `games` directory (if it doesn't exists, you can create it)

Take a look inside the copied `valve` directory, you should see a file called `liblist.gam`, open it using a normal text editor and make this modification (if needed):

```
gamedll_linux "dlls/hl_i386.so"
```
To:
```
gamedll_linux "dlls/hl.so"
```

## Running the game
You can now launch the `run_container.sh` script:
```
./run-container.sh
```

It will drop you into a root shell (inside the Docker container)

If it is the first time you launch the game, run `./prepare_game.sh` (from inside the Docker container).

From here you can test that opengl is working by running `glxgears`, you can use `alsamixer` to change audio levels (they are separate from your distro audio levels and they start at **MAX** so beware).

When you're ready just launch `./launch.sh` to start the game.

When finished, exit the game, and then type `exit` to close the Docker container.

Theese are just the steps i followed to have a running Xash3d engine with Half Life, this is in **no way** a complete and working guide, try it and let me know.

If someone wants to fork this repo and make a better "self working" installer, be my guest!
