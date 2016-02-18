linux:
  modules:
    - name: vhost_net
      persist: True
  sysctls:
    net.ipv4.ip_forward: 1

