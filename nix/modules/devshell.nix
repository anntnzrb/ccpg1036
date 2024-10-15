{
  inputs,
  ...
}:
{
  imports = [ inputs.devenv.flakeModule ];
  perSystem =
    {
      config,
      pkgs,
      lib,
      ...
    }:
    {
      devenv.shells.default = {
        name = "annt-devenv-template-shell";

        devenv.root =
          let
            file = builtins.readFile inputs.devenv-root.outPath;
          in
          pkgs.lib.mkIf (file != "") file;

        languages = {
          nix.enable = true;
          python = {
            enable = true;
            package = pkgs.python312;
            uv.enable = true;
            uv.sync.enable = true;
          };
        };

        packages = [
          # fmt
          config.treefmt.build.wrapper
          # task runner
          pkgs.just

          # typst
          pkgs.typst

          ## python
          # lsp
          pkgs.ruff
        ];
      };
    };
}
