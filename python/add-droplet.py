#!/usr/bin/python

import digitalocean
import os
import sys
import time

if len(sys.argv) < 2:
    print "usage: add-droplet.py [name] [region=sfo2] [image=ubuntu-16-04-x64] [size=512mb]"
    sys.exit(1)

# user_ssh_key = open('/Users/brunovolpato/.ssh/id_rsa.pub').read()
# key = digitalocean.SSHKey(token=os.environ["DIGITAL_OCEAN_KEY"],
#              name='brunokey',
#              public_key=user_ssh_key)
# key.create()


name = sys.argv[1];
region = sys.argv[2] if len(sys.argv) > 2 else "sfo2";
image = sys.argv[3] if len(sys.argv) > 3 else "ubuntu-16-04-x64";
size = sys.argv[4] if len(sys.argv) > 4 else "512mb";



manager = digitalocean.Manager(token=os.environ["DIGITAL_OCEAN_KEY"])
my_droplets = manager.get_all_droplets()
my_keys = manager.get_all_sshkeys()
print "Current droplets:", my_droplets
print "Current keys:", my_keys



droplet = digitalocean.Droplet(token=os.environ["DIGITAL_OCEAN_KEY"],
                               name=name,
                               region=region,
                               image=image, 
                               size_slug=size,  
                               ssh_keys=my_keys,  
                               backups=False)
droplet.create()



completed = False

while not completed:
    actions = droplet.get_actions()
    for action in actions:
        action.load()
        # Once it shows complete, droplet is up and running
        print action.status
        if action.status == "completed":
            completed = True
        else:
            time.sleep(1)



droplet = manager.get_droplet(droplet.id)

print "Created!", droplet.id, droplet.ip_address

