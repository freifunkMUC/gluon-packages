# gluon-packages
custom ffmuc packages feed for gluon

State of the different packages:

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

- gluon-web-ffmuc-domain-director
  - Based on https://github.com/freifunk-darmstadt/ffda-packages/tree/91a3bd3893/gluon-web-ffda-domain-director
  - enables configuration via config-mode

- ffho-autoupdater-wifi-fallback
  - Implements switching to fallback mode if we are cut off from the mesh to autoupdate
  - Upstream: https://git.ffho.net/FreifunkHochstift/ffho-packages/src/master/ffho-autoupdater-wifi-fallback

- ffmuc-autoupgrade-experimental2testing
  - Migrates all node which are on experimental to testing

- ffmuc-geolocator
  - Based on https://github.com/freifunk-darmstadt/ffda-packages/tree/57622c7/ffda-geolocator
  - Updates node location based on Wifis visible to the node (by using a locator service)

- ffmuc-persist-mesh-disabled-ibss211s
  - If mesh via ibss got manually disabled it will be disabled for mesh via 11s as well

- gluon-domain-migration-ffmuc
  - Migrates from multisite config to multidomain config

- ffgg-ath9k-broken-wifi-workaround
  - tries to recover nodes that have problems with wifi connections
  - Upstream: https://github.com/freifunkgg/packages-ffgg/tree/master/ffgg-ath9k-broken-wifi-workaround
