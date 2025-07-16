{ ... }:
{
  programs.aerospace = {
    enable = true;
    userSettings = {
      after-startup-command = [
        "exec-and-forget borders active_color=0xffe1e3e4 inactive_color=0xff494d64 width=5.0"
      ];
      start-at-login = true;

      enable-normalization-flatten-containers = true;
      enable-normalization-opposite-orientation-for-nested-containers = true;

      accordion-padding = 30;
      default-root-container-layout = "tiles";
      default-root-container-orientation = "auto";

      on-focused-monitor-changed = [ "move-mouse monitor-lazy-center" ];

      automatically-unhide-macos-hidden-apps = false;

      key-mapping = {
        preset = "qwerty";
      };

      gaps = {
        inner.horizontal = 10;
        inner.vertical = 10;
        outer.left = 10;
        outer.bottom = 10;
        outer.top = 10;
        outer.right = 10;
      };

      mode = {
        main = {
          binding = {
            # Layouts
            "alt-slash" = "layout tiles horizontal vertical";
            "alt-comma" = "layout accordion horizontal vertical";

            # Focus
            "alt-h" = "focus left";
            "alt-j" = "focus down";
            "alt-k" = "focus up";
            "alt-l" = "focus right";

            # Move
            "alt-shift-h" = "move left";
            "alt-shift-j" = "move down";
            "alt-shift-k" = "move up";
            "alt-shift-l" = "move right";

            # Resize
            "alt-minus" = "resize smart -50";
            "alt-equal" = "resize smart +50";

            "alt-f" = "fullscreen";

            # Workspaces (alt-<key>)
            "alt-1" = "workspace 1";
            "alt-2" = "workspace 2";
            "alt-3" = "workspace 3";
            "alt-4" = "workspace 4";
            "alt-5" = "workspace 5";
            "alt-6" = "workspace 6";
            "alt-7" = "workspace 7";
            "alt-8" = "workspace 8";
            "alt-9" = "workspace 9";

            "alt-a" = "workspace A";
            "alt-b" = "workspace B";
            "alt-c" = "workspace C";
            "alt-d" = "workspace D";
            "alt-e" = "workspace E";
            "alt-g" = "workspace G";
            "alt-i" = "workspace I";
            "alt-m" = "workspace M";
            "alt-n" = "workspace N";
            "alt-o" = "workspace O";
            "alt-q" = "workspace Q";
            "alt-r" = "workspace R";
            "alt-s" = "workspace S";
            "alt-u" = "workspace U";
            "alt-v" = "workspace V";
            "alt-w" = "workspace W";
            "alt-x" = "workspace X";
            "alt-y" = "workspace Y";
            "alt-z" = "workspace Z";

            # Move node to workspace (alt-shift-<key>)
            "alt-shift-1" = "move-node-to-workspace 1";
            "alt-shift-2" = "move-node-to-workspace 2";
            "alt-shift-3" = "move-node-to-workspace 3";
            "alt-shift-4" = "move-node-to-workspace 4";
            "alt-shift-5" = "move-node-to-workspace 5";
            "alt-shift-6" = "move-node-to-workspace 6";
            "alt-shift-7" = "move-node-to-workspace 7";
            "alt-shift-8" = "move-node-to-workspace 8";
            "alt-shift-9" = "move-node-to-workspace 9";

            "alt-shift-a" = "move-node-to-workspace A";
            "alt-shift-b" = "move-node-to-workspace B";
            "alt-shift-c" = "move-node-to-workspace C";
            "alt-shift-d" = "move-node-to-workspace D";
            "alt-shift-e" = "move-node-to-workspace E";
            "alt-shift-g" = "move-node-to-workspace G";
            "alt-shift-i" = "move-node-to-workspace I";
            "alt-shift-m" = "move-node-to-workspace M";
            "alt-shift-n" = "move-node-to-workspace N";
            "alt-shift-o" = "move-node-to-workspace O";
            "alt-shift-q" = "move-node-to-workspace Q";
            "alt-shift-r" = "move-node-to-workspace R";
            "alt-shift-s" = "move-node-to-workspace S";
            "alt-shift-u" = "move-node-to-workspace U";
            "alt-shift-v" = "move-node-to-workspace V";
            "alt-shift-w" = "move-node-to-workspace W";
            "alt-shift-x" = "move-node-to-workspace X";
            "alt-shift-y" = "move-node-to-workspace Y";
            "alt-shift-z" = "move-node-to-workspace Z";

            # Workspace navigation / monitor move
            "alt-tab" = "workspace-back-and-forth";
            "alt-shift-tab" = "move-workspace-to-monitor --wrap-around next";

            # Enter service mode
            "alt-shift-semicolon" = "mode service";
          };
        };

        service = {
          binding = {
            "esc" = [
              "reload-config"
              "mode main"
            ];
            "r" = [
              "flatten-workspace-tree"
              "mode main"
            ];
            "f" = [
              "layout floating tiling"
              "mode main"
            ];
            "backspace" = [
              "close-all-windows-but-current"
              "mode main"
            ];

            # Joining containers
            "alt-shift-h" = [
              "join-with left"
              "mode main"
            ];
            "alt-shift-j" = [
              "join-with down"
              "mode main"
            ];
            "alt-shift-k" = [
              "join-with up"
              "mode main"
            ];
            "alt-shift-l" = [
              "join-with right"
              "mode main"
            ];

            # Volume
            "down" = "volume down";
            "up" = "volume up";
            "shift-down" = [
              "volume set 0"
              "mode main"
            ];
          };
        };
      };
    };
  };
}
