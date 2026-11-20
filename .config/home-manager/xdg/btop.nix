{
  config,
  pkgs,
  ...
}:

{
  xdg = {
    configFile = {
      "btop/themes/catppuccin_frappe.theme" = {
        text = ''
          theme[main_bg]="#303446"

          theme[main_fg]="#C6D0F5"

          theme[title]="#C6D0F5"

          theme[hi_fg]="#8CAAEE"

          theme[selected_bg]="#51576D"

          theme[selected_fg]="#8CAAEE"

          theme[inactive_fg]="#838BA7"

          theme[graph_text]="#F2D5CF"

          theme[meter_bg]="#51576D"

          theme[proc_misc]="#F2D5CF"

          theme[cpu_box]="#ca9ee6" #Mauve
          theme[mem_box]="#a6d189" #Green
          theme[net_box]="#ea999c" #Maroon
          theme[proc_box]="#8caaee" #Blue

          theme[div_line]="#737994"

          theme[temp_start]="#a6d189"
          theme[temp_mid]="#e5c890"
          theme[temp_end]="#e78284"

          theme[cpu_start]="#81c8be"
          theme[cpu_mid]="#85c1dc"
          theme[cpu_end]="#babbf1"

          theme[free_start]="#ca9ee6"
          theme[free_mid]="#babbf1"
          theme[free_end]="#8caaee"

          theme[cached_start]="#85c1dc"
          theme[cached_mid]="#8caaee"
          theme[cached_end]="#babbf1"

          theme[available_start]="#ef9f76"
          theme[available_mid]="#ea999c"
          theme[available_end]="#e78284"

          theme[used_start]="#a6d189"
          theme[used_mid]="#81c8be"
          theme[used_end]="#99d1db"

          theme[download_start]="#ef9f76"
          theme[download_mid]="#ea999c"
          theme[download_end]="#e78284"

          theme[upload_start]="#a6d189"
          theme[upload_mid]="#81c8be"
          theme[upload_end]="#99d1db"

          theme[process_start]="#85c1dc"
          theme[process_mid]="#babbf1"
          theme[process_end]="#ca9ee6"
        '';
      };
      "btop/themes/catppuccin_latte.theme" = {
        text = ''
          theme[main_bg]="#EFF1F5"

          theme[main_fg]="#4C4F69"

          theme[title]="#4C4F69"

          theme[hi_fg]="#1E66F5"

          theme[selected_bg]="#BCC0CC"

          theme[selected_fg]="#1E66F5"

          theme[inactive_fg]="#8C8FA1"

          theme[graph_text]="#DC8A78"

          theme[meter_bg]="#BCC0CC"

          theme[proc_misc]="#DC8A78"

          theme[cpu_box]="#8839ef" #Mauve
          theme[mem_box]="#40a02b" #Green
          theme[net_box]="#e64553" #Maroon
          theme[proc_box]="#1e66f5" #Blue

          theme[div_line]="#9CA0B0"

          theme[temp_start]="#40a02b"
          theme[temp_mid]="#df8e1d"
          theme[temp_end]="#d20f39"

          theme[cpu_start]="#179299"
          theme[cpu_mid]="#209fb5"
          theme[cpu_end]="#7287fd"

          theme[free_start]="#8839ef"
          theme[free_mid]="#7287fd"
          theme[free_end]="#1e66f5"

          theme[cached_start]="#209fb5"
          theme[cached_mid]="#1e66f5"
          theme[cached_end]="#7287fd"

          theme[available_start]="#fe640b"
          theme[available_mid]="#e64553"
          theme[available_end]="#d20f39"


          theme[used_start]="#40a02b"
          theme[used_mid]="#179299"
          theme[used_end]="#04a5e5"

          theme[download_start]="#fe640b"
          theme[download_mid]="#e64553"
          theme[download_end]="#d20f39"

          theme[upload_start]="#40a02b"
          theme[upload_mid]="#179299"
          theme[upload_end]="#04a5e5"

          theme[process_start]="#209fb5"
          theme[process_mid]="#7287fd"
          theme[process_end]="#8839ef"
        '';
      };
      "btop/themes/catppuccin_macchiato.theme" = {
        text = ''
          theme[main_bg]="#24273A"

          theme[main_fg]="#CAD3F5"

          theme[title]="#CAD3F5"

          theme[hi_fg]="#8AADF4"

          theme[selected_bg]="#494D64"

          theme[selected_fg]="#8AADF4"

          theme[inactive_fg]="#8087A2"

          theme[graph_text]="#F4DBD6"

          theme[meter_bg]="#494D64"

          theme[proc_misc]="#F4DBD6"

          theme[cpu_box]="#c6a0f6" #Mauve
          theme[mem_box]="#a6da95" #Green
          theme[net_box]="#ee99a0" #Maroon
          theme[proc_box]="#8aadf4" #Blue

          theme[div_line]="#6E738D"

          theme[temp_start]="#a6da95"
          theme[temp_mid]="#eed49f"
          theme[temp_end]="#ed8796"

          theme[cpu_start]="#8bd5ca"
          theme[cpu_mid]="#7dc4e4"
          theme[cpu_end]="#b7bdf8"

          theme[free_start]="#c6a0f6"
          theme[free_mid]="#b7bdf8"
          theme[free_end]="#8aadf4"

          theme[cached_start]="#7dc4e4"
          theme[cached_mid]="#8aadf4"
          theme[cached_end]="#b7bdf8"

          theme[available_start]="#f5a97f"
          theme[available_mid]="#ee99a0"
          theme[available_end]="#ed8796"

          theme[used_start]="#a6da95"
          theme[used_mid]="#8bd5ca"
          theme[used_end]="#91d7e3"

          theme[download_start]="#f5a97f"
          theme[download_mid]="#ee99a0"
          theme[download_end]="#ed8796"

          theme[upload_start]="#a6da95"
          theme[upload_mid]="#8bd5ca"
          theme[upload_end]="#91d7e3"

          theme[process_start]="#7dc4e4"
          theme[process_mid]="#b7bdf8"
          theme[process_end]="#c6a0f6"
        '';
      };
      "btop/themes/catppuccin_mocha.theme" = {
        text = ''
          theme[main_bg]="#1E1E2E"

          theme[main_fg]="#CDD6F4"

          theme[title]="#CDD6F4"

          theme[hi_fg]="#89B4FA"

          theme[selected_bg]="#45475A"

          theme[selected_fg]="#89B4FA"

          theme[inactive_fg]="#7F849C"

          theme[graph_text]="#F5E0DC"

          theme[meter_bg]="#45475A"

          theme[proc_misc]="#F5E0DC"

          theme[cpu_box]="#cba6f7" #Mauve
          theme[mem_box]="#a6e3a1" #Green
          theme[net_box]="#eba0ac" #Maroon
          theme[proc_box]="#89b4fa" #Blue

          theme[div_line]="#6C7086"

          theme[temp_start]="#a6e3a1"
          theme[temp_mid]="#f9e2af"
          theme[temp_end]="#f38ba8"

          theme[cpu_start]="#94e2d5"
          theme[cpu_mid]="#74c7ec"
          theme[cpu_end]="#b4befe"

          theme[free_start]="#cba6f7"
          theme[free_mid]="#b4befe"
          theme[free_end]="#89b4fa"

          theme[cached_start]="#74c7ec"
          theme[cached_mid]="#89b4fa"
          theme[cached_end]="#b4befe"

          theme[available_start]="#fab387"
          theme[available_mid]="#eba0ac"
          theme[available_end]="#f38ba8"

          theme[used_start]="#a6e3a1"
          theme[used_mid]="#94e2d5"
          theme[used_end]="#89dceb"

          theme[download_start]="#fab387"
          theme[download_mid]="#eba0ac"
          theme[download_end]="#f38ba8"

          theme[upload_start]="#a6e3a1"
          theme[upload_mid]="#94e2d5"
          theme[upload_end]="#89dceb"

          theme[process_start]="#74C7EC"
          theme[process_mid]="#89DCEB"
          theme[process_end]="#cba6f7"
        '';
      };
    };
  };
}
