{
  description = "run";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: {
    defaultPackage.x86_64-linux = let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    with pkgs;
  let
    my-python-packages = python-packages: with python-packages; [
      # pkgs.python37Packages.requests openai
      # pyperclip
      # pip
      # dbus-python
      # pandas
      # requests
      # matplotlib
      # other python packages you want
      tkinter
    ];

    python-with-my-packages = pkgs.python39.withPackages my-python-packages;
    in
    mkShell {

      buildInputs = [
        pkg-config
        cairo
        gobject-introspection
        ffmpeg
        tk
        python-with-my-packages
      ];

      shellHook = ''
        source .venv/bin/activate
      '';
    };
  };
}
