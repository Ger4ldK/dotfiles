cp ~/.zshrc ./zsh/.zshrc &&
cp ~/.p10k.zsh ./zsh/.p10k.zsh &&
cp -r ~/.config/nvim/* ./nvim/.config/nvim/* &&
cp ~/.vimrc ./vim/.vimrc &&
cp ~/.aerospace.toml ./aerospace/.aerospace.toml &&
cp ~/.wezterm.lua ./wezterm/.wezterm.lua &&
git diff
