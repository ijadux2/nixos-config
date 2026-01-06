# NixOS Configuration with NixVim

A modern NixOS configuration featuring Home Manager integration and a LazyVim-inspired NixVim setup. This config provides a complete development environment with a beautiful, customizable Neovim experience.

![NixOS](https://img.shields.io/badge/NixOS-24.11-blue.svg)
![Neovim](https://img.shields.io/badge/Neovim-0.10+-green.svg)
![License](https://img.shields.io/badge/License-MIT-yellow.svg)

## ✨ Features

### 🖥️ System Configuration
- **NixOS 24.11** with flake-based management
- **GNOME Desktop** with Hyprland support
- **PipeWire** audio system with WirePlumber
- **Flatpak** support for cross-distribution applications
- **Zsh** shell with Nushell available

### 🎯 NixVim Setup (LazyVim-inspired)
- **Beautiful Alpha Dashboard** - Modern startup screen with quick actions
- **LSP Integration** - Multi-language support with completion
- **Telescope** - Powerful fuzzy finder for files, text, and more
- **Modern UI** - Catppuccin theme, lualine, bufferline, and more
- **Productivity Plugins** - Git integration, todo highlighting, diagnostics
- **Smart Completion** - nvim-cmp with arrow key navigation

### 🛠️ Development Tools
- **Languages Supported**: Nix, Python, TypeScript/JavaScript, Lua
- **LSP Servers**: nil_ls, pyright, ts_ls, lua_ls
- **Version Control**: Git with enhanced integration
- **File Management**: Neo-tree file explorer
- **Package Management**: Nix, Flatpak

## 📁 Project Structure

```
nixos-config/
├── configuration.nix              # Main system configuration
├── hardware-configuration.nix    # Hardware-specific settings
├── flake.nix                     # Flake definition with inputs
├── flake.lock                    # Lock file for reproducibility
└── home/                         # Home Manager configurations
    ├── home.nix                  # Base Home Manager config
    ├── jadu.nix                  # Main user configuration entry point
    └── lua/                      # NixVim modular configurations
        ├── plugins.nix           # LSP, treesitter, telescope, and UI plugins
        ├── keybind.nix           # Custom keybindings
        └── cmp.nix               # Completion (nvim-cmp) configuration
```

## 🚀 Installation

### Prerequisites
- **NixOS** system with flake support enabled
- **Sudo access** for system configuration
- **Git** for cloning this repository

### Step 1: Clone the Repository
```bash
git clone https://github.com/ijadux2/nixos-config.git /etc/nixos
cd /etc/nixos
```

### Step 2: Configure User
The configuration is set up for user `jadu`. If you have a different username:

1. Edit `flake.nix` and replace all instances of `jadu` with your username
2. Edit `configuration.nix` and update the user configuration section

### Step 3: Build and Switch
```bash
# Apply the system configuration
sudo nixos-rebuild switch --flake .

# Or test first (reverts on reboot)
sudo nixos-rebuild test --flake .
```

### Step 4: Verify Installation
- Reboot your system
- Open `nvim` to see the beautiful dashboard
- Your configuration should be fully active!

## ⚙️ Configuration Details

### NixVim Features

#### 🎨 Visual Elements
- **Catppuccin** colorscheme with modern aesthetics
- **Alpha Dashboard** with LazyVim-style layout and quick actions
- **Lualine** statusline with git integration
- **Bufferline** for easy buffer navigation
- **Web-devicons** for beautiful file icons

#### 🧠 Intelligence & Completion
- **LSP** with multi-language support
- **nvim-cmp** for intelligent completion with arrow key navigation
- **Treesitter** for syntax highlighting and understanding
- **Snacks** for various UI enhancements

#### 🔧 Productivity Tools
- **Telescope** for fuzzy finding files, text, and commands
- **Neo-tree** for file management
- **GitSigns** for git integration in the editor
- **Todo-comments** for highlighting TODO/FIXME comments
- **Trouble** for better diagnostics display
- **Which-key** for discovering keybindings

#### ⌨️ Keybindings

**File Management:**
- `<leader>e` - Toggle Neo-tree file explorer
- `<leader><leader>` - Find files
- `<leader>g` - Live grep
- `<leader>fb` - Switch buffers
- `<leader>fh` - Help tags

**Window Navigation:**
- `<C-h/j/k/l>` - Navigate between windows
- `<C-Up/Down>` - Resize window height
- `<C-Left/Right>` - Resize window width

**Completion:**
- `<Up/Down>` - Navigate completion items
- `<Tab>` - Expand snippets
- `<Enter>` - Confirm selection
- `<C-Space>` - Manual completion trigger

**Dashboard:**
- `f` - Find files
- `n` - New file
- `r` - Recent files
- `g` - Find word
- `q` - Quit

### Language Support

#### 🏗️ Nix
- **LSP**: `nil_ls` for Nix language support
- **Syntax highlighting** via Treesitter

#### 🐍 Python
- **LSP**: `pyright` for type checking and completion
- **Full completion** support

#### 📜 TypeScript/JavaScript
- **LSP**: `ts_ls` for TypeScript and JavaScript
- **Syntax aware** completion

#### 🌙 Lua
- **LSP**: `lua_ls` for Neovim Lua development
- **Config-aware** completion

## 🎛️ Customization

### Adding New LSP Servers
Edit `home/lua/plugins.nix`:
```nix
plugins.lsp.servers = {
  nil_ls.enable = true;
  pyright.enable = true;
  ts_ls.enable = true;
  lua_ls.enable = true;
  # Add your LSP server here
  rust-analyzer.enable = true;  # Example for Rust
};
```

### Custom Keybindings
Edit `home/lua/keybind.nix`:
```nix
keymaps = [
  {
    mode = "n";
    key = "<leader>your-key";
    action = ":YourCommand<CR>";
    options.desc = "Your Description";
  }
];
```

### Adding Plugins
Edit `home/lua/plugins.nix`:
```nix
plugins = {
  # Add your plugin here
  your-plugin-name.enable = true;
};
```

### Modifying Completion
Edit `home/lua/cmp.nix` to adjust sources or keybindings.

## 🔄 Maintenance

### Updating the System
```bash
# Update flake inputs
nix flake update

# Rebuild with updates
sudo nixos-rebuild switch --flake .
```

### Managing Configuration
- All changes should be made to the appropriate files
- Use version control (git) to track changes
- Test with `nixos-rebuild test` before applying with `switch`

### Garbage Collection
```bash
# Clean old generations
sudo nix-collect-garbage -d

# Clean user profile
nix-collect-garbage -d
```

## 🐛 Troubleshooting

### Common Issues

**1. Pipewire Error**
- If you get `media-session` errors, ensure `wireplumber.enable = true` is set

**2. LSP Not Working**
- Check that the required language packages are installed system-wide
- Verify LSP servers are enabled in `home/lua/plugins.nix`

**3. Keybinding Conflicts**
- Check for duplicate keybindings in your custom config
- Use `:verbose map <key>` in Neovim to see current mappings

**4. Theme Issues**
- Ensure `have_nerd_font = true` is set for proper icon display
- Install nerd fonts system-wide if needed

### Getting Help
- Check Neovim logs with `:messages`
- Test individual plugins by temporarily disabling others
- Use `nixos-rebuild build --show-trace` for detailed error info

## 📚 Resources

- [NixOS Manual](https://nixos.org/manual/nixos/stable/)
- [Home Manager Manual](https://nix-community.github.io/home-manager/)
- [NixVim Documentation](https://github.com/nix-community/nixvim)
- [LazyVim](https://www.lazyvim.org/) - Inspiration for this config

## 🤝 Contributing

1. Fork this repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **NixOS Community** for the amazing ecosystem
- **NixVim** for making Neovim configuration in Nix possible
- **LazyVim** for the inspiration and design patterns
- All the open-source contributors who make these tools possible

---

**Author**: [ijadux2](https://github.com/ijadux2)  
**Repository**: [https://github.com/ijadux2/nixos-config](https://github.com/ijadux2/nixos-config)  
**Built with ❤️ using NixOS and NixVim**