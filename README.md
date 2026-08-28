# Gentoo overlay

## Enabling
```sh
eselect repository add susman git https://github.com/susman/gentoo-overlay.git
emaint sync -r susman
```

## Packages

| Category | Package | Description | Notes
|---|---|---|---|
| media-sound | wavpack-stream | Library for streaming audio compression, based on WavPack | none |
| media-sound | rdac-pw | Remote DAC PipeWire module | Requires ZIG_TARGET="native" ZIG_CPU="native" in /etc/portage/make.conf
