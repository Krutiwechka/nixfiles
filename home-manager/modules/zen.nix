{ inputs, pkgs, lib,...}:

let
	extension = shortId: guid: {
	    name = guid;
	    value = {
	      install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
	      installation_mode = "normal_installed";
	    };
	  };
  prefs = {
    "extensions.autoDisableScopes" = 0;
    "extensions.pocket.enabled" = false;

    #telemetry
    "datareporting.healthreport.uploadEnabled" = false;
    "toolkit.telemetry.enabled" = false;
    "toolkit.telemetry.unified" = false;
    "browser.discovery.enabled" = false;
    "browser.newtabpage.activity-stream.feeds.telemetry" = false;

    #startup
    "browser.startup.homepage" = "about:blank";
    "browser.newtabpage.enabled" = true;

    #graphics rendering
    "media.ffmpeg.vaapi.enabled" = true;
    "gfx.webrender.all" = true;

    "geo.enabled" = false;
    "dom.battery.enabled" = false;

    #cookies
    "network.cookie.cookieBehavior" = 5;
    # встроенный менеджер паролей
	"signon.rememberSignons" = false;
	"signon.autofillForms" = false;
	"signon.generation.enabled" = false;
	"signon.management.page.breach-alerts.enabled" = false;
	#theme
    "zen.view.window.scheme" = 0;
    "layout.css.prefers-color-scheme.content-override" = 0;
	"layout.css.devPixelsPerPx" = "1.1";
	"browser.zoom.siteSpecific" = true;
	"browser.zoom.full" = true; 
	"font.name.serif.x-western" = "FiraCode Nerd Font";
	"font.name.sans-serif.x-western" = "FiraCode Nerd Font";
	"font.name.monospace.x-western" = "FiraCode Nerd Font Mono";
	"font.size.variable.x-western" = 16;
	"font.size.monospace.x-western" = 12;

	"font.name.serif.x-cyrillic" = "FiraCode Nerd Font";
	"font.name.sans-serif.x-cyrillic" = "FiraCode Nerd Font";
	"font.name.monospace.x-cyrillic" = "FiraCode Nerd Font Mono";
	"font.size.variable.x-cyrillic" = 16;
	"font.size.monospace.x-cyrillic" = 12;

	"font.name.serif.x-unicode" = "FiraCode Nerd Font";
	"font.name.sans-serif.x-unicode" = "FiraCode Nerd Font";
	"font.name.monospace.x-unicode" = "FiraCode Nerd Font Mono";
	"font.size.variable.x-unicode" = 16;
	"font.size.monospace.x-unicode" = 12;
  };

  extensions = [
  	#addons.mozilla.org/en-US/firefox/addon/<shortId>/
  	#addons.mozilla.org/api/v5/addons/addon/<shortId>/
    (extension "ublock-origin" "uBlock0@raymondhill.net")
    (extension "privacy-badger17" "jid1-MnnxcxisBPnSXQ@jetpack")
    (extension "sponsorblock" "sponsorBlocker@ajay.app")
    (extension "veepn-free-fast-security-vpn" "{94ed9bbf-a1e2-4e58-81ae-cd16dad818d8}")
    (extension "bitwarden-password-manager" "{446900e4-71c2-419f-a6a7-df9c091e268b}")
  ];

in
{
  home.packages = [
    (pkgs.wrapFirefox
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.zen-browser-unwrapped
      {
        extraPrefs = lib.concatLines (
          lib.mapAttrsToList (
            name: value: ''lockPref(${lib.strings.toJSON name}, ${lib.strings.toJSON value});''
          ) prefs
        );

        extraPolicies = {
          DisableTelemetry = true;
          DisablePocket = true;
PasswordManagerEnabled = false;
OfferToSaveLogins = false;
          DisableAppUpdate = true;

          ExtensionSettings = builtins.listToAttrs extensions;

          SearchEngines = {
            Default = "ddg";
            Add = [
              {
                Name = "nixpkgs packages";
                URLTemplate = "https://search.nixos.org/packages?query={searchTerms}";
                IconURL = "https://wiki.nixos.org/favicon.ico";
                Alias = "@np";
              }
              {
              	Name = "homemanager options";
              	URLTemplate = "https://home-manager-options.extranix.com/?query={searchTerms}&release=master";
              	IconURL = "https://wiki.nixos.org/favicon.ico";
              	Alias = "@ho";
              }
            ];
          };
        };
      }
    )
  ];
}



