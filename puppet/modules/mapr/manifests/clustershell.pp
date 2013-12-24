class mapr::clustershell
{
  notify {"Install clustershell.":}
  package { 'clustershell':
  	ensure => installed,
  }
  notify {"Configure clustershell.":}

}

$all = "node03"
$cldb = "node03"
$zk = "node03"
$jt = "node03"
$tt = "node03"

file { "/etc/clustershell/groups":
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        content => template('/etc/puppet/modules/mapr/templates/groups.erb'),
}


# TODO: move this to shared lib?
#3def get_nodes_with_role_sp(role)
#    nodes = []
#    if role == ""
#      role = "all"
#    end
#    role_nodes = node[:mapr][:groups][role]
#
#    role_nodes.each do |n|
#      nodes.push(n)
#    end
#
#    nodes.reject(&:empty?).join(' ')
#end
#
#if platform?("redhat", "centos")
###  include_recipe "yum::epel"
#end
##
#package "clustershell"
#
#all = get_nodes_with_role_sp("all")
#cldb = get_nodes_with_role_sp("cldb")
#zk = get_nodes_with_role_sp("zk")
##jt = get_nodes_with_role_sp("jt")
#tt = get_nodes_with_role_sp("tt")
#
## groups file
#template "/etc/clustershell/groups" do
#  source "clustershell.groups.erb"
#  variables({
#    :all => all,
#    :cldb => cldb,
#    :zk => zk,
#    :jt => jt,
#    :tt => tt,
#  })
#  mode 0644
#end
##
