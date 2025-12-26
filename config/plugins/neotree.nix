{lib, ...}:{
  plugins.neo-tree = {
    enable = true;
        
    settings = {
      sources = [ "filesystem" "buffers" "git_status" ];
      source_selector = {
        winbar = true;
        lualine = false;
      };
      openFilesDoNotReplaceTypes = [ "terminal" "Trouble" "trouble" "qf" "Outline" ];

      filesystem = {
        bindToCwd = false;
        followCurrentFile.enabled = true;
        useLibuvFileWatcher = true;
      };

      window = {
        mappings = {
          "l" = "open";
          "h" = "close_node";
          "<space>" = "none";
          "P" = lib.nixvim.utils.listToUnkeyedAttrs ["toggle_preview"] // {config = { use_float = false; }; }; 
          "y" = lib.nixvim.utils.listToUnkeyedAttrs [ {__raw = ''
            function(state)
                local node = state.tree:get_node()
                local path = node:get_id()
                vim.print("Yanked:".. path)
                vim.fn.setreg("+", path, "c")
            end
          '';} ] // { desc = "Copy Path to Clipboard"; };
          "O" = lib.nixvim.utils.listToUnkeyedAttrs [ {__raw = ''
            function(state)
              require("lazy.util").open(state.tree:get_node().path, { system = true })
            end
          '';} ] // { desc = "Open with System Application"; };
        };
      };

      defaultComponentConfigs = {
        indent = {
          withExpanders = true;
          expanderCollapsed = "";
          expanderExpanded = "";
          expanderHighlight = "NeoTreeExpander";
        };
        gitStatus = {
          symbols = {
            unstaged = "󰄱";
            staged = "󰱒";
          };
        };
      };
    };
  };
}
