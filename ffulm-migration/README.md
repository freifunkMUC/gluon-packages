# ffulm-migration

This packages allows migrating an ffulm firmware v2.1.5 to a gluon-based v2021.1.x firmware.
The fundamentals are inspired by setup-mode.

It creates its own rc.d tree that can be enforced by writing a path into the file `/tmp/rc_d_path` early during boot.
This happens inside a preinit file called "89_ffulm_migration" that is exected just before the preinit file of
gluon-setup-mode. In order to avoid conflicts with setup-mode, this preinit file also disables it (enabled=0) and
pretends that it had been configured in the past (configured=1).

These steps are being used from /etc/rc.d:
- `K89log`
- `K98boot`
- `K99umount`
- `S00sysfixtime`
- `S00urngd`
- `S10boot`
- `S10gluon-core-reconfigure`
- `S10system`
- `S11sysctl`
- `S12log`
- `S20gluon-core-reconfigure`
- `S95done`

And we inject our own custom rc stages:
- `S09ffulm-config-backup`\
  This stage will remove and backup all previous files in /etc/config and restore the defaults from /rom/etc/config
- `S13led`\
  This stage will make the LED flash fast to show that the migration is in progress
- `S14ffulm-migration`\
  This stage is doing the migration of previous configs to a Gluon configuration (and can be extended if needed)
- `S19ffulm-cleanup`\
  This stage will clean up the backed up configurations (if permitted), will remove other remnant configuration files (like old cronjobs, /etc/hosts, etc) and will reset the root password (if permitted)
- `S96reboot`\
  This stage will write a logread dump to /root and reboot the router into a real Gluon (if permitted)


## Special uci overrides

These overrides allow to customise the migration:

- `freifunk.@settings[0].preserve_configs`\
  Set to any value, will not delete any of the backup files from previous /etc/config. Helpful for further debugging.

- `freifunk.@settings[0].preserve_root_password=i_know_what_i_am_doing`\
  This flag will not reset the root password.\
  ⚠️WARNING⚠️: The router will be publicly reachable after an upgrade and we highly recommend to only use SSH-keys for accessing a router.

- `freifunk.@settings[0].disable_migration_reboot`\
  Set to any value, will not reboot after the migration. The device will only be accessible via a serial console.
