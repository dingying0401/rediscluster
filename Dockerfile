FROM rainf/rediscluster:4.0.2
COPY cluster.sh /root/cluster.sh
COPY expect.sh /root/expect.sh
RUN apt-get update && apt-get -y install tcl tk expect
ENTRYPOINT ["/root/expect.sh"]
