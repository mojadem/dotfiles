{ pkgs, ... }:

{
  imports = [ ./programs/aerc.nix ];

  accounts.email.accounts.protonmail = {
    primary = true;
    address = "matt@dembiczak.net";
    userName = "matt@dembiczak.net";
    realName = "Matt Dembiczak";

    imap = {
      host = "127.0.0.1";
      port = 1143;
      tls.enable = false;
    };
    smtp = {
      host = "127.0.0.1";
      port = 1025;
      tls.enable = false;
    };

    passwordCommand = "pass show email/protonmail-bridge";

    aerc.enable = true;
    thunderbird.enable = true;
  };

  programs.thunderbird = {
    enable = true;
    profiles.default = {
      isDefault = true;
    };
  };

  services.protonmail-bridge = {
    enable = true;
    extraPackages = with pkgs; [ pass gnupg ];
  };

  systemd.user.services.protonmail-bridge = {
    Unit.After = [ "gpg-agent.service" ];
    Unit.Requires = [ "gpg-agent.service" ];
  };
}
