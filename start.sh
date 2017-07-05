#!/bin/bash
chmod -R 755 /etc/haproxy/
if [[ ! -f /etc/haproxy/haproxy.cfg ]];then
echo ""
echo "'haproxy.cfg' file is not found under '/etc/haproxy/'"
echo "Aborting.......!"
echo ""
exit 0
else
cp -r /root/haproxy.cfg-org /etc/haproxy/haproxy.cfg-org

if [[ ! -d /etc/haproxy/errors ]];then
cp -r /root/error /etc/haproxy/errors
fi

if [[ ! -d /etc/haproxy/real-conf ]];then
cp -r /root/real-conf /etc/haproxy/
fi

chmod -R 755 /etc/haproxy/
service haproxy restart
tailf /root/start.sh
fi
