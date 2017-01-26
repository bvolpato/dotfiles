#!/usr/bin/python

import digitalocean
import os
import sys
import time

name = sys.argv[1];

manager = digitalocean.Manager(token=os.environ["DIGITAL_OCEAN_KEY"])
my_droplets = manager.get_all_droplets()
print "Current droplets:", my_droplets



for droplet in my_droplets:
    if droplet.name == name:
        droplet.destroy()
        print "Deleted!", droplet.id, droplet.ip_address


