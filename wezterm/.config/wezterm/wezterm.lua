local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'carbonfox'
config.font = wezterm.font('0xProto Nerd Font Mono')
config.term = 'xterm-256color'

if wezterm.target_triple:find("windows") ~= nil then
  local winConfig = require 'windows_config'
  winConfig.apply_to_config(config)
else
  config.window_decorations = 'RESIZE'

  wezterm.on("gui-startup", function()
    local tab, pane, window = wezterm.mux.spawn_window{}
    window:gui_window():maximize()
  end)
end

return config
