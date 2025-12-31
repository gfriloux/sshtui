{ channels, inputs, ... }:

final: prev: {
  sshtui = inputs.self.packages.${final.system}.sshtui;
}
