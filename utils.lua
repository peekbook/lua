local stringutils = {}

function stringutils.isEmpty(str)
    return str == nil or str == ""
end

function stringutils.isNotEmpty(str)
    return not stringutils.isEmpty(str)
end

function stringutils.isNumber(str)
    return tonumber(str) ~= nil
end

function stringutils.isBoolean(str)
    return str == "true" or str == "false"
end

return stringutils