local Config = require('config')

require('utils.backdrops')
   -- :set_focus('#000000')
   -- :set_images_dir(require('wezterm').home_dir .. '/Pictures/Wallpapers/')
   :set_images()
   :random()

require('events.left-status').setup()
require('events.right-status').setup({ date_format = '%a %H:%M:%S' })
require('events.tab-title').setup({ hide_active_tab_unseen = false, unseen_icon = 'circle' })
require('events.new-tab-button').setup()

local result = Config:init()
   :append(require('config.appearance'))
   -- :append(require('config.bindings'))
   :append(require('config.domains'))
   :append(require('config.fonts'))
   :append(require('config.general'))
   :append(require('config.launch')).options

-- https://github.com/sei40kr/wez-tmux
-- use ctrl+a to avoid issues in copy mode
result.leader = { key = "a", mods = "CTRL" }

-- Add these lines:
require("config.bindings").apply_to_config(result, {})


return result

-- end of file
