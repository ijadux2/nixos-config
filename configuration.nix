{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "itachi"; # Define your hostname.

 nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
services.desktopManager.gnome.enable = true;
services.displayManager.gdm.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    
    # Enable Bluetooth audio
    wireplumber.enable = true;
  };

  # Enable Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

   services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jadu = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "jadu";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Install firefox.
  programs.firefox.enable = true;
 
  programs.zsh = {
    enable = true;
};

  programs.hyprland.enable = true;
  services.flatpak.enable = true;
  programs.nix-ld.enable = true;
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  vim 
  wget
  neovim
  brave
  chromium
  kitty
  waybar
  swww 
  git 
  curl
  love
  zsh 
  nushell
  yazi
  github-desktop
  opencode
  cliphist
  fuzzel
  grim
  wl-clipboard
  slurp
  hyprlock
  xdg-desktop-portal-hyprland
  mesa
  libgcc
  fontconfig
  hyprpolkitagent
  wayland-utils
  wlr-protocols
  cmake
  meson
  ninja
  pkg-config
  hyprutils
  nerd-fonts.jetbrains-mono
  nwg-look
  matugen

  # Bluetooth tools
  blueman
  bluez
  pulseaudio
  ];

programs.nix-ld.libraries = with pkgs; [
  stdenv.cc.cc
  glibc
  zlib
  openssl
  libgcc
  xorg.libX11
  xorg.libXcursor
  xorg.libXrandr
  xorg.libXinerama
  xorg.libXi
  xorg.libXcomposite
  xorg.libXdamage
  xorg.libXfixes
  alsa-lib
  atk
  cairo
  pango
  gtk3
  nss
  nspr
];
  

  system.stateVersion = "25.11"; 
}
