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

# map /config to host defined config path (used to store configuration from app)
VOLUME /config

# map /data to host defined data path (used to store data from app)
VOLUME /data

# expose port for http
EXPOSE 8112

# expose port for deluge daemon
EXPOSE 58846

# expose port for incoming torrent data (tcp and udp)
EXPOSE 58946
EXPOSE 58946/udp

# set permissions
#################

# change owner
RUN chown nobody:users /usr/bin/deluged /usr/bin/deluge-web /root

# set permissions
RUN chmod 775 /usr/bin/deluged /usr/bin/deluge-web /root

# add conf file
###############

ADD .deluge.conf /etc/supervisor/conf.d/deluge.conf

# Lighten the image if possible
###############################
RUN apt-get clean
RUN rm -rf /tmp/*

# run `supervisor`
##################
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/deluge.conf", "-n"]
