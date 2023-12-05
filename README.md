# gluon-packages
custom ffmuc packages feed for gluon

State of the different packages:

- ffdon-domain-merge
  - Package that migrates the old ffdon domains to the new ones after a sysupgrade.
  - Requires Gluon v2021 or later.

- ffda-location
  - Based on https://github.com/freifunk-darmstadt/ffda-packages/tree/57622c7/ffda-location
  - Package to obtain surrounding wifis to obtionally request the location from a locator service
  - used by ffmuc-geolocator

- ffho-ap-timer
  - Upstream: https://github.com/FreifunkHochstift/ffho-packages/tree/a2521ef/ffho-ap-timer
  - Timer for the client wifi with three modes (daily, weekly, monthly)

- ffho-web-ap-timer
  - Upstream: https://github.com/FreifunkHochstift/ffho-packages/tree/a2521ef/ffho-web-ap-timer
  - Config mode implementation for ffho-ap-timer

- ffmuc-domain-director
  - Based on https://github.com/freifunk-darmstadt/ffda-packages/tree/57622c7/ffda-domain-director
  - Makes the node ask a director for zone configuration

- ffmuc-eol-ssid
  - Based on https://gitlab.karlsruhe.freifunk.net/firmware/packages/-/tree/master/ffka-eol-ssid
  - Broadcasts an EOL SSID (bitte-router-erneuern.ffmuc.net) on low flash/RAM devices

- gluon-web-ffmuc-domain-director
  - Based on https://github.com/freifunk-darmstadt/ffda-packages/tree/91a3bd3893/gluon-web-ffda-domain-director
  - enables configuration via config-mode

- ffho-autoupdater-wifi-fallback
  - Upstream: <https://github.com/freifunk-gluon/community-packages/tree/master/ffac-autoupdater-wifi-fallback>
  - Legacy package that allows switching to fallback mode if we are cut off from the mesh to autoupdate.
  - Only works up to Gluon v2021.x

- ffmuc-autoupgrade-experimental2testing
  - Migrates all node which are on experimental to testing

- ffmuc-geolocator
  - Based on https://github.com/freifunk-darmstadt/ffda-packages/tree/57622c7/ffda-geolocator
  - Updates node location based on Wifis visible to the node (by using a locator service)

- ffmuc-persist-mesh-disabled-ibss211s
  - If mesh via ibss got manually disabled it will be disabled for mesh via 11s as well

- gluon-domain-migration-ffmuc
  - Migrates from multisite config to multidomain config

- tecff-ath9k-broken-wifi-workaround
  - tries to recover nodes that have problems with wifi connections
  - Upstream: https://github.com/tecff/gluon-packages/tree/master/tecff-ath9k-broken-wifi-workaround

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
