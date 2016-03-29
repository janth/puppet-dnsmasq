# Create an dnsmasq dhcp option (--dhcp-option).
define dnsmasq::userclass (
  $user_class,
  $tag = undef,
) {
  $tag_real = $tag ? {
    undef   => '',
    default => $tag,
  }

  include dnsmasq

  concat::fragment { "dnsmasq-dhcpoption-${name}":
    order   => '12',
    target  => 'dnsmasq.conf',
    content => template('dnsmasq/dhcpuserclass.erb'),
  }

}
