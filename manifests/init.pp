class pacemaker {
    if ($::osfamily == 'RedHat') {
        if (versioncmp('6.4', $::operatingsystemrelease) != 1 ) {
            # Starting from 6.4 the crm command isn't included: use crmsh package.
            $reqpkgs = ['pacemaker', 'resource-agents', 'crmsh']
        } else {
            $reqpkgs = ['pacemaker', 'resource-agents']
        }
    } else {
        # Better add other operating systems, but this'll do for now
        $reqpkgs = ['pacemaker', 'resource-agents']
    }

    anchor {
        'pacemaker::begin':
            require => Package[$reqpkgs],
    }

    package {
        $reqpkgs:
            ensure  => installed;
    }
}
