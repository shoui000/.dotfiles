local wezterm = require 'wezterm'

-- Integration with neovim panes
local function isViProcess(pane)
    -- get_foreground_process_name On Linux, macOS and Windows,
    -- the process can be queried to determine this path. Other operating systems
    -- (notably, FreeBSD and other unix systems) are not currently supported
    -- return pane:get_foreground_process_name():find('n?vim') ~= nil
    -- Use get_title as it works for multiplexed sessions too
    return pane:get_title():find("n?vim") ~= nil
end

local function conditionalActivatePane(window, pane, pane_direction, vim_direction)
    local vim_pane_changed = false

    if isViProcess(pane) then
        local before = pane:get_cursor_position()
        window:perform_action(
            -- This should match the keybinds you set in Neovim.
            wezterm.action.SendKey({ key = vim_direction, mods = 'CTRL' }),
            pane
        )
        wezterm.sleep_ms(50)
        local after = pane:get_cursor_position()

        if before.x ~= after.x and before.y ~= after.y then
            vim_pane_changed = true
        end
    end

    if not vim_pane_changed then
        window:perform_action(wezterm.action.ActivatePaneDirection(pane_direction), pane)
    end
end

wezterm.on('ActivatePaneDirection-right', function(window, pane)
    conditionalActivatePane(window, pane, 'Right', 'l')
end)
wezterm.on('ActivatePaneDirection-left', function(window, pane)
    conditionalActivatePane(window, pane, 'Left', 'h')
end)
wezterm.on('ActivatePaneDirection-up', function(window, pane)
    conditionalActivatePane(window, pane, 'Up', 'k')
end)
wezterm.on('ActivatePaneDirection-down', function(window, pane)
    conditionalActivatePane(window, pane, 'Down', 'j')
end)

local config = wezterm.config_builder()

config.default_prog = { 'pwsh' }

config.color_scheme = 'Gruvbox Dark (Gogh)'
config.font = wezterm.font('0xProto Nerd Font Mono')
config.term = 'xterm-256color'

local action = wezterm.action

config.leader = { key = "a", mods = "CTRL", timeout_milisseconds = 1000 }

config.keys = {
    {
      key = '-',
      mods = 'LEADER',
      action = action.SplitVertical({ domain = 'CurrentPaneDomain' })
    },
    {
      key = '|',
      mods = 'LEADER|SHIFT',
      action = action.SplitHorizontal({ domain = 'CurrentPaneDomain' })
    },

    {
        key = "c",
        mods = "LEADER",
        action = action.SpawnTab("CurrentPaneDomain"),
    },
    {
        key = "p",
        mods = "LEADER",
        action = action.ActivateTabRelative(-1),
    },
    {
        key = "n",
        mods = "LEADER",
        action = action.ActivateTabRelative(1),
    },

    -- Integration with neovim panes
    { key = 'h', mods = 'CTRL', action = wezterm.action.EmitEvent('ActivatePaneDirection-left') },
    { key = 'j', mods = 'CTRL', action = wezterm.action.EmitEvent('ActivatePaneDirection-down') },
    { key = 'k', mods = 'CTRL', action = wezterm.action.EmitEvent('ActivatePaneDirection-up') },
    { key = 'l', mods = 'CTRL', action = wezterm.action.EmitEvent('ActivatePaneDirection-right') },

    { key = "F11", mods = "", action = wezterm.action.ToggleFullScreen },
    { key = 'a', mods = 'LEADER|CTRL', action = wezterm.action.SendString '\x01', },
}

for i = 1, 9 do
    table.insert(config.keys, {
        key = tostring(i),
        mods = "LEADER",
        action = action.ActivateTab(i - 1),
    })
end

return config
