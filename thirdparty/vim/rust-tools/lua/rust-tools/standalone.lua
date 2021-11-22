local ra_config = require 'rust-tools.config'

local M = {}

function M.start_standalone_client()
    local config = {
        root_dir = require('lspconfig.util').path.dirname(
            vim.api.nvim_buf_get_name(0)),
        capabilities = ra_config.options.server.capabilities,
        cmd = {'rust-analyzer'},
        init_options = {detachedFiles = {vim.api.nvim_buf_get_name(0)}},
        on_init = function(client)
            vim.lsp.buf_attach_client(0, client.id)
            vim.cmd "command! RustSetInlayHints :lua require('rust-tools.inlay_hints').set_inlay_hints()"
            vim.cmd "command! RustDisableInlayHints :lua require('rust-tools.inlay_hints').disable_inlay_hints()"
            vim.cmd "command! RustToggleInlayHints :lua require('rust-tools.inlay_hints').toggle_inlay_hints()"
            vim.cmd "command! RustExpandMacro :lua require('rust-tools.expand_macro').expand_macro()"
            vim.cmd "command! RustJoinLines :lua require('rust-tools.join_lines').join_lines()"
            vim.cmd "command! RustHoverActions :lua require('rust-tools.hover_actions').hover_actions()"
            vim.cmd "command! RustMoveItemDown :lua require('rust-tools.move_item').move_item()"
            vim.cmd "command! RustMoveItemUp :lua require('rust-tools.move_item').move_item(true)"
        end,
        on_exit = function()
            vim.cmd "delcommand RustSetInlayHints"
            vim.cmd "delcommand RustDisableInlayHints"
            vim.cmd "delcommand RustToggleInlayHints"
            vim.cmd "delcommand RustExpandMacro"
            vim.cmd "delcommand RustJoinLines"
            vim.cmd "delcommand RustHoverActions"
            vim.cmd "delcommand RustMoveItemDown"
            vim.cmd "delcommand RustMoveItemUp"
        end,
        handlers = ra_config.options.server.handlers,
    }

    vim.lsp.start_client(config)
end

return M
