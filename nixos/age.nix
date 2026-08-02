{inputs, ...}: {
  imports = [
    inputs.agenix.nixosModules.default
  ];
  age = {
    identityPaths = ["/etc/agenix/id_ed25519"];
    secrets = {
      "nixos/secrets/tg-ws-proxy" = {
        file = ./secrets/tg-ws-proxy.age;
        owner = "root";
        group = "root";
        mode = "0400";
      };
      "nixos/secrets/password" = {
        file = ./secrets/password.age;
        owner = "root";
        group = "root";
        mode = "0400";
      };
      "nixos/secrets/github" = {
        file = ./secrets/github.age;
        path = "/home/bezydeynost/.ssh/github";
        owner = "bezydeynost";
        group = "users";
        mode = "0600";
      };
      "nixos/secrets/codeberg" = {
        file = ./secrets/codeberg.age;
        path = "/home/bezydeynost/.ssh/codeberg";
        owner = "bezydeynost";
        group = "users";
        mode = "0600";
      };
    };
  };
}
