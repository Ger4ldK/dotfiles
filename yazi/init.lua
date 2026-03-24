require("gvfs"):setup({
    save_path = os.getenv("HOME") .. "/.config/yazi/gvfs.private",
    save_password_autoconfirm = true,
})
