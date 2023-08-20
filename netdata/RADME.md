# netdata

80ポートを使い時は以下のようにconfig/netdata.confに記入する

https://learn.netdata.cloud/docs/configuring/securing-netdata-agents/web-server

```toml
# netdata can generate its own config which is available at 'http://<netdata_ip>/netdata.conf'
# You can download it with command like: 'wget -O /etc/netdata/netdata.conf http://localhost:19999/netdata.conf'
[web]
   default port = 199999
   bind to = 80*=dashboard|registry|badges|management|streaming|netdata.conf^SSL=force *:
```
