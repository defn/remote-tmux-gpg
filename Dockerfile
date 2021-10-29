ARG IMAGE

FROM $IMAGE

RUN nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
RUN nix-channel --update

RUN nix-env -i tmux
RUN nix-env -i gnupg
RUN nix-env -i openssh
RUN nix-env -i bash
RUN nix-env -i python310

ENTRYPOINT [ "/service" ]

COPY service /service
