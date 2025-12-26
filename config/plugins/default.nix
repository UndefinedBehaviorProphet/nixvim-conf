{ pkgs, ...}:{
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

  plugins.lsp = {
    enable = true;

  };

  plugins.treesitter = {
    enable = true;
    


    highlight.enable = true;
    indent.enable = true;
    folding.enable = false;
    grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
  };
  plugins.cmp-treesitter.enable = true;

  plugins.cmp.enable = true;

  plugins.cmp-nvim-lsp.enable = true;
}
