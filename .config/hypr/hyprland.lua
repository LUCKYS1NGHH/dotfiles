-- This is an example Hyprland Lua config file.
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

-- Please note not all available settings / options are set here.
-- For a full list, see the wiki

-- You can (and should!!) split this configuration into multiple files
-- Create your files separately and then require them like this:
-- require("myColors")

local colors = require("colors")
local MAX_ZOOM = 3
local MIN_ZOOM = 1
local ZOOM_TOGGLE_FACTOR = 1.5

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})


---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal    = "kitty"
local fileManager = "thunar"
local menu        = "rofi"


-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

hl.on("hyprland.start", function()
    hl.exec_cmd(terminal)
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprsunset -t 4800")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("wl-paste --type text --watch cliphist -max-items 2000 store")
    hl.exec_cmd("wl-paste --type image --watch cliphist -max-items 2000 store")
    hl.exec_cmd("swaync")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")

-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

hl.config({
    decoration = {
        dim_inactive  = true,
        dim_around = 0.30,
        dim_special = 0.20,
        dim_strength = 0.1
    },
})

-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 2,
        gaps_out = 10,

        border_size = 1,

        col = {
            active_border   = colors.active_border,
            inactive_border = colors.inactive_border,
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = true,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 12,
        rounding_power = 3,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 0.90,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 6,
            color        = colors.shadow,
        },

        blur = {
            enabled   = true,
            size      = 4,
            passes    = 5,
            vibrancy  = 0.1685,
            brightness = 0.88,
            contrast = 0.9,
            noise = 0.02,
            popups = 0,
            special = 0,
            vibrancy_darkness = 0.2
        }
    },

    animations = {
        enabled = true,
    },
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/

-- Curves
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.15, 1},    {0.29, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.25, 0.05}, {0.31, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0.24, 0.10}, {1,    1}    } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.18, 0.10}, {0.80, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.22, 0},    {0.2,  1}    } })
hl.curve("wave",           { type = "bezier", points = { {0.05, 0.35}, {0.05, 1.05} } })
hl.curve("overshot",       { type = "bezier", points = { {0.04, 0.8},  {0.3,  1.08} } })
hl.curve("bounce",         { type = "bezier", points = { {0.05, 0.5}, {0.1, 1.1}   } })

-- Animations
hl.animation({ leaf = "global",        enabled = true, speed = 1,    bezier = "default"                        })
hl.animation({ leaf = "border",        enabled = true, speed = 5.35, bezier = "easeOutQuint"                   })
hl.animation({ leaf = "windows",       enabled = true, speed = 4.8,  bezier = "easeOutQuint",  style = "popin 85%"  })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 3.5,  bezier = "bounce",        style = "popin 70%"  })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 3.2,  bezier = "bounce",        style = "popin 60%"  })
hl.animation({ leaf = "fadeIn",        enabled = true, speed = 1.70, bezier = "almostLinear"                   })
hl.animation({ leaf = "fadeOut",       enabled = true, speed = 1.5,  bezier = "almostLinear"                   })
hl.animation({ leaf = "fade",          enabled = true, speed = 3,    bezier = "quick"                          })
hl.animation({ leaf = "layers",        enabled = true, speed = 3.60, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 3,    bezier = "easeOutQuint",   style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 1.45, bezier = "linear",         style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 1.75, bezier = "almostLinear"                   })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.35, bezier = "almostLinear"                   })
hl.animation({ leaf = "workspaces",    enabled = true, speed = 2.5,  bezier = "overshot"                       })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 2.8,  bezier = "overshot",      style = "slidefade 10%" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 2.8,  bezier = "overshot",      style = "slidefade 10%" })
hl.animation({ leaf = "zoomFactor",    enabled = true, speed = 6,    bezier = "quick"                          })

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper  = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo    = false, -- If true disables the random hyprland logo / anime girl background. :(
        disable_splash_rendering = true
    },
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        repeat_rate = 55,
        repeat_delay = 390,
        follow_mouse = 1,

        sensitivity = 0.05, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = true,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})


---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())

-- Binds for screenshot
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.exec_cmd("hyprshot -m output --output-folder /home/xingyun/Playground/images"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("hyprshot -m region --clipboard"))

-- Binds for Other Apps
hl.bind(mainMod .. " + Q",         hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd("wlogout"))
hl.bind(mainMod .. " + D",         hl.dsp.exec_cmd("~/.config/rofi/applauncher/launcher.sh || pkill rofi"))
hl.bind(mainMod .. " + G",         hl.dsp.exec_cmd("~/.config/rofi/emoji/launcher.sh || pkill rofi"))
hl.bind(mainMod .. " + CTRL + V",  hl.dsp.exec_cmd("~/.config/rofi/cliphist/launcher.sh || pkill rofi"))
hl.bind(mainMod .. " + W",         hl.dsp.exec_cmd("~/.config/rofi/wallpaper-changer/launcher.sh || pkill rofi"))
hl.bind(mainMod .. " + C",         hl.dsp.window.kill())
hl.bind(mainMod .. " + M",         hl.dsp.exit())
hl.bind(mainMod .. " + E",         hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V",         hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + J",         hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + N",         hl.dsp.exec_cmd("swaync-client -t"))

-- pseudotile
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))


-- Adjust tiling window width/height
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.resize({x = 50, y = 0, relative = true}))
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.resize({x = -50, y = 0, relative = true}))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.resize({x = 0, y = -50, relative = true}))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.resize({x = 0, y = 50, relative = true}))


-- Swap windows
hl.bind(mainMod .. " + H", hl.dsp.window.swap( { direction = "l"} ))
hl.bind(mainMod .. " + J", hl.dsp.window.swap( { direction = "r"} ))
hl.bind(mainMod .. " + K", hl.dsp.window.swap( { direction = "u"} ))
hl.bind(mainMod .. " + L", hl.dsp.window.swap( { direction = "d"} ))


-- Magnifier

local function zoom(offset)
    local current = hl.get_config("cursor.zoom_factor")
    if offset ~= nil then
        current = current + offset
    elseif current ~= MIN_ZOOM then
        current = MIN_ZOOM
    else
        current = ZOOM_TOGGLE_FACTOR
    end
    current = math.max(MIN_ZOOM, math.min(MAX_ZOOM, current))
    hl.config({ cursor = { zoom_factor = current } })
end

hl.bind("SUPER + Z", zoom)
hl.bind("SUPER + KP_ADD", function() zoom(0.5) end)
hl.bind("SUPER + minus", function() zoom(-0.5) end)


-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

hl.window_rule({
  name = "utilities",
  match = {
    class = "thunar|vlc|mpv|swayimg|fcitx5-config-qt"
  },

  float   = true,
  size    = "980 650",
  center  = true
})

hl.window_rule({
  name = "pavufloat",
  match = {
    class = "pavucontrol|org.pulseaudio.pavucontrol"
  },

  float  = true,
  size   = "600 400",
  center = true
})

hl.window_rule({
  name = "brave-windows",
  match = {
    class = "brave-browser",
    title = "Sign in|Signin|OAuth|Connect|Authorize|Pop-up|open"
  },

  float  = true,
  size   = "500 600",
  center = true
})

-- Mini layer rules
hl.layer_rule({ match = { namespace = "rofi" }, blur = true, animation = "slidefade" })
hl.layer_rule({ match = { namespace = "swaync-notification-window" }, blur = true, ignore_alpha = 0.2 })

-- Mini window rules
hl.window_rule({ match = { class = "kitty" }, opacity = "0.90 override 0.90" })
