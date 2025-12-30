check:
	shellcheck sshtui

build:
	nix build .#sshtui

run:
	nix run .#sshtui

install: check
	nix profile install .#sshtui

upgrade: check
	nix profile upgrade sshtui
