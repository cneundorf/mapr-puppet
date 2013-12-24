class mapr::configure
{
#case $::osfamily {
#        RedHat, Linux: {
#            file { '/etc/alternatives/java':
#                ensure  => link,
#                target  => "${java_home}/bin/java",
#                require => Exec['extract_jdk'],
#            }
##    if ( $version == '6' ) {
#        exec { 'extract_jdk':
#            cwd     => "${install_dir}/",
#            command => "${install_dir}/${installerFilename}",
#            creates => $java_home,
#            require => File["${install_dir}/${installerFilename}"],
#        }
#    }
#o
##

$cluster_name = 'my.cluster.com'
$cldb_list = node05
$zk_list = node05

notify { "Configuring MapR running configure.sh": }
exec { "configure":
command => "/opt/mapr/server/configure.sh -C $cldb_list -Z $zk_list -N $cluster_name"
}


#configure.sh is a tool to configure nodes in a MapR cluster and is
#run on all nodes
#
##Usage: 
#--isvm   If it is a Virtual Maschine 
#
###configure.sh  -C cldb_list  -Z zookeeper_list  [args]
##configure.sh  -C cldb_list -M cldb_mh_list [-M cldb_mh_list ...] -Z zookeeper_list  [args]
##configure.sh  client_only_mode  [refresh_roles] [args]
#configure.sh  refresh_roles  [client_only_mode] [args]
##
##Options:
##
##cldb_list        : hostname[:port_no] [,hostname[:port_no] ...]
##                   a list of CLDB nodes which this machine should use 
##                   to connect to the MapR cluster, 
#                   use this option only when CLDB servers have 
##                   a single IP/hostname assigned to them 
##cldb_mh_list     : nodeBeth0[:port_no][,[nodeBeth1[:port_no] ...]
###                   a list of hostnames/IP addresses 
#                   which this machine should use to connect 
#                   to a specific CLDB server in the MapR cluster, 
#                   use this option to specify each CLDB server 
#                   which is assigned more than one hostname/IP address 
#
#zookeeper_list   : hostname[:port_no] [,hostname[:port_no] ...]
#client_only_mode : -c -C cldb_list [-Z zookeeper_list]
#refresh_roles    : -R [-C cldb_list] [-Z zookeeper_list]
#
##args is a combination of   :
##
##    -N  <cluster_name>     - name of the cluster
##                             default: "my.cluster.com"
##    -d  <hostname:port_no> - address of the database to connect to
##                             default: None
##   -du <username>         - user account to use to connect to the database
##                             default: None
##    -dp <password>         - password of the database user account
##                             default: None
##    -ds <schema>           - database schema to be used
##                             default: metrics
##    -u  <username>         - user name to run the mapr services
##                             on the node. This can also be specified
##                             using ${MAPR_USER}. Deafult is "mapr"
##    -g  <groupname>        - group name which is the default group of 
##                             ${MAPR_USER} who runs mapr services
##    --create-user | -a     - create the local user ${MAPR_USER} with
##                             which the mapr services run
##    -U  <uid>              - user id to use if unix account ${MAPR_USER}
##                             has to be created. corresponds to -u/--uid
##                             option of "useradd" command in unix
##                             default: picked by the operating system
##    -G  <gid>              - group name or the number to use if unix account
##                             ${MAPR_USER} has to be created. corresponds to
##                             -g/--gid option of "useradd" command in unix
##                             default: picked by the operating system
##    -J  <port_no>          - cldb jmx port number
##                             default: 7220
##    -L  <logfile_name>     - alternative to the default log file
##                             default: /opt/mapr/logs/configure.log
##    -f                     - configure the node without the check of sytem
##                             configuration
##    -M7                    - configure mfs memory for M7 usage
##
##
##Environment Variables:
#
##MAPR_USER: the user for whom the node is configured
##           default: "mapr".
#           The user account is created if it does not exist
##MAPR_HOME: root directory of installation and configuration info
##           default: /opt/mapr
##
########
}
