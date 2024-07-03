
local BypassDutyCommands = {
    ["pm"] = true,
    ["asay"] = true,
    ["sasay"] = true,
    ["time"] = true,
    ["motd"] = true,
    ["menu"] = true,
    ["cleardecals"] = true
}

sam.permissions.add("bypass_duty", nil, "admin")

hook.Add("SAM.CanRunCommand", "SAM:RequireDuty", function(Player, Command)
    if not IsValid(Player) or not Player:IsStaff() then return end
    if Player:HasPermission("bypass_duty") then return end

    if Player:Team() ~= TEAM_STAFF and not BypassDutyCommands[Command] then
        sam.player.send_message(Player, "You must be on duty to use {S Red} command.", {
            S = Command
        })

        return false
    end
end)
