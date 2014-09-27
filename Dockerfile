# Select the latest ubuntu image to build this container
########################################################
FROM crazybud/base-ubu-latest:latest
MAINTAINER crazyBUD

# Add needed packages
#####################
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq unzip unrar deluged deluge-webui

# docker settings
#################

# map /root/config to host defined config path (used to store configuration from app)
VOLUME /root/config

# map /root/data to host defined data path (used to store data from app)
VOLUME /root/data

# expose port for http
EXPOSE 8112

# expose port for deluge daemon
EXPOSE 58846

# expose port for incoming torrent data (tcp and udp)
EXPOSE 58946
EXPOSE 58946/udp

# build deluge file system
##########################

RUN mkdir /root/data/.incomplete
RUN mkdir /root/data/AutoAdd

# add conf file
###############

ADD .deluge.conf /etc/supervisor/conf.d/deluge.conf

# Lighten the image if possible
###############################
RUN apt-get clean
RUN rm -rf /tmp/*

# run `supervisor`
##################
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor.conf", "-n"]
