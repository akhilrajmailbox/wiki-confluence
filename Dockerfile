from ubuntu:14.04
maintainer akhilrajmailbox@gmail.com


run apt-get update && apt-get -y upgrade && apt-get -y install wget nano git
workdir /confluence
run wget https://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-5.10.4-x64.bin
run chmod a+x atlassian-confluence-5.10.4-x64.bin
run git clone -b wiki-confluence https://github.com/akhilrajmailbox/wiki-confluence.git
run cp /confluence/wiki-confluence/varfile /confluence/
run ./atlassian-confluence-5.10.4-x64.bin  -q -varfile varfile
run cp /confluence/wiki-confluence/mysql-connector-java-5.1.38-bin.jar /opt/atlassian/confluence/confluence/WEB-INF/lib/
workdir /opt/atlassian/confluence/
expose 8090
entrypoint service confluence restart && tailf /var/log/apt/history.log && bash
