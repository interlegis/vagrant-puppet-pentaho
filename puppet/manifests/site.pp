$pentaho_dir = '/srv/sigi'

include apt

apt::key { 'webupd8team':
  key => "EEA14886",
  key_server => "keyserver.ubuntu.com",
}

apt::ppa { 'ppa:webupd8team/java':
  require => Apt::Key["webupd8team"],
}

exec {
  'set-licence-selected':
  command => '/bin/echo debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections';

  'set-licence-seen':
  command => '/bin/echo debconf shared/accepted-oracle-license-v1-1 seen true | /usr/bin/debconf-set-selections';
}

package { 'oracle-java7-installer':
  ensure => present,
  require => [
    Apt::Ppa["ppa:webupd8team/java"],
    Exec['set-licence-selected'],
    Exec['set-licence-seen'],
  ],
}
