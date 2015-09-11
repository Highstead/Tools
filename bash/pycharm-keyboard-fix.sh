#!/bin/bash

# Kill the ibusx-x11 process.  This fixes an issue where pycharm stops 
#  responding to the keyboard.  May exist in other JetBrains Products.
killall -9 ibus-x11