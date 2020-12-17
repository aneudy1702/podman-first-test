podman-machine create --virtualbox-boot2podman-url \
  https://github.com/snowjet/boot2podman-fedora-iso/releases/download/d1bb19f/boot2podman-fedora.iso \
  --virtualbox-memory="4096" \
  --virtualbox-share-folder ~/Desktop/personal/learning/rtx/podman/express-app:code \
  box
