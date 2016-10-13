class myaccount {

  if(!defined(Package['git'])) {
    package {
      'git':
        ensure => present;
    }
  }

  ensure_resource('package',
                    ['curl',
                    'build-essential',# solves error when running npm install
                    ],
                    { 'ensure' => 'present'
                    })




  exec {
    'nodesource':
      command => 'curl --silent --location https://deb.nodesource.com/setup_4.x | bash -',
      path    => ['/bin', '/usr/bin'],
      unless  => 'grep -r /etc/apt/sources.list.d/ -e "node_4.x"',
      require => Package['curl'],
      notify  => Exec['apt-get update'];
  }

  ensure_resource('package',
                    ['nodejs', # cloud server - will include npm
                    ],
                    { 'ensure' => 'present', 'require' => 'Exec[nodesource]'
                    })


  ensure_resource('package',
                  ['lite-server',# Web client
                  'grunt'      # Web client
                  ],
                  { 'provider' => 'npm',
                  'ensure' => 'present',
                  'require' => 'Package[nodejs]'
                  }
  )

   ensure_resource('package',
                    ['mongodb-org=3.2.10',# cloud server
                    'mongodb-org-server=3.2.10',# cloud server
                    'mongodb-org-shell=3.2.10',# cloud server
                    'mongodb-org-mongos=3.2.10',# cloud server
                    'mongodb-org-tools=3.2.10',# cloud server
                    ],
                    { 'ensure' => 'present', 'require' => 'Exec[apt-get update]', 'install_options' => '--force-yes'
                    })

  file {
    '/etc/apt/sources.list.d/mongodb.list':
      source  => 'puppet:///modules/myaccount/mongodb.list',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      require => Apt::Key['mongodb'],
      notify  => Exec['apt-get update'];
  }


  apt::key {
    'mongodb':
      key        => 'EA312927',
      key_server => 'hkp://keyserver.ubuntu.com:80';
  }

  user {
    'myaccount':
      ensure     => present,
      shell      => '/bin/bash',
      home       => '/home/myaccount',
      managehome => 'yes',
      # password is myaccount, generated with openssl passwd -1 myaccount
      password   => '$1$NUEqnKvH$j.oNAabDwkUSprkKtb1At/';
  }

  file {
    '/etc/sudoers.d/myaccount':
    source => 'puppet:///modules/myaccount/sudoers',
    owner => 'root',
    group => 'root',
    mode => '0644';
  }

  file {
    '/home/myaccount':
      ensure  => directory,
      owner   => 'myaccount',
      group   => 'myaccount',
      mode    => '0755',
      require => User['myaccount'];
    '/home/myaccount/.ssh':
      ensure  => directory,
      owner   => 'myaccount',
      group   => 'myaccount',
      mode    => '0700',
      require => User['myaccount'];
  }

  file { ['/data', '/data/db']:
    ensure => 'directory',
    owner   => 'myaccount',
    group   => 'myaccount',
    mode    => '0777',
    require => User['myaccount'];
  }

  class { '::ruby':
      gems_version => 'latest',
      before => Package['sass'];
  }

  package { 'sass':
    ensure   => 'installed',
    provider => 'gem';
  }

  exec { 'npm update':
    command => 'npm update -g',
    user => 'root',
    path    => ['/usr/local/node/node-default/bin', '/bin', '/usr/bin'],
    require => Package['nodejs'];
  }
}
