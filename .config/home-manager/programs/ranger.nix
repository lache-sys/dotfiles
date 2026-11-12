{ config, pkgs, ... }:

{
  programs = {
    ranger = {
      enable = true;
      aliases = {
        e = "edit";
        q = "quit";
        "q!" = "quit!";
        qa = "quitall";
        "qa!" = "quitall!";
        qall = "quitall";
        "qall!" = "quitall!";
        setl = "setlocal";
        filter = "scout -prts";
        hide = "scout -prtsv";
        find = "scout -aets";
        mark = "scout -mr";
        unmark = "scout -Mr";
        search = "scout -rs";
        search_inc = "scout -rts";
        travel = "scout -aefklst";
        unnarrow = "narrow False";
      };
      extraConfig = ''
      '';
      extraPackages = [
        pkgs.ffmpegthumbnailer
        pkgs.poppler
        pkgs.ueberzugpp
      ];
      mappings = {
        Q = "quitall";
        q = "quit";
      };
      rifle = [
      ];
      settings = {
        automatically_count_files = true;
        autosave_bookmarks = true;
        autoupdate_cumulative_size = false;
        bidi_support = false;
        binary_size_prefix = false;
        cd_bookmarks = true;
        cd_tab_case = "sensitive";
        cd_tab_fuzzy = false;
        clear_filters_on_dir_change = false;
        collapse_preview = true;
        colorscheme = "default";
        column_ratios = "1,3,4";
        confirm_on_delete = "always";
        confirm_on_trash = "like_delete";
        dirname_in_tabs = false;
        display_free_space_in_status_bar = true;
        display_size_in_main_column = true;
        display_size_in_status_bar = true;
        display_tags_in_all_columns = true;
        draw_borders = "none";
        draw_progress_bar_in_status_bar = true;
        filter_dead_tabs_on_startup = false;
        flushinput = true;
        freeze_files = false;
        global_inode_type_filter = "";
        hidden_filter = "^\.";
        hint_collapse_threshold = 10;
        hostname_in_titlebar = true;
        idle_delay = 2000;
        iterm2_font_height = 11;
        iterm2_font_width = 8;
        line_numbers = false;
        max_console_history_size = 50;
        max_history_size = 20;
        metadata_deep_search = false;
        mouse_enabled = true;
        nested_ranger_warning = true;
        one_indexed = false;
        open_all_images = true;
        padding_right = true;
        preview_directories = true;
        preview_files = true;
        preview_images = true;
        preview_images_method = "ueberzug";
        preview_max_size = 0;
        preview_script = "${pkgs.ranger}/share/doc/ranger/config/scope.sh";
        relative_current_zero = false;
        renumber_tabs_on_tab_close = false;
        save_backtick_bookmark = true;
        save_console_history = true;
        save_tabs_on_exit = false;
        scroll_offset = 8;
        shorten_title = 3;
        show_cursor = false;
        show_hidden = true;
        show_hidden_bookmarks = true;
        show_selection_in_titlebar = true;
        sixel_dithering = "FloydSteinberg";
        size_in_bytes = false;
        sort = "natural";
        sort_case_insensitive = true;
        sort_directories_first = true;
        sort_reverse = false;
        sort_unicode = false;
        status_bar_on_top = false;
        tilde_in_titlebar = false;
        unicode_ellipsis = false;
        update_title = false;
        update_tmux_title = true;
        use_preview_script = true;
        vcs_aware = false;
        vcs_backend_bzr = "disabled";
        vcs_backend_git = "enabled";
        vcs_backend_hg = "disabled";
        vcs_backend_svn = "disabled";
        vcs_msg_length = 50;
        viewmode = "miller";
        w3m_delay = "0.02";
        w3m_offset = 0;
        wrap_plaintext_previews = false;
        wrap_scroll = false;
        xterm_alt_key = false;
      };
    };
  };
}
