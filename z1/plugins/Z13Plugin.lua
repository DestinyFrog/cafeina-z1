require "z1.plugins.Plugin"
require "z1.tools.z13"

---@class Z13Plugin
---@field z13 Z13
Z13Plugin = {}

---construct Z13 plugin
---@param h Handling
---@return Z13Plugin
function Z13Plugin:new(h)
    local obj = {
        z13 = Z13:new(),
        atoms = h.atoms
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

---calcula posiçao dos atomos
---@param atom Atom?
---@param dad_atom Atom?
---@param ligation Ligation?
function Z13Plugin:calcAtomsPosition(atom, dad_atom, ligation)
    if atom == nil then atom = self.atoms[1] end
    if atom.already == true then return end

    local x = 0
    local y = 0
    local z = 0

    if dad_atom ~= nil and ligation ~= nil then
        local radius = atom.atomic_radius + dad_atom.atomic_radius
        if ligation.type == "iônica" then
            radius = radius + 60
        else
            radius = radius - 10
        end

        if not ligation.angle3d then
            ligation.angle3d = {(ligation.angle or 0)+90, 90}
        end

        local angle_theta_rad = math.pi * ligation.angle3d[1] / 180
        local angle_phi_rad = math.pi * ligation.angle3d[2] / 180

        x = dad_atom.x + radius * math.sin(angle_theta_rad) * math.cos(angle_phi_rad)
        y = dad_atom.y + radius * math.cos(angle_theta_rad)
        z = dad_atom.z + radius * math.sin(angle_theta_rad) * math.sin(angle_phi_rad)
    end

    atom.x = x
    atom.y = y
    atom.z = z
    atom.already = true

    for idx, lig in ipairs(atom.ligations) do
        self:calcAtomsPosition(lig.to, atom, lig)
    end
end

function Z13Plugin:drawAtom()
    for _, atom in ipairs(self.atoms) do
        if symbol == "X" then
            goto continue
        end

        self.z13:add(atom.color, atom.atomic_radius, atom.x, atom.y, atom.z)
        ::continue::
    end
    return nil
end

---build the z13
---@return string?, Error?
function Z13Plugin:build()
    self:calcAtomsPosition()

    local err = self:drawAtom()
    if err ~= nil then return nil, err end

    local z13_content, e = self.z13:build()
    return z13_content, e
end