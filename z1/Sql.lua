local uuid = require "uuid"
require "os"
require "z1.Handling"

uuid.set_rng(uuid.rng.urandom())

local text = ""

text = text .. [[CREATE TABLE molecula (
  `id` INTEGER PRIMARY KEY,
  `uid` TEXT NOT NULL,
  `name` TEXT NOT NULL,
  `z1` TEXT DEFAULT NULL,
  `term` TEXT NOT NULL,
  `another_names` TEXT DEFAULT '[]'
);

INSERT INTO molecula (`uid`, `name`, `z1`, `term`, `another_names`)
VALUES
]]

local sqls = {}
for file_name in io.popen('find "examples" -type f'):lines() do
    -- print(file_name)

    local f = io.open(file_name, "r")
    if not f then
        Error:new("File not found"):print()
        os.exit(1)
    end
    local content = f:read("*a")
    f:close()

    local handling = Handling:new()
    local error = handling:handle_sections(content)
    if error then
        error:print()
        os.exit(1)
    end

    local terms = {}
    for _, atom in ipairs(handling.atoms) do
        table.insert(terms, atom.symbol)
    end
    table.sort(terms)

    local names = {}
    for idx, name in ipairs(handling.names) do
        if idx == 1 then goto continue end
        table.insert(names, '"' .. name .. '"')
        ::continue::
    end

    local sql = string.format("('%s', '%s', '%s', '%s', '%s')",
        uuid.v4(),
        handling.names[1],
        content,
        table.concat(terms),
        "[" .. table.concat(names, ",") .. "]"
    )

    table.insert(sqls, sql)
end

text = text .. table.concat(sqls, ',') .. ";"

---@type string
local out_file_name = arg[1] or "out"

local out_file = io.open(out_file_name, "w")
if not out_file then
    Error:new("Problemas ao criar arquivo de saída"):print()
    os.exit(1)
end
out_file:write(text)
out_file:close()