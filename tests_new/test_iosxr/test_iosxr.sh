#!/bin/sh

RETURN_CODE=0

echo "Starting tests...good luck:" \
&& echo "Cisco IOS-XR (xrv)" \
&& cd .. \
&& py.test -s -x -v test_netmiko_show.py --test_device cisco_xrv \
&& py.test -s -x -v test_netmiko_config.py --test_device cisco_xrv \
&& py.test -s -x -v test_netmiko_commit.py --test_device cisco_xrv \
&& py.test -s -x -v test_netmiko_scp.py --test_device cisco_xrv \
&& py.test -s -x -v test_netmiko_autodetect.py --test_device cisco_xrv \
|| RETURN_CODE=1

exit $RETURN_CODE

# Note, it is possible the test_netmiko_cmd_verify tests fail as you are
# attempting to do things with cmd_verify/global_cmd_verify set to False.
