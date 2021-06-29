local wezterm = require 'wezterm';

-- if wezterm.target_triple == "x86_64-unknown-linux-gnu" then
-- end

return {
  check_for_updates = false,
  font_size = 13,
  window_background_opacity = 0.8,
  hide_tab_bar_if_only_one_tab = true,
  initial_rows = 26,
  initial_cols = 90,
  adjust_window_size_when_changing_font_size = false,
  exit_behavior = "Close",
  use_dead_keys = false, 
  use_ime = false,
  -- send_composed_key_when_left_alt_is_pressed=false,
  -- send_composed_key_when_right_alt_is_pressed=false,
  -- disable_default_key_bindings = true,

  keys = {
    -- {key="Enter", mods="CMD", action="ToggleFullScreen"},
    -- { key = "Enter", mods="CMD|SHIFT", action="TogglePaneZoomState" },
    -- {key="h", mods="CMD", action="Hide"},
    -- {key="h", mods="CMD", action="HideApplication"},
    {key="-", mods="CTRL", action="DecreaseFontSize"},
    {key="+", mods="CTRL", action="IncreaseFontSize"},
    {key="p", mods="CMD", action=wezterm.action{ActivateTabRelative=-1}},
    {key="n", mods="CMD", action=wezterm.action{ActivateTabRelative=1}},
    {key="d", mods="CMD", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
    {key="d", mods="CMD|SHIFT", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
    { key = "h", mods="CMD", action=wezterm.action{ActivatePaneDirection="Left"}},
    { key = "l", mods="CMD", action=wezterm.action{ActivatePaneDirection="Right"}},
    { key = "k", mods="CMD", action=wezterm.action{ActivatePaneDirection="Up"}},
    { key = "j", mods="CMD", action=wezterm.action{ActivatePaneDirection="Down"}},
  }
}
