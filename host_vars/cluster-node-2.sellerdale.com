hostname: cluster-node-2.sellerdale.com
ssd_storage: true
vimrc: "/etc/vim/vimrc"

nfs:
  shares:
    - name: ssd storage
      path: /mnt
      allowed_range: "10.85.3.0/24"
      mount_options: "rw,sync"
