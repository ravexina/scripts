#!/usr/bin/env python

import getpass
from stem import Signal
from stem.control import Controller

print("Enter control port passphrase:")
pw = getpass.getpass()

with Controller.from_port(port = 9051) as controller:
    controller.authenticate(pw)
    controller.signal(Signal.NEWNYM)
    print('Done!')
