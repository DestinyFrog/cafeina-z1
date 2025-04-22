require "z1.types.Ligation"
require "z1.types.AtomsInfo"

---@class Atom
---@field symbol string
---@field charge number
---@field ligations Ligation[]
---@field atomic_radius number?
---@field atomic_number number?
Atom = {
    last_id = 1
}

---Constructs a atom object
---@param symbol string
---@param charge number?
---@return Atom
function Atom:new(symbol, charge)
    Atom.last_id = Atom.last_id + 1

    local obj = {
        id = Atom.last_id,
        symbol = symbol,
        charge = charge or 0,
        ligations = {},
        x = nil,
        y = nil,
    }

    local data = AtomsInfo:find(symbol)
    for key, field in pairs(data) do
        obj[key] = field
    end

    setmetatable(obj, self)
    self.__index = self
    return obj
end

