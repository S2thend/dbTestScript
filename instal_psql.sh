# add pg13 repo to yum
sudo tee /etc/yum.repos.d/pgdg.repo<<EOF
[pgdg13]
name=PostgreSQL 13 for RHEL/CentOS 7 - x86_64
baseurl=https://download.postgresql.org/pub/repos/yum/13/redhat/rhel-7-x86_64
enabled=1
gpgcheck=0
EOF
#run sys update
sudo yum update
#install psql
sudo yum install postgresql13 #postgresql13-server we don't need the server so just client