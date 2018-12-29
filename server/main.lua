------------------------------
-- Server Password, Made by --
--  FAXES & GlitchDetector  --
------------------------------

local Timeouts = {}
local AttemptsRemaining = {}
local SuccessfullyLoggedInUsers = {}

AddEventHandler('playerConnecting', function(name, setMessage, deferrals)
    local playerIdentifier = GetPlayerIdentifier(source, 1)
    local timeout = Timeouts[playerIdentifier]

    if timeout and timeout > os.time() then
        local sexyFormattedTime = GetSexyFormattedTime(timeout - os.time())
        deferrals.defer()
        local deferralMessage = translate('soft_ban', sexyFormattedTime)
        deferrals.update(deferralMessage)
        Wait(500)
        deferrals.done(deferralMessage)
    end

    AttemptsRemaining[playerIdentifier] = Config.initialAttempts
    SuccessfullyLoggedInUsers[playerIdentifier] = false
end)

RegisterServerEvent('Fax:ServerPassword:Initialize')
AddEventHandler('Fax:ServerPassword:Initialize', function()
    local _source = source
    local playerIdentifier = GetPlayerIdentifier(_source, 1)

    if not IsPlayerAceAllowed(_source, 'Bypass') then
        TriggerClientEvent('Fax:ServerPassword:ShowPasswordPrompt', _source, AttemptsRemaining[playerIdentifier])
        setupEntryTimeoutIfNeeded(playerIdentifier, _source)
    else
        HandleSuccessfulLogin(playerIdentifier, _source)
    end
end)

function setupEntryTimeoutIfNeeded(playerIdentifier, source)
    if Config.entryTimeout == 0 then
        return
    end

    Citizen.CreateThread(function()
        Wait(Config.entryTimeout * 1000)
        if not SuccessfullyLoggedInUsers[playerIdentifier] then
            DropPlayer(source, translate('entry_timeout'))
        end
    end)
end

RegisterServerEvent('Fax:ServerPassword:CheckPassword')
AddEventHandler('Fax:ServerPassword:CheckPassword', function(newPassword)
    local playerIdentifier = GetPlayerIdentifier(source, 1)

    if newPassword == Config.password then
        HandleSuccessfulLogin(playerIdentifier, source)
    else
        local attempts = AttemptsRemaining[playerIdentifier] - 1

        if attempts <= 0 then
            Timeout(playerIdentifier)
            DropPlayer(source, translate('invalid_password'))
        else
            AttemptsRemaining[playerIdentifier] = attempts
            TriggerClientEvent('Fax:ServerPassword:ShowPasswordPrompt', source, attempts)
        end
    end
end)

function HandleSuccessfulLogin(playerIdentifier, source)
    TriggerClientEvent('Fax:ServerPassword:PassedPassword', source)
    TriggerClientEvent('chatMessage', source, translate('successful_login'))
    SuccessfullyLoggedInUsers[playerIdentifier] = true
end

function Timeout(playerIdentifier)
    Timeouts[playerIdentifier] = os.time() + Config.invalidPasswordTimeout
end

function GetSexyFormattedTime(timeInSeconds)
    timeInSeconds = tonumber(timeInSeconds)
    local hours = math.floor(timeInSeconds / 3600)
    local minutes = math.floor(timeInSeconds / 60 - (hours * 60))
    local seconds = math.floor(timeInSeconds - hours * 3600 - minutes * 60)

    if minutes > 0 then
        return string.format('%02d m, %02d s', minutes, seconds)
    end

    return string.format('%02d s', seconds)
end

-- A FaxDetector Project ;)