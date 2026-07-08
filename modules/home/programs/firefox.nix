{ ... }:

let
  extensionSlugs = {
    "uBlock0@raymondhill.net" = "ublock-origin";
    "{446900e4-71c2-419f-a6a7-df9c091e268b}" = "bitwarden-password-manager";
    "{fd4fdeb0-5a65-4978-81c5-3488d4d56426}" = "gruvboxtheme";
  };
in
{
  programs.firefox = {
    enable = true;

    policies.ExtensionSettings = builtins.mapAttrs (_id: slug: {
      installation_mode = "normal_installed";
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/${slug}/latest.xpi";

      # Don't pin extensions to toolbar.
      default_area = "menupanel";
    }) extensionSlugs;
  };
}
