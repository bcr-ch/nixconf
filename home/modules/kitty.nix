{ pkgs, ... }: {
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMonoNL Nerd Font Mono"; 
      package = pkgs.nerd-fonts.jetbrains-mono;
      size = 13;
    };
    settings = {
      allow_remote_control = true;
      window_padding_width = 15;
      enable_audio_bell = false;
      copy_on_select = "yes";
    };
    extraConfig = ''
      active_tab_font_style   normal

      font_size 13
      font_family 		  JetBrainsMonoNL Nerd Font Mono
      bold_font 		  JetBrainsMonoNL Nerd Font Mono Bold		
      italic_font 	      JetBrainsMonoNL Nerd Font Mono Italic
      bold_italic_font    JetBrainsMonoNL Nerd Font Mono Bold Italic

      enable_audio_bell no
      mouse_hide_wait 3.0

      scrollback_pager_history_size 4000

      repaint_delay 10
      sync_to_monitor yes

      window_border_width 1pt
      active_border_color #41413d
      inactive_border_color #1F1F2A

      confirm_os_window_close -1
      cursor_shape beam

      tab_bar_style separator
      tab_separator ""
      tab_title_template "  {title}  "
      tab_bar_edge bottom
      active_tab_font_style   normal

      mouse_map left click ungrabbed mouse_click_url_or_select

      map alt+3 send_text all #

      enabled_layouts splits:split_axis=horizontal

      map ctrl+shift+r combine : clear_terminal active : send_text normal \x0c

      map alt+h  kitten pass_keys.py neighboring_window left alt+h
      map alt+l  kitten pass_keys.py neighboring_window right alt+l
      map alt+k  kitten pass_keys.py neighboring_window top alt+k
      map alt+j  kitten pass_keys.py neighboring_window bottom alt+j

      map cmd+t new_tab_with_cwd

      # colors
      background  #0D1014
      foreground #DCD7BA
      selection_background #2D4F67
      selection_foreground #C8C093
      url_color #72A7BC
      cursor #C8C093

      active_tab_background #16161D
      active_tab_foreground #DCD7BA
      inactive_tab_foreground #727169
      inactive_tab_background #0D1014

      color0 #090618
      color1 #C34043
      color2 #76946A
      color3 #C0A36E
      color4 #7E9CD8
      color5 #957FB8
      color6 #6A9589
      color7 #C8C093

      color8  #727169
      color9  #E82424
      color10 #98BB6C
      color11 #E6C384
      color12 #7FB4CA
      color13 #938AA9
      color14 #7AA89F
      color15 #DCD7BA

      color16 #FFA066
      color17 #FF5D62
    '';
  };
}
