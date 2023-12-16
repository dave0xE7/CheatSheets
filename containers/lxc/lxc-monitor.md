
# lxc-monitor

```bash
lxc-monitor -n foo
# will monitor the different states for container foo. 
```

```bash
lxc-monitor -n 'foo|bar'
# will monitor the different states for container foo and bar. 
```

```bash
lxc-monitor -n '[fb].*'
# will monitor the different states for container with the name beginning with letter 'f' or 'b'. 
```

```bash
lxc-monitor -n '.*'
# will monitor the different states for all containers. 
```



[reference](https://linuxcontainers.org/lxc/manpages//man1/lxc-monitor.1.html#lbAG)

