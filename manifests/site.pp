class { 'snmpd':
  template     => 'snmpd/snmpd.conf.erb',
  snmplocation => 'Building 4, Rack 12',
  snmpcontact  => 'noc@company.example42',
  options      => {
    'com2sec readonly default'        => 'public',
    'group MyROGroup v1'              => 'readonly',
    'group MyROGroup v2c'             => 'readonly',
    'group MyROGroup usm'             => 'readonly',
    'view all    included  .1'        => '80',
    'access MyROGroup ""'             => 'any       noauth    exact  all    none   none',
    'extend .1.3.6.1.4.1.2021.7890.1' => 'distro /usr/bin/distro # Observium: host os detection',
    'dontLogTCPWrappersConnects'      => 'true # To keep "snmpd[3458]: Connection from UDP: [127.0.0.1]:48911" from filling your logs'
  }
}