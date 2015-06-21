Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ], }
File { owner => 0, group => 0, mode => 0644, }

class { 'apt': }

package { 'vim':
  ensure => 'installed',
}

augeas { 'disable_puppet_warning':
  context => '/files/etc/puppet/puppet.conf',
  changes => 'set main/disable_warnings deprecations',
}

class { 'apache': }
