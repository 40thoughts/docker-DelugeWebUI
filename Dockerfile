# Select the latest ubuntu image to build this container
########################################################
FROM crazybud/base-ubu-latest:latest
MAINTAINER crazyBUD

# Add needed packages
#####################
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -yq unzip unrar deluged deluge-webui

# docker settings
#################

# map /root/config to host defined config path (used to store configuration from app)
VOLUME /root/config

# map /root/data to host defined data path (used to store data from app)
VOLUME /root/data

# expose port for http : 8112
# expose port for deluge daemon : 58846
# expose port for incoming torrent data (tcp and udp) : 58946 58946/udp
EXPOSE 8112 58846 58946 58946/udp

# build deluge file system
##########################

RUN mkdir /root/data/.incomplete && mkdir /root/data/AutoAdd

# add conf file
###############

ADD .deluge.conf /etc/supervisor/conf.d/deluge.conf

# Lighten the image if possible
###############################
RUN apt-get clean && rm -rf /tmp/*

# run `supervisor`
##################
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor.conf", "-n"]
