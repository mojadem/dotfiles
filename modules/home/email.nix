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

    aerc = {
      enable = true;
      extraAccounts = {
        default = "INBOX";
        # TODO: remove once merged: https://github.com/nix-community/home-manager/pull/9080
        source = "imaps://matt%40dembiczak.net@imap.migadu.com:993";
        outgoing = "smtps+plain://matt%40dembiczak.net@smtp.migadu.com:465";
      };
    };
    thunderbird.enable = true;
  };

  programs.thunderbird = {
    enable = true;
    profiles.default = {
      isDefault = true;
    };
  };
}
