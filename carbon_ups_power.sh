#!/bin/bash
# Script to monitor UPS, logs into carbon and shuts it down if UPS battery too low
# In carbon sudoers, added line: vania ALL=(ALL) NOPASSWD: /sbin/shutdown


BC=$(apcaccess | grep BCHARGE | cut -d' ' -f 4)
BC=${BC%.*}
BC=$(($BC + 0))

echo Battery: $BC

if [ $BC -lt 50 ]
then
        echo "shutting down carbon due to power loss, battery running low"
        ssh -t vania@carbon -T <<\EOF
        say Shutting down due to power loss.
        sudo shutdown -h now "UPS power lost."
        # sudo shutdown -t 30 "UPS power loss"
EOF
else
        echo "Power on, all is okay"
fi
