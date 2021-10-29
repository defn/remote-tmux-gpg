ARG IMAGE

FROM $IMAGE

RUN nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
RUN nix-channel --update

RUN nix-env -i python3

RUN python --version
