hostname: octopi.sellerdale.com
vimrc: "/etc/vim/vimrc"
rpi: true

afp:
  hostname: "hypercube"
  announce: false
  domain: "sellerdale.com"
  mimic_model: "AirPort7,120"
  admin_group: "jiri"
  hosts_allow: "10.85.0.0/24"
  shares:
    - name: Klipper
      path: /home/pi/klipper
      users: "jiri ansible pi root nobody"
      timemachine: no
      owner: pi
      group: pi

nfs:
  shares:
    - name: klipper
      path: /home/pi/klipper
      allowed_range: "10.85.0.0/24"
      mount_options: "rw,sync"
      owner: pi
      group: pi

dlna:
  name: "Klipper DLNA"
  cache: "/var/cache/minidlna"
  inotify: "yes"
  port: 8200
  log_dir: "/var/log"
  shares:
    - name: Klipper
      path: /home/pi/klipper
      type: P
      owner: pi
      group: pi

samba:
  workgroup: "WORKGROUP"
  name: "hypercube"
  announce: true
  mimic_model: "AirPort7,120"
  hosts_allow: "10.85.0."
  wins_support: "yes"
  logs: "/var/log/samba/log.%m"
  log_dir: "/var/log/samba/"
  shares:
    - name: Klipper
      path: /home/pi/klipper
      writable: yes
      browseable: yes
      spotlight: yes
      apple_extensions: yes
      timemachine: no
      owner: pi
      group: pi
    - name: printer_data
      path: /home/pi/printer_data
      writable: yes
      browseable: yes
      spotlight: yes
      apple_extensions: yes
      timemachine: no
      owner: pi
      group: pi
