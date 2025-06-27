return {
   -- https://wezterm.org/multiplexing.html#ssh-domains
   -- thanks to the following posts, and I finally understand how to use domain
   -- for migrating from tmux to wezterm successfully
   -- https://github.com/wezterm/wezterm/discussions/4324
   -- https://github.com/wezterm/wezterm/discussions/6356
   -- https://mwop.net/blog/2024-07-04-how-i-use-wezterm.html
   default_gui_startup_args = { 'connect', 'unix.main' },

   -- ref: https://wezfurlong.org/wezterm/config/lua/SshDomain.html
   -- ssh_domains = {},
   ssh_domains = {
      -- yazi's image preview on Windows will only work if launched via ssh from WSL
      {
         name = 'wsl.ssh',
         remote_address = 'localhost',
         multiplexing = 'None',
         default_prog = { 'nu', '-l' },
         assume_shell = 'Posix'
      }
   },

   -- ref: https://wezfurlong.org/wezterm/multiplexing.html#unix-domains
   unix_domains = {
      {
         name = "unix.main",
         -- the default shell env is different from unix on Windows
         -- so set the default prog to `nu --login` manually
         -- https://wezterm.org/config/launch.html#__tabbed_1_2
         -- default_prog is not work under unix domains
         -- default_prog = { 'nu', '-l' }
      }
   },

   -- ref: https://wezfurlong.org/wezterm/config/lua/WslDomain.html
   wsl_domains = {
      {
         name = 'WSL:Ubuntu',
         distribution = 'Ubuntu',
         username = 'ice',
         default_cwd = '/home/ice',
         default_prog = { 'nu', '-l' },
      },
   },
}
