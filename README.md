# Gluon Freifunk München community repository

A repository for our Freifunk Munich specific packages of the Gluon firmware we use in our images.

State of the different packages:

- ffho-ap-timer
  - Upstream: https://github.com/FreifunkHochstift/ffho-packages/tree/a2521ef/ffho-ap-timer
  - Timer for the client wifi with three modes (daily, weekly, monthly)

- ffho-autoupdater-wifi-fallback
  - Implements switching to fallback mode if we are cut off from the mesh to autoupdate
  - Upstream: https://git.ffho.net/FreifunkHochstift/ffho-packages/src/master/ffho-autoupdater-wifi-fallback

- ffho-web-ap-timer
  - Upstream: https://github.com/FreifunkHochstift/ffho-packages/tree/a2521ef/ffho-web-ap-timer
  - Config mode implementation for ffho-ap-timer

- ffmuc-simple-radv-filter
  - Upstream: https://github.com/freifunkMUC/gluon-packages/tree/main/ffmuc-simple-radv-filter