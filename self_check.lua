
function CustomCheck(ply)
    if IsValid(ply) and ply:IsPlayer() and ply:IsAdmin() then
        if ply:Team() == TEAM_STAFF or ply:GetUserGroup() != "admin" then
            return true
        else
            return false, "You must be on the TEAM_STAFF team or have a rank above admin to use this command."
        end
    end
end

hook.Add("SAMCustomCheck", "CustomCheck",
-- checks if the user is on the correct staff job before allowing admin commands
