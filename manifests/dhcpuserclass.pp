# Create an dnsmasq dhcp option (--dhcp-option).
define dnsmasq::userclass (
  $user_class,
  $set = undef,
) {
  $set_real = $set ? {
    undef   => '',
    default => "set:${set},",
  }

  include dnsmasq

  concat::fragment { "dnsmasq-dhcpoption-${name}":
    order   => '12',
    target  => 'dnsmasq.conf',
    content => template('dnsmasq/userclass.erb'),
  }

}
