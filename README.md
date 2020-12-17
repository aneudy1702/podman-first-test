# podman-first-test
Trying to run podman on my osx


## Install virtualbox
```sh
brew cask install virtualbox
```

## Install podman machine
```sh
curl -L https://github.com/boot2podman/machine/releases/download/v0.17/podman-machine.darwin-amd64 --output /usr/local/bin/podman-machine
sudo chmod +x /usr/local/bin/podman-machine
```

## Create a podman VM
```sh
podman-machine create --virtualbox-boot2podman-url \
  https://github.com/snowjet/boot2podman-fedora-iso/releases/download/d1bb19f/boot2podman-fedora.iso \
  --virtualbox-memory="4096" \
  --virtualbox-share-folder ~/Code:code \
  box

# now test
podman-machine ssh box -- sudo podman version
```

## Install Podman client
The defacto Mac client from `brew cask install podman` didn't work for me. I use `podman-remote-darwin` from [this fork](https://github.com/boot2podman/libpod/releases)
```sh
curl -L https://github.com/boot2podman/libpod/releases/download/v1.6.5/podman-remote-darwin --output /usr/local/bin/podman-remote-darwin
sudo chmod +x /usr/local/bin/podman-remote-darwin
```

## Add init script
Add this to `.zshrc` / `.bash_profile` / `config.fish`
```sh
eval $(podman-machine env --varlink)
alias podman="podman-remote-darwin"
# alias docker="podman-remote-darwin"
```

## Bind ip address to /etc/hosts
Get the ip address from `podman-machine ip box`
```
192.168.99.101 podman-box
```
From here on out, `curl podman-box`
