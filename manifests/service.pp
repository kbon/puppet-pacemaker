class pacemaker::service( $ensure='running',
                          $enable=true) {
  include pacemaker
  service { 'pacemaker':
                      ensure     => $ensure,
                      enable     => $enable,
                      hasstatus  => true,
                      hasrestart => true,
                      require    => [ Anchor['pacemaker::begin'] ],
  }

}
