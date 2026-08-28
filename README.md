# Gentoo overlay

## Enabling
```sh
eselect repository add susman git https://github.com/susman/gentoo-overlay.git
emaint sync -r susman
```

## Packages

| Category | Package | Description |
|---|---|---|
| media-sound | wavpack-stream | Library for streaming audio compression, based on WavPack |
| media-sound | rdac-pw | PipeWire module for lossless WavPack-over-SCTP streaming with mDNS discovery |
