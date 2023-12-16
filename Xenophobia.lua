-- holyjoey.
-- V1.0

local regionKick = {
  [0] = "English",
  [1] = "French",
  [2] = "German",
  [3] = "Italian",
  [4] = "Spanish",
  [5] = "Brazilian",
  [6] = "Polish",
  [7] = "Russian",
  [8] = "Korean",
  [9] = "Chinese Traditional",
  [10] = "Japanese",
  [11] = "Mexican",
  [12] = "Chinese Simplified",
}
local aids = menu.add_feature("Xenophobia", "parent", 0)

for k, v in pairs(regionKick) do
menu.add_feature("Byebye " .. v, "toggle", aids.id, function(f)
    while f.on do
        if not network.is_session_started() then
            return
        end

        for i = 0, 31 do
            if player.is_player_valid(i) and i ~= player.player_id() then
                if script.get_global_i(1886967 + 1 + (i * 609) + 10 + 121) == k then
                    menu.notify("Getting rid of " .. player.get_player_name(i).. " for being inferior")
                    menu.get_feature_by_hierarchy_key("online.online_players.player_"..i..".fragment_crash"):toggle() -- sends crash
                end
            end
        end
        system.wait()
    end
end)
end

menu.add_player_feature("Xenophobia Test", "action", 0, function(feat, pid)
  menu.notify("Xenophobia Test Result: " .. regionKick[script.get_global_i(1886967 + 1 + (pid * 609) + 10 + 121)])
end)