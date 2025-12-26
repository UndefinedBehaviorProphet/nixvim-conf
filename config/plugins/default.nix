{
  imports = [
    ./bufferline.nix 
    ./snacks.nix
    ./lualine.nix
    ./neotree.nix
    ./lazygit.nix
    ./gitsigns.nix
    ./telescope.nix
  ];

  # plugins.lazy.enable = true;
  plugins.tmux-navigator.enable = true;
  plugins.blame.enable = true;
}
