class mapr::disksetup
{
notify { "Configuring disks for MapR-FS": }
exec { "disksetup":
command => "/opt/mapr/server/disksetup -F /tmp/disks.txt"
}
}
