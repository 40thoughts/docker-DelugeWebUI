# DelugeWebUI

The purpose of the DelugeWebUI image is to provide you a seedbox by using `deluge` and it's webserver for a simple use.

## Table of contents

- [Setup](#setup)
- [Run](#run)
- [Have fun](#have-fun)

## Setup

For the first run, before to use the seedbox, we need to download the configuration file for `deluge` and it's tools.

To make sure you you see the variables to adapt according to your host system, I typed them into brackets.
e.g. : Replace `[CONFIGPATH]` by `/home/yourname/deluge/config` and `[DATAPATH]` by `/home/yourname/deluge/data`.

* First, we're gonna need a folder to store all the configuration files from `deluge`.

        mkdir [CONFIGPATH]

* Then we need to download the core.conf file from the repository.

        wget https://raw.githubusercontent.com/40thoughts/docker-DelugeWebUI/master/.config/core.conf -O [CONFIGPATH]/core.conf

* You can also do it manually by creating the `[CONFIGPATH]` folder and downloading [this file](https://raw.githubusercontent.com/40thoughts/docker-DelugeWebUI/master/.config/core.conf) in it.

## Run

* After doing the initial setup explained before, now, and for the further uses, just run this command-line to start the container.

        sudo docker run -d -p 8112:8112 -p 58846:58846 -p 58946:58946 --name=deluge -v [DATAPATH]:/data -v [CONFIGPATH]:/config -v /etc/localtime:/etc/localtime:ro crazybud/delugewebui

## Have fun

And now, open your navigator and type this in the adress bar : `http://<host ip>:8112`.<br/>
If you installed this container on your desktop just type `http://localhost:8112` or [click here](http://localhost:8112)

Default password is `deluge`.

That's it !!!
