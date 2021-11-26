local M = {}
local utils = require('rust-tools.utils.utils')
local vim = vim
local config = require 'rust-tools.config'

-- Update inlay hints when opening a new buffer and when writing a buffer to a
-- file
-- opts is a string representation of the table of options
function M.setup_autocmd()

    local events = "BufEnter,BufWinEnter,TabEnter,BufWritePost"
    if config.options.tools.inlay_hints.only_current_line then
        events = string.format("%s,%s", events, config.options.tools.inlay_hints
                                   .only_current_line_autocmd)
    end

    vim.api.nvim_command('augroup InlayHints')
    vim.api.nvim_command('autocmd ' .. events ..
                             ' *.rs :lua require"rust-tools.inlay_hints".set_inlay_hints()')
    vim.api.nvim_command('augroup END')
end

local function get_params()
    return {textDocument = vim.lsp.util.make_text_document_params()}
end

local namespace = vim.api.nvim_create_namespace("rust-analyzer/inlayHints")
-- whether the hints are enabled or not
local enabled = nil

-- parses the result into a easily parsable format
-- example:
-- {
--  ["12"] = { {
--      kind = "TypeHint",
--      label = "String"
--    } },
--  ["13"] = { {
--      kind = "TypeHint",
--      label = "usize"
--    } },
--  ["15"] = { {
--      kind = "ParameterHint",
--      label = "styles"
--    }, {
--      kind = "ParameterHint",
--      label = "len"
--    } },
--  ["7"] = { {
--      kind = "ChainingHint",
--      label = "Result<String, VarError>"
--    }, {
--      kind = "ParameterHint",
--      label = "key"
--    } },
--  ["8"] = { {
--      kind = "ParameterHint",
--      label = "op"
--    } }
-- }
--
local function parseHints(result)
    local map = {}
    local only_current_line = config.options.tools.inlay_hints.only_current_line

    if type(result) ~= 'table' then return {} end
    for _, value in pairs(result) do
        local line = tostring(value.range["end"].line)
        local label = value.label
        local kind = value.kind
        local current_line = vim.api.nvim_win_get_cursor(0)[1]

        local function add_line()
            if map[line] ~= nil then
                table.insert(map[line], {label = label, kind = kind})
            else
                map[line] = {{label = label, kind = kind}}
            end
        end

        if only_current_line then
            if line == tostring(current_line - 1) then add_line() end
        else
            add_line()
        end
    end
    return map
end

local function handler(err, result, ctx)
    if err then return end
    local opts = config.options.tools.inlay_hints
    local bufnr = ctx.bufnr

    if (vim.api.nvim_get_current_buf() ~= bufnr) then return end

    -- clean it up at first
    M.disable_inlay_hints()

    local ret = parseHints(result)
    local max_len = -1

    for key, _ in pairs(ret) do
        local line = tonumber(key)
        local current_line = vim.api.nvim_buf_get_lines(bufnr, line, line + 1,
                                                        false)[1]
        if (current_line) then
            local current_line_len = string.len(current_line)
            max_len = math.max(max_len, current_line_len)
        end
    end

    for key, value in pairs(ret) do
        local virt_text = ""
        local line = tonumber(key)

        local current_line = vim.api.nvim_buf_get_lines(bufnr, line, line + 1,
                                                        false)[1]

        if (current_line) then
            local current_line_len = string.len(current_line)

            local param_hints = {}
            local other_hints = {}

            -- segregate paramter hints and other hints
            for _, value_inner in ipairs(value) do
                if value_inner.kind == "ParameterHint" then
                    table.insert(param_hints, value_inner.label)
                else
                    table.insert(other_hints, value_inner.label)
                end
            end

            -- show parameter hints inside brackets with commas and a thin arrow
            if not vim.tbl_isempty(param_hints) and opts.show_parameter_hints then
                virt_text = virt_text .. opts.parameter_hints_prefix .. "("
                for i, value_inner_inner in ipairs(param_hints) do
                    virt_text = virt_text .. value_inner_inner
                    if i ~= #param_hints then
                        virt_text = virt_text .. ", "
                    end
                end
                virt_text = virt_text .. ") "
            end

            -- show other hints with commas and a thicc arrow
            if not vim.tbl_isempty(other_hints) then
                virt_text = virt_text .. opts.other_hints_prefix
                for i, value_inner_inner in ipairs(other_hints) do
                    virt_text = virt_text .. value_inner_inner
                    if i ~= #other_hints then
                        virt_text = virt_text .. ", "
                    end
                end
            end

            if config.options.tools.inlay_hints.right_align then
                virt_text = virt_text ..
                                string.rep(" ", config.options.tools.inlay_hints
                                               .right_align_padding)
            end

            if config.options.tools.inlay_hints.max_len_align then
                virt_text = string.rep(" ", max_len - current_line_len +
                                           config.options.tools.inlay_hints
                                               .max_len_align_padding) ..
                                virt_text
            end

            -- set the virtual text
            vim.api.nvim_buf_set_extmark(bufnr, namespace, line, 0, {
                virt_text_pos = config.options.tools.inlay_hints.right_align and
                    "right_align" or "eol",
                virt_text = {
                    {virt_text, config.options.tools.inlay_hints.highlight}
                },
                hl_mode = "combine"
            });

            -- update state
            enabled = true
        end
    end
end

function M.toggle_inlay_hints()
    if enabled then
        M.disable_inlay_hints()
    else
        M.set_inlay_hints()
    end
    enabled = not enabled
end

function M.disable_inlay_hints()
    -- clear namespace which clears the virtual text as well
    vim.api.nvim_buf_clear_namespace(0, namespace, 0, -1)
end

-- Sends the request to rust-analyzer to get the inlay hints and handle them
function M.set_inlay_hints()
    utils.request(0, "rust-analyzer/inlayHints", get_params(), handler)
end

return M
