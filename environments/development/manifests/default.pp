node default {
  exec { "apt-get update":
    path => "/usr/bin",
  }
  include stdlib
  include myaccount
  #include chrome
  include vscode
}
