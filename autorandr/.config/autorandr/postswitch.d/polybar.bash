#!/usr/bin/env bash

# This script restarts the polybar service after the monitor is connected. This
# is necessary, as polybar will not automatically reconfigure itself for the new
# monitor.

systemctl --user restart polybar.service
