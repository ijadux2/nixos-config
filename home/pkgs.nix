{pkgs, ... }:
{

  home.packages = with pkgs; [
    flutter
    # jdk17 removed - only needed for Android development
    # android-tools removed - only needed for Android development
    # Additional Flutter dependencies
    git
    curl
    xz
    zip
    unzip
    # Use clang instead of gcc to avoid conflicts
    clang
    cmake
    ninja
    pkg-config
    # Flutter/Linux desktop dependencies
    libGL
    xorg.libX11
    xorg.libXcursor
    xorg.libXrandr
    xorg.libXinerama
    xorg.libXi
    # libXss not available in nixpkgs
    xorg.libXcomposite
    xorg.libXdamage
    xorg.libXfixes
    xorg.libXext
    xorg.libXrender
    xorg.libXtst
    vscodium
    busybox
    bc
    # gcc removed to avoid conflict with clang
    imagemagick
    # Additional Flutter dependencies
    chromium
    gtk3
    gdk-pixbuf
    pango
    cairo
    atk
    glib
    freetype
    fontconfig
    dbus
    starship
    lua
    luajitPackages.lua-lsp
    emmylua-ls
    zoxide
    zsh-autosuggestions
    zsh-syntax-highlighting
    eza
    gnome-tweaks
    gnomeExtensions.dock-from-dash
    ripgrep
    nodejs
    nix-ld
    fastfetch
    nitch
    cmatrix
    glow
    gum
    waybar
    swaynotificationcenter
    # Create symlink for Google Chrome (Flutter needs this)
    (pkgs.writeShellScriptBin "google-chrome" ''
      exec ${pkgs.chromium}/bin/chromium "$@"
    '')
    nodePackages.vscode-langservers-extracted
    clang-tools
    nodePackages.bash-language-server
    nodePackages.vim-language-server
    file
    thunar
    thunar-archive-plugin
    thunar-media-tags-plugin
    thunar-volman
    thunar-vcs-plugin
    thunar-dropbox-plugin
    btop
    bat
    rustc
    rust-analyzer
    cargo
    catppuccin
    catppuccin-gtk
    nixos-artwork.wallpapers.catppuccin-mocha
    catppuccinifier-gui
    catppuccin-grub
    yt-dlp
    video-downloader
    mpv-handler
  ];

}
