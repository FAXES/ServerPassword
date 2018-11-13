------------------------------------
-- Server Password, Made by FAXES --
------------------------------------

--- CONFIG ---


---------------------------------------------------------------------------
local ped = GetPlayerPed(-1)
local passwordPassed = false

function KeyboardInput(textEntry, inputText, maxLength) -- Thanks to Lucifer for the function.
    AddTextEntry('FMMC_KEY_TIP1', textEntry)
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", inputText, "", "", "", maxLength)
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        return result
    else
        Citizen.Wait(500)
        return nil
    end
end

function drawText(text, x, y)
	local resx, resy = GetScreenResolution()
	SetTextFont(0)
	SetTextScale(0.8, 0.8)
	SetTextProportional(true)
	SetTextColour(41, 170, 226, 255)
	SetTextCentre(true)
	SetTextDropshadow(0, 0, 0, 0, 0)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText((float(x) / 1.5) / resx, ((float(y) - 6) / 1.5) / resy)
end

function float(num)
	num = num + 0.00001
	return num
end

-------------------------------------------------------------------------------------------------------------------------------
AddEventHandler('onClientMapStart', function()
    Wait(1000)
    FreezeEntityPosition(ped, true)
    TriggerServerEvent("Fax:CheckPassword", KeyboardInput("Enter server Password", "", 30))

end)

RegisterNetEvent('Fax:PassedPassword')
AddEventHandler('Fax:PassedPassword', function(bool)
        FreezeEntityPosition(ped, false)
        TriggerEvent('chatMessage', "^2Passed Password!")
end)