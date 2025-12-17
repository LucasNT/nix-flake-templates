{
  description = "Templates for certain projects that i work";
  outputs = { self, ... }: {
    templates = {
      go = {
        path = ./golang;
        description =
          "template for a golang project, add lsp, compiler and debugger";
      };
      trivial = {
        path = ./trivial;
        description = "Simple template to be used with nix develop";
      };
    };
  };
}
