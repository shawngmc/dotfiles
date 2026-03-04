-- WirePlumber
-- Route applications to virtual output sinks

lutils = require ("linking-utils")
log = Log.open_topic ("s-linking")

-- Map application names to target virtual sinks
local routing_table = {
  -- Browser
  ["Google Chrome"]     = "browser_output",
  ["Firefox"]           = "browser_output",

  -- Music
  ["Spotify"]           = "music_output",

  -- Game
  ["World of Warcraft"] = "game_output",
  ["Nioh 3"]            = "game_output",

  -- Voice/Chat
  -- Discord can be 'WEBRTC VoiceEngine'
  ["Discord"]= "voice_output",
  ["WEBRTC VoiceEngine"]= "voice_output",
}

SimpleEventHook {
  name = "linking/find-user-target",
  before = "linking/find-defined-target",
  interests = {
    EventInterest {
      Constraint { "event.type", "=", "select-target" },
    },
  },
  execute = function (event)
    local source, om, si, si_props, si_flags, target =
        lutils:unwrap_select_target_event (event)

    -- bypass the hook if the target is already picked up
    if target then
      return
    end

    -- only handle output streams
    if si_props ["item.node.direction"] ~= "output" then
      return
    end

    local app_name = si_props ["application.name"]
    local target_sink = routing_table [app_name]

    if not target_sink then
      return
    end

    log:info (si, string.format (
      "find-user-target: routing '%s' to '%s'", app_name, target_sink))

    for lnkbl in om:iterate { type = "SiLinkable" } do
      local lnkbl_props = lnkbl.properties
      if lnkbl_props ["node.name"] == target_sink then
        local passthrough_compatible, can_passthrough =
            lutils.checkPassthroughCompatibility (si, lnkbl)
        if passthrough_compatible then
          log:info (si, string.format (
            "find-user-target: found '%s', linking", target_sink))
          si_flags.can_passthrough = can_passthrough
          si_flags.has_defined_target = true
          si_flags.has_node_defined_target = true
          event:set_data ("target", lnkbl)
          return
        else
          log:warning (si, string.format (
            "find-user-target: '%s' found but passthrough incompatible", target_sink))
        end
      end
    end

    log:warning (si, string.format (
      "find-user-target: target sink '%s' not found in object manager", target_sink))
  end
}:register ()
