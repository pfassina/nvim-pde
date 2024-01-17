local status_ok, ibl = pcall(require, "ibl")
if not status_ok then
    return
end

ibl.setup({
    exclude = {
        buftypes = { "terminal", "nofile" },
        filetypes = { "help", "startfy", "dashboard", "packer", "neogitstatus", "NvimTree", "Trouble" }
    },
    scope = {
        show_start = false,
        show_end = false
    },
    indent = { char = "▏" }
})
