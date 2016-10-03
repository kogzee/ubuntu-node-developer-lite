class vscode {
  package { "code":
    provider => dpkg,
    ensure => installed,
    source => "/tmp/code_1.5.3-1474533365_amd64.deb",
    require => File[tmp-code]
  }

  file {"tmp-code":
    name => "/tmp/code_1.5.3-1474533365_amd64.deb",
    owner => root,  
    group => root,
    source => "puppet:///modules/vscode/code_1.5.3-1474533365_amd64.deb"
  }
}