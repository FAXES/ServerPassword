Locales = {}

function translate(messageName, ...)
    local message = Locales[Config.Locale][messageName]
    return string.format(message, ...)
end