# DelugeWebUI

The purpose of the DelugeWebUI image is to provide you a seedbox by using deluge and it's webserver for a simple use.

## Quick Start

* Run this command to download and set the container (just replace <DATAPATH> and <CONFIGPATH> by your real path in the host system).

        sudo docker run -d -p 8112:8112 -p 58846:58846 -p 58946:58946 --name=deluge -v <DATAPATH>:/data -v <CONFIGPATH>:/config -v /etc/localtime:/etc/localtime:ro crazybud/delugewebui
