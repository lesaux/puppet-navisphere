class navisphere {

  case $::osfamily {
    'Debian': {
      file { '/tmp/NaviCLI-Linux-64-x86-en_US-7.30.15.0.44-2_amd64.deb':
        ensure   => file,
        source   => 'puppet:///modules/navisphere/NaviCLI-Linux-64-x86-en_US-7.30.15.0.44-2_amd64.deb',
        owner    => root,
        group    => root,
      }->
      package { 'navicli-linux-64-x86-en-us':
        ensure   => installed,
        provider => dpkg,
        source   => '/tmp/NaviCLI-Linux-64-x86-en_US-7.30.15.0.44-2_amd64.deb',
      }
    }
    'RedHat': {
      file { '/tmp/NaviCLI-Linux-64-x86-en_US-7.30.15.0.44-1.x86_64.rpm':
        ensure   => file,
        source   => 'puppet:///modules/navisphere/NaviCLI-Linux-64-x86-en_US-7.30.15.0.44-1.x86_64.rpm',
        owner    => root,
        group    => root,
      }->
      ensure_packages(['glibc.i686','nss-softokn-freebl.i686','nss-softokn-freebl.x86_64'])
      package { 'NaviCLI-Linux-64-x86-en_US-7.30.15.0.44-1':
        ensure   => installed,
        provider => yum,
        source   => '/tmp/NaviCLI-Linux-64-x86-en_US-7.30.15.0.44-1.x86_64.rpm',
      }
    }
    default: {
      fail('The module does not support this OS.')
    }
  }

}
