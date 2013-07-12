class coi::profiles::openstack::allinone (
  $controller_node_public   = hiera('controller_node_public'),
  $controller_node_internal = hiera('controller_node_internal'),
  $external_interface       = hiera('external_interface', eth1),
  $public_interface         = hiera('public_interface', eth0),
  $external_bridge          = hiera('external_bridge'),
  $verbose                  = hiera('verbose', false),

  $mysql_root_password      = hiera('mysql_root_password'),
  $db_host                  = hiera('controller_node_internal'),

  # admin parameters
  $admin_email              = hiera('admin_email'),
  $admin_password           = hiera('admin_password'),
  # keystone params
  $keystone_db_password     = hiera('keystone_db_password'),
  $keystone_admin_token     = hiera('keystone_admin_token'),
  # glance params
  $glance_db_password       = hiera('glance_db_password'),
  $glance_user_password     = hiera('glance_user_password'),
  $glance_backend           = hiera('glance_backend', 'file'),
  # nova params
  $nova_db_password         = hiera('nova_db_password'),
  $nova_user_password       = hiera('nova_user_password'),
  # rabbit params
  $rabbit_password          = hiera('rabbit_password'),
  $rabbit_user              = hiera('rabbit_user', 'openstack'),
  # quantum variables
  $quantum_db_password      = hiera('quantum_db_password'),
  $quantum_user_password    = hiera('quantum_user_password'),
  # these default to true
  $enable_dhcp_agent        = hiera('enable_dhcp_agent', true),
  $enable_l3_agent          = hiera('enable_l3_agent', true),
  $enable_metadata_agent    = hiera('enable_metadata_agent', true),
  $enable_ovs_agent         = hiera('enable_ovs_agent', true),
  # Metadata Configuration
  $metadata_shared_secret   = hiera('metadata_shared_secret'),
  # ovs config
  $tunnel_ip                = hiera('tunnel_ip'),
  # horizon
  $horizon_secret_key       = hiera('horizon_secret_key'),
  # cinder
  $cinder_user_password     = hiera('cinder_user_password'),
  $cinder_db_password       = hiera('cinder_db_password'),
  $external_interface       = hiera('external_interface'),
  $auto_assign_floating_ip  = hiera('auto_assign_floating_ip', false),
  $multi_host               = true,
  $swift                    = hiera('swift', false),
  $swift_user_password      = hiera('swift_user_password', false),
  $swift_public_address     = hiera('swift_public_address', false),
  $internal_address         = hiera('internal_ip'),
  $libvirt_type             = hiera('libvirt_type', 'kvm'),
  $multi_host               = hiera('multi_host', true),
  # TODO
  # this is only here b/c special permissions need to be added when we
  # use the packages from cisco's repo. This should just be here
  # temporarily until cisco updates to use the same version of
  # the libvirt package as upstream
  $package_repo             = hiera('package_repo', 'cisco_repo')
) inherits coi::profiles::openstack::base {
  
  class { 'openstack::all':
    public_address => $controller_node_public,
    public_interface => $public_interface,
    internal_address => $controller_node_internal,
    bridge_interface => $external_interface,
    mysql_root_password => $mysql_root_password,
    db_host => $db_host,
    admin_email => $admin_email,
    admin_password => $admin_password,
    rabbit_password => $rabbit_password,
    keystone_db_password => $keystone_db_password,
    keystone_admin_token => $keystone_admin_token,
    glance_db_password => $glance_db_password,
    glance_user_password => $glance_user_password,
    cinder_user_password => $cinder_user_password,
    cinder_db_password => $cinder_db_password,
    quantum_db_password => $quantum_db_password,
    quantum_user_password => $quantum_user_password,
    enable_dhcp_agent        => $enable_dhcp_agent,
    enable_l3_agent          => $enable_l3_agent,
    enable_metadata_agent    => $enable_metadata_agent,
    enable_ovs_agent         => $enable_ovs_agent,
    metadata_shared_secret   => $metadata_shared_secret,
    ovs_local_ip             => $tunnel_ip,
    nova_db_password => $nova_db_password,
    nova_user_password => $nova_user_password,
    secret_key => $horizon_secret_key,
  }
   

}
