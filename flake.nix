{
  description = "run";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-stable";

  outputs = { self, nixpkgs }: {
    defaultPackage.x86_64-linux = let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    with pkgs;
    mkShell {
      buildInputs = [
        pkg-config
        cairo
        gobject-introspection
        python39Packages.tkinter
        ffmpeg
      ];

      shellHook = ''
        source .venv/bin/activate
      '';
    };
  };
}
