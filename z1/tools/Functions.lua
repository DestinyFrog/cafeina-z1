
---matches a pattern in string
---@param text string
---@param pattern string
---@param from number?
---@return string?, number?
function Match_substr(text, pattern, from)
    local start_s, end_s = string.find(text, pattern, from)
    if not start_s then return nil end
    return string.sub(text, start_s, end_s), end_s
end

function Split_string(txt, separator)
    for param in txt:gmatch("[^" .. (separator or "%s") .. "]+") do
        coroutine.yield(param)
    end
end