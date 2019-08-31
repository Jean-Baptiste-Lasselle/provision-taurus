#!/bin/bash
sudo docker run -it --rm -v /home/jibl/provision-taurus/taurus-bzt-config:/bzt-configs blazemeter/taurus config.yml
