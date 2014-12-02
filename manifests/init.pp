class navisphere {

  case $::osfamily {
    'Debian': {
      file { '/tmp/NaviCLI-Linux-64-x86-en_US-7.30.15.0.44-2_amd64.deb':
        ensure   => file,
        source   => 'puppet:///modules/navisphere/NaviCLI-Linux-64-x86-en_US-7.30.15.0.44-2_amd64.deb',
        owner    => root,
        group    => root,
      }->
      package { 'NaviCLI-Linux-64-x86-en_US-7.30.15.0.44-2':
        ensure   => installed,
        provider => dpkg,
        source   => '/tmp/NaviCLI-Linux-64-x86-en_US-7.30.15.0.44-2_amd64.deb',
        unless   => '/usr/bin/test -d /opt/Navisphere/bin/naviseccli',
      }
    }
    'RedHat': {
      file { '/tmp/NaviCLI-Linux-64-x86-en_US-7.30.15.0.44-1.x86_64.rpm':
        ensure   => file,
        source   => 'puppet:///modules/navisphere/NaviCLI-Linux-64-x86-en_US-7.30.15.0.44-1.x86_64.rpm',
        owner    => root,
        group    => root,
      }->
      package { 'NaviCLI-Linux-64-x86-en_US-7.30.15.0.44-1':
        ensure   => installed,
        provider => rpm,
        source   => '/tmp/NaviCLI-Linux-64-x86-en_US-7.30.15.0.44-1.x86_64.rpm',
        unless   => '/usr/bin/test -d /opt/Navisphere/bin/naviseccli',
      }
    }
    default: {
      fail('The module does not support this OS.')
    }
  }

}
