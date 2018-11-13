------------------------------------
-- Server Password, Made by FAXES --
------------------------------------

--- CONFIG ---

password = "fax" -- Set server password here
kickMessage = "Invalid Password"
timeRanOutMsg = "You ran out of time to enter the password"

----------------------------------------------------
RegisterServerEvent('Fax:CheckPassword')
AddEventHandler('Fax:CheckPassword', function(Newpassword)
    local clPassword = Newpassword
    local s = source

    if clPassword == password then
        TriggerClientEvent("Fax:PassedPassword", s, true)
    elseif clPassword == not password then
        DropPlayer(s, kickMessage)
    else
        DropPlayer(s, kickMessage)
    end
end)