# gluon-packages
custom ffmuc packages feed for gluon

State of the different packages:

- gluon-domain-migration-ffmuc
  - Migrates from multisite config to multidomain config

- tecff-ath9k-broken-wifi-workaround
  - tries to recover nodes that have problems with wifi connections
 
- tecff-respondd-watchdog
  - starts gluon-respondd if it isn't running
  
DEPRECATED:
- gluon-config-mode-site-select
  - Implements multiple sites to separate the network
  - not used since appearing of [multidomain-feature](https://gluon.readthedocs.io/en/v2018.1.x/features/multidomain.html) added in gluon v2018.1

- gluon-ebtables-filter-arp-ffmuc
  - Filters arp requests to not be forwarded to the network
  - superseeded by [gluon-ebtables-limit-arp](https://gluon.readthedocs.io/en/v2018.1.x/package/gluon-ebtables-limit-arp.html) added in gluon v2018.1

- gluon-ebtables-filter-multicast-ffmuc
  - Filters multicast to not be forwarded to the network
  - superseeded by [gluon-ebtables-filter-multicast](https://gluon.readthedocs.io/en/v2018.1.x/package/gluon-ebtables-filter-multicast.html) added in gluon v2018.1
