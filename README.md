# configs

Config files for quickly setting up Armbian on an SBC,
and various native (non-dockerized) services.

### Usage

Run as root:

```
apt update -yq ; apt install -yq git
git clone https://github.com/padhi-homelab/configs.git /opt/configs
cd /opt/configs ; ./setup.sh --help
```

Check the options and then run `./setup.sh` with the desired options.
