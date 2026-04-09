{ pkgs, ... }:

{
  imports = [ ./programs/aerc.nix ];

  accounts.email.accounts.personal = {
    primary = true;
    address = "matt@dembiczak.net";
    userName = "matt@dembiczak.net";
    realName = "Matt Dembiczak";

    imap = {
      host = "imap.migadu.com";
      port = 993;
    };
    smtp = {
      host = "smtp.migadu.com";
      port = 465;
    };

    passwordCommand = "pass show email/personal";

    thunderbird.enable = true;
  };

  programs.thunderbird = {
    enable = true;
    profiles.default = {
      isDefault = true;
    };
  };
}
