class navisphere {

  case $::osfamily {
    'Debian': {
      file { '/tmp/NaviCLI-Linux-64-x86-en_US-7.30.15.0.44-2_amd64.deb':
        ensure   => file,
        source   => 'puppet:///modules/navisphere/NaviCLI-Linux-64-x86-en_US-7.30.15.0.44-2_amd64.deb',
        owner    => root,
        group    => root,
      }->
      package { 'navisphere':
        ensure   => installed,
        provider => dpkg,
        source   => '/tmp/NaviCLI-Linux-64-x86-en_US-7.30.15.0.44-2_amd64.deb'
      }
    }
    'RedHat': {
      file { '/tmp/NaviCLI-Linux-64-x86-en_US-7.30.15.0.44-1.x86_64.rpm':
        ensure   => file,
        source   => 'puppet:///modules/navisphere/NaviCLI-Linux-64-x86-en_US-7.30.15.0.44-1.x86_64.rpm',
        owner    => root,
        group    => root,
      }->
      package { 'navisphere':
        ensure   => installed,
        provider => dpkg,
        source   => '/tmp/NaviCLI-Linux-64-x86-en_US-7.30.15.0.44-1.x86_64.rpm'
      }
    }
    default: {
      fail('The module does not support this OS.')
    }
  }

}
