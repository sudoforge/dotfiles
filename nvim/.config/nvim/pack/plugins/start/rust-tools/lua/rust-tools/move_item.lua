local vim = vim
local utils = require('rust-tools.utils.utils')

local M = {}

local function get_params(up)
    local direction = up and "Up" or "Down"
    local params = vim.lsp.util.make_range_params()
    params.direction = direction

    return params
end

-- move it baby
local function handler(_, result)
    if result == nil then return end
    utils.snippet_text_edits_to_text_edits(result)
    vim.lsp.util.apply_text_edits(result)
end

-- Sends the request to rust-analyzer to move the item and handle the response
function M.move_item(up)
    utils.request(0, "experimental/moveItem", get_params(up or false), handler)
end

return M
