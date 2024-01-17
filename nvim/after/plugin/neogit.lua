local status_ok, neogit = pcall(require, "neogit")
if not status_ok then
    return
end

neogit.setup {
    use_magit_keybindings = true,
    kind = "split"
}
