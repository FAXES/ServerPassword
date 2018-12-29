------------------------------
-- Server Password, Made by --
--  FAXES & GlitchDetector  --
------------------------------

AddEventHandler('onClientMapStart', function()
    Wait(1000)
    FreezeEntityPosition(GetPlayerPed(-1), true)
    TriggerServerEvent('Fax:ServerPassword:Initialize')
end)

RegisterNetEvent('Fax:ServerPassword:ShowPasswordPrompt')
AddEventHandler('Fax:ServerPassword:ShowPasswordPrompt', function(attempts)
    local password = KeyboardInput(getPasswordPrompt(attempts), '', 30)
    TriggerServerEvent('Fax:ServerPassword:CheckPassword', password)
end)

function getPasswordPrompt(attempts)
    if attempts == 1 then
        return translate('password_prompt_singular')
    end
    return translate('password_prompt_plural', attempts)
end

RegisterNetEvent('Fax:ServerPassword:PassedPassword')
AddEventHandler('Fax:ServerPassword:PassedPassword', function()
    FreezeEntityPosition(GetPlayerPed(-1), false)
end)

function KeyboardInput(textEntry, inputText, maxLength) -- Thanks to Flatracer for the function.
    AddTextEntry('FMMC_KEY_TIP1', textEntry)
    DisplayOnscreenKeyboard(1, 'FMMC_KEY_TIP1', '', inputText, '', '', '', maxLength)

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        return result
    end
    
    Citizen.Wait(500)
    return nil
end

-- A FaxDetector Project ;)