This is ZNC 1.8.1, including the [push][] plugin.

[push]: https://github.com/jreese/znc-push

## Configuration

ZNC will look for its configuration in `/znc-data/configs/znc.conf`. If
this file does not exist, the image will install a configuration file with
the following defaults:

```
Port: 8443
User: admin
Pass: admin
IPv4: true
IPv6: true
SSL: true (using a self-signed certificate)
```
