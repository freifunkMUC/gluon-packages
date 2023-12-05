# gluon-packages
custom ffmuc packages feed for gluon

State of the different packages:

- ffdon-domain-merge
  - Package that migrates the old ffdon domains to the new ones after a sysupgrade.
  - Requires Gluon v2021 or later.

- ffho-ap-timer
  - Upstream: https://github.com/FreifunkHochstift/ffho-packages/tree/a2521ef/ffho-ap-timer
  - Timer for the client wifi with three modes (daily, weekly, monthly)

- ffho-web-ap-timer
  - Upstream: https://github.com/FreifunkHochstift/ffho-packages/tree/a2521ef/ffho-web-ap-timer
  - Config mode implementation for ffho-ap-timer

- ffho-autoupdater-wifi-fallback
  - Upstream: <https://github.com/freifunk-gluon/community-packages/tree/master/ffac-autoupdater-wifi-fallback>
  - Legacy package that allows switching to fallback mode if we are cut off from the mesh to autoupdate.
  - Only works up to Gluon v2021.x

- ffmuc-simple-radv-filter
  - Upstream: <https://github.com/freifunk-gluon/community-packages/tree/master/ffmuc-ipv6-ra-filter>
  - Legacy package that has been replaced by ffmuc-ipv6-ra-filter for Gluon v2023 or later.
