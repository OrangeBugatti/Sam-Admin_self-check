
    hook.Add("PlayerNoClip", "SAM.CanNoClip", function(ply, state)
        if not state then
            return true
        end

        if ply:HasPermission("can_noclip") then
            if not ply:HasPermission("bypass_duty") and ply:Team() ~= TEAM_STAFF then
                if SERVER then
                    sam.player.send_message(ply, "You must be on duty to use {S Red} command.", {
                        S = "noclip"
                    })
                end

                return false
            end

             return true
        end
    end)
