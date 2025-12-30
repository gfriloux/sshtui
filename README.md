# sshtui

## Installation

### flakes + home-manager

Ajouter notre dépôt en inputs:
```
sshtui = {
  url = "github:gfriloux/sshtui";
  inputs.nixpkgs.follows = "nixpkgs";
};
```

Ensuite dans votre config `home-manager`:
```
home.packages = [
  sshtui.packages.x86_64-linux.sshtui
];
```

### nix profiles

```
nix profile install
```
