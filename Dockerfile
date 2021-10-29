ARG IMAGE

FROM $IMAGE

RUN nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
RUN nix-channel --update

RUN nix-env -i tmux
RUN nix-env -i gnupg
