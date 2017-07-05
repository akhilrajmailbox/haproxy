from akhilrajmailbox/ubuntu:14.04
maintainer Akhil Raj <akhilrajmailbox@gmail.com>
run apt-get update && apt-get upgrade -y && apt-get install -y nano sudo wget curl \
	&& apt-get install software-properties-common -y && add-apt-repository ppa:vbernat/haproxy-1.6 -y \
	&& apt-get update && apt-get install haproxy -y

run add-apt-repository ppa:certbot/certbot -y && apt-get update && apt-get install certbot -y

run cp /etc/haproxy/haproxy.cfg /root/haproxy.cfg-org
run cp -r /etc/haproxy/errors /root/error
run sh -c 'echo "ENABLED=1" >> /etc/default/haproxy'


expose 80 443 5432 54321
copy start.sh /root/start.sh
copy real-conf /root/real-conf
run chmod 777 /root/start.sh
entrypoint "/root/start.sh"
