Z1_CSS = "z1/z1.css"
Z1_TEMP_SVG = "z1/z1.temp.svg"
PATTERN_FOLDER = "z1/patterns/"

---@class Error
---@field private message string
---@field line number?
Error = {}

---Constructs a error object
---@param message string
---@param line number?
---@return Error
function Error:new(message, line)
    local obj = {
        message = message,
        line = line
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

---Prints the error
function Error:print()
    if self.line then
        print(self.line .. ": " .. self.message)
    else
        print("Error: " .. self.message)
    end
end

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

---matches a pattern in string
---@param text string
---@param pattern string
---@param remove string
---@param from number?
---@return string?, number?
function Match_remove_substr(text, pattern, remove, from)
    local value, end_s = Match_substr(text, pattern, from):gsub(remove, "")
    return value, end_s
end

function Split_string(txt, separator)
    for param in txt:gmatch("[^" .. (separator or "%s") .. "]+") do
        coroutine.yield(param)
    end
end

function Dump(o, c)
    if c == nil then c = 0 end

    if type(o) == 'table' then
        if o.print == nil then
            local s = '{ '
            for k, v in pairs(o) do
                if type(k) ~= 'number' then k = '"' .. k .. '"' end
                s = s .. string.rep("\t", c) .. '\n[' .. k .. '] = ' .. Dump(v, c + 1) .. ','
            end
            return s .. '} '
        else
            return o:print():gsub("\n", "\n" .. string.rep("\t", c - 1))
        end
    else
        return tostring(o)
    end
end

---@alias LigationType "covalente" | "iônica" | "hidrogênio" | "covalente dativa"

---@alias EletronsType 1 | 2 | 3

---@class Ligation
---@field from Atom?
---@field to Atom?
---@field type LigationType
---@field eletrons EletronsType
---@field angle number?
---@field angle3d number[]
Ligation = {
    from = nil,
    to = nil
}

---Constructs a ligation object
---@param type LigationType?
---@param eletrons EletronsType?
---@param angle number?
---@return Ligation
function Ligation:new(type, eletrons, angle, angle3d)
    local obj = {
        type = type or "covalente",
        eletrons = eletrons or 1,
        angle = angle,
        angle3d = angle3d
    }

    setmetatable(obj, self)
    self.__index = self
    return obj
end

---@class AtomInfo
---@field symbol string
---@field atomic_radius number?
---@field atomic_number number
---@field color string?

---@type AtomInfo[]
AtomsInfo = {
    {
        symbol = "H",
        atomic_radius = 53.0,
        atomic_number = 1,
        color = "0x00aaaaff"
    },
    {
        symbol = "He",
        atomic_radius = 31.0,
        atomic_number = 2
    },
    {
        symbol = "Li",
        atomic_radius = 167.0,
        atomic_number = 3
    },
    {
        symbol = "Be",
        atomic_radius = 112.0,
        atomic_number = 4
    },
    {
        symbol = "B",
        atomic_radius = 87.0,
        atomic_number = 5,
        color = "0xdd00dd"
    },
    {
        symbol = "C",
        atomic_radius = 67.0,
        atomic_number = 6,
        color = "0xa200aaff"
    },
    {
        symbol = "N",
        atomic_radius = 56.0,
        atomic_number = 7,
        color = "0xa20000ff"
    },
    {
        symbol = "O",
        atomic_radius = 48.0,
        atomic_number = 8,
        color = "0xffa1a1"
    },
    {
        symbol = "F",
        atomic_radius = 42.0,
        atomic_number = 9,
        color = "0x660066"
    },
    {
        symbol = "Ne",
        atomic_radius = 38.0,
        atomic_number = 10
    },
    {
        symbol = "Na",
        atomic_radius = 190.0,
        atomic_number = 11,
        color = "0xaffff00"
    },
    {
        symbol = "Mg",
        atomic_radius = 145.0,
        atomic_number = 12
    },
    {
        symbol = "Al",
        atomic_radius = 118.0,
        atomic_number = 13
    },
    {
        symbol = "Si",
        atomic_radius = 111.0,
        atomic_number = 14
    },
    {
        symbol = "P",
        atomic_radius = 98.0,
        atomic_number = 15,
        color = "0xaaaa00"
    },
    {
        symbol = "S",
        atomic_radius = 88.0,
        atomic_number = 16,
        color = "0xffaaff"
    },
    {
        symbol = "Cl",
        atomic_radius = 79.0,
        atomic_number = 17,
        color = "0xa33aaff"
    },
    {
        symbol = "Ar",
        atomic_radius = 71.0,
        atomic_number = 18
    },
    {
        symbol = "K",
        atomic_radius = 243.0,
        atomic_number = 19
    },
    {
        symbol = "Ca",
        atomic_radius = 194.0,
        atomic_number = 20,
        color = "0xaffff00"
    },
    {
        symbol = "Sc",
        atomic_radius = 184.0,
        atomic_number = 21
    },
    {
        symbol = "Ti",
        atomic_radius = 176.0,
        atomic_number = 22
    },
    {
        symbol = "V",
        atomic_radius = 171.0,
        atomic_number = 23
    },
    {
        symbol = "Cr",
        atomic_radius = 166.0,
        atomic_number = 24
    },
    {
        symbol = "Mn",
        atomic_radius = 161.0,
        atomic_number = 25
    },
    {
        symbol = "Fe",
        atomic_radius = 156.0,
        atomic_number = 26
    },
    {
        symbol = "Co",
        atomic_radius = 152.0,
        atomic_number = 27
    },
    {
        symbol = "Ni",
        atomic_radius = 149.0,
        atomic_number = 28
    },
    {
        symbol = "Cu",
        atomic_radius = 145.0,
        atomic_number = 29
    },
    {
        symbol = "Zn",
        atomic_radius = 142.0,
        atomic_number = 30
    },
    {
        symbol = "Ga",
        atomic_radius = 136.0,
        atomic_number = 31
    },
    {
        symbol = "Ge",
        atomic_radius = 125.0,
        atomic_number = 32
    },
    {
        symbol = "As",
        atomic_radius = 114.0,
        atomic_number = 33
    },
    {
        symbol = "Se",
        atomic_radius = 103.0,
        atomic_number = 34
    },
    {
        symbol = "Br",
        atomic_radius = 94.0,
        atomic_number = 35
    },
    {
        symbol = "Kr",
        atomic_radius = 88.0,
        atomic_number = 36
    },
    {
        symbol = "Rb",
        atomic_radius = 265.0,
        atomic_number = 37
    },
    {
        symbol = "Sr",
        atomic_radius = 219.0,
        atomic_number = 38
    },
    {
        symbol = "Y",
        atomic_radius = 212.0,
        atomic_number = 39
    },
    {
        symbol = "Zr",
        atomic_radius = 206.0,
        atomic_number = 40
    },
    {
        symbol = "Nb",
        atomic_radius = 198.0,
        atomic_number = 41
    },
    {
        symbol = "Mo",
        atomic_radius = 190.0,
        atomic_number = 42
    },
    {
        symbol = "Tc",
        atomic_radius = 183.0,
        atomic_number = 43
    },
    {
        symbol = "Ru",
        atomic_radius = 178.0,
        atomic_number = 44
    },
    {
        symbol = "Rh",
        atomic_radius = 173.0,
        atomic_number = 45
    },
    {
        symbol = "Pd",
        atomic_radius = 169.0,
        atomic_number = 46
    },
    {
        symbol = "Ag",
        atomic_radius = 165.0,
        atomic_number = 47
    },
    {
        symbol = "Cd",
        atomic_radius = 161.0,
        atomic_number = 48
    },
    {
        symbol = "In",
        atomic_radius = 156.0,
        atomic_number = 49
    },
    {
        symbol = "Sn",
        atomic_radius = 145.0,
        atomic_number = 50
    },
    {
        symbol = "Sb",
        atomic_radius = 133.0,
        atomic_number = 51
    },
    {
        symbol = "Te",
        atomic_radius = 123.0,
        atomic_number = 52
    },
    {
        symbol = "I",
        atomic_radius = 115.0,
        atomic_number = 53
    },
    {
        symbol = "Xe",
        atomic_radius = 108.0,
        atomic_number = 54
    },
    {
        symbol = "Cs",
        atomic_radius = 298.0,
        atomic_number = 55
    },
    {
        symbol = "Ba",
        atomic_radius = 253.0,
        atomic_number = 56
    },
    {
        symbol = "La",
        atomic_radius = nil,
        atomic_number = 57
    },
    {
        symbol = "Ce",
        atomic_radius = nil,
        atomic_number = 58
    },
    {
        symbol = "Pr",
        atomic_radius = 247.0,
        atomic_number = 59
    },
    {
        symbol = "Nd",
        atomic_radius = 206.0,
        atomic_number = 60
    },
    {
        symbol = "Pm",
        atomic_radius = 205.0,
        atomic_number = 61
    },
    {
        symbol = "Sm",
        atomic_radius = 238.0,
        atomic_number = 62
    },
    {
        symbol = "Eu",
        atomic_radius = 231.0,
        atomic_number = 63
    },
    {
        symbol = "Gd",
        atomic_radius = 233.0,
        atomic_number = 64
    },
    {
        symbol = "Tb",
        atomic_radius = 225.0,
        atomic_number = 65
    },
    {
        symbol = "Dy",
        atomic_radius = 228.0,
        atomic_number = 66
    },
    {
        symbol = "Ho",
        atomic_radius = nil,
        atomic_number = 67
    },
    {
        symbol = "Er",
        atomic_radius = 226.0,
        atomic_number = 68
    },
    {
        symbol = "Tm",
        atomic_radius = 222.0,
        atomic_number = 69
    },
    {
        symbol = "Yb",
        atomic_radius = 222.0,
        atomic_number = 70
    },
    {
        symbol = "Lu",
        atomic_radius = 217.0,
        atomic_number = 71
    },
    {
        symbol = "Hf",
        atomic_radius = 208.0,
        atomic_number = 72
    },
    {
        symbol = "Ta",
        atomic_radius = 200.0,
        atomic_number = 73
    },
    {
        symbol = "W",
        atomic_radius = 193.0,
        atomic_number = 74
    },
    {
        symbol = "Re",
        atomic_radius = 188.0,
        atomic_number = 75
    },
    {
        symbol = "Os",
        atomic_radius = 185.0,
        atomic_number = 76
    },
    {
        symbol = "Ir",
        atomic_radius = 180.0,
        atomic_number = 77
    },
    {
        symbol = "Pt",
        atomic_radius = 177.0,
        atomic_number = 78
    },
    {
        symbol = "Au",
        atomic_radius = 174.0,
        atomic_number = 79
    },
    {
        symbol = "Hg",
        atomic_radius = 171.0,
        atomic_number = 80
    },
    {
        symbol = "Tl",
        atomic_radius = 156.0,
        atomic_number = 81
    },
    {
        symbol = "Pb",
        atomic_radius = 154.0,
        atomic_number = 82
    },
    {
        symbol = "Bi",
        atomic_radius = 143.0,
        atomic_number = 83
    },
    {
        symbol = "Po",
        atomic_radius = 135.0,
        atomic_number = 84
    },
    {
        symbol = "At",
        atomic_radius = nil,
        atomic_number = 85
    },
    {
        symbol = "Rn",
        atomic_radius = 120.0,
        atomic_number = 86
    },
    {
        symbol = "Fr",
        atomic_radius = 270.0,
        atomic_number = 87
    },
    {
        symbol = "Ra",
        atomic_radius = nil,
        atomic_number = 88
    },
    {
        symbol = "Ac",
        atomic_radius = nil,
        atomic_number = 89
    },
    {
        symbol = "Th",
        atomic_radius = nil,
        atomic_number = 90
    },
    {
        symbol = "Pa",
        atomic_radius = nil,
        atomic_number = 91
    },
    {
        symbol = "U",
        atomic_radius = nil,
        atomic_number = 92
    },
    {
        symbol = "Np",
        atomic_radius = nil,
        atomic_number = 93
    },
    {
        symbol = "Pu",
        atomic_radius = nil,
        atomic_number = 94
    },
    {
        symbol = "Am",
        atomic_radius = nil,
        atomic_number = 95
    },
    {
        symbol = "Cm",
        atomic_radius = nil,
        atomic_number = 96
    },
    {
        symbol = "Bk",
        atomic_radius = nil,
        atomic_number = 97
    },
    {
        symbol = "Cf",
        atomic_radius = nil,
        atomic_number = 98
    },
    {
        symbol = "Es",
        atomic_radius = nil,
        atomic_number = 99
    },
    {
        symbol = "Fm",
        atomic_radius = nil,
        atomic_number = 100
    },
    {
        symbol = "Md",
        atomic_radius = nil,
        atomic_number = 101
    },
    {
        symbol = "No",
        atomic_radius = nil,
        atomic_number = 102
    },
    {
        symbol = "Lr",
        atomic_radius = nil,
        atomic_number = 103
    },
    {
        symbol = "Rf",
        atomic_radius = nil,
        atomic_number = 104
    },
    {
        symbol = "Db",
        atomic_radius = nil,
        atomic_number = 105
    },
    {
        symbol = "Sg",
        atomic_radius = nil,
        atomic_number = 106
    },
    {
        symbol = "Bh",
        atomic_radius = nil,
        atomic_number = 107
    },
    {
        symbol = "Hs",
        atomic_radius = nil,
        atomic_number = 108
    },
    {
        symbol = "Mt",
        atomic_radius = nil,
        atomic_number = 109
    },
    {
        symbol = "Ds",
        atomic_radius = nil,
        atomic_number = 110
    },
    {
        symbol = "Rg",
        atomic_radius = nil,
        atomic_number = 111
    },
    {
        symbol = "Cn",
        atomic_radius = nil,
        atomic_number = 112
    },
    {
        symbol = "Nh",
        atomic_radius = nil,
        atomic_number = 113
    },
    {
        symbol = "Fl",
        atomic_radius = nil,
        atomic_number = 114
    },
    {
        symbol = "Mc",
        atomic_radius = nil,
        atomic_number = 115
    },
    {
        symbol = "Lv",
        atomic_radius = nil,
        atomic_number = 116
    },
    {
        symbol = "Ts",
        atomic_radius = nil,
        atomic_number = 117
    },
    {
        symbol = "Og",
        atomic_radius = nil,
        atomic_number = 118
    }
}

---search atoms info by symbol
---@param symbol string
---@return AtomInfo?
function AtomsInfo:find(symbol)
    for _, atom in ipairs(self) do
        if atom.symbol == symbol then
            return atom
        end
    end
    return nil
end

---@class Atom
---@field symbol string
---@field charge number
---@field ligations Ligation[]
---@field atomic_radius number?
---@field atomic_number number?
---@field ligation_num number
---@field parent Atom?
---@field parent_ligation Ligation?
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
        ligation_num = 0,
        parent = nil,
        x = nil,
        y = nil,
    }

    local data = AtomsInfo:find(symbol)

    if data then
        for key, field in pairs(data) do
            obj[key] = field
        end
    end

    setmetatable(obj, self)
    self.__index = self
    return obj
end

---add parent to atom
---@param parent_ligation Ligation
function Atom:set_parent(parent_ligation)
    self.parent = parent_ligation.from
    self.parent_ligation = parent_ligation
    self.ligation_num = self.ligation_num + 1
end

function Atom:add_ligation(ligation)
    table.insert(self.ligations, ligation)
    self.ligation_num = self.ligation_num + 1
end

function Atom:print()
    return "Atom {" ..
        "\n\tatomic number: " .. self.atomic_number ..
        "\n\tsymbol: " .. self.symbol ..
        "\n\tcharge: " .. self.charge ..
        "\n\tatomic radius: " .. self.atomic_radius ..
        "\n}"
end

---@class Handling
---@field tags string[]
---@field atoms Atom[]
---@field ligations Ligation[]
Handling = {
    tags = {},
    atoms = {},
    ligations = {}
}

---constructs Handling object
---@return Handling
function Handling:new()
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

--- Receives a line and split it into params
---@param line string
---@param separator string?
---@return string[]
function Handling:split_params(line, separator)
    local params = {}
    separator = separator or "%s"
    for param in line:gmatch("[^" .. separator .. "]+") do
        table.insert(params, param)
    end
    return params
end

--- Receives a line and remove comment
---@param line string
---@private
---@return string
function Handling:remove_comment(line)
    local comment_position = string.find(line, "%-%-")

    if comment_position then
        return line:sub(1, comment_position - 1)
    end
    return line
end

--- Receives a line (tag) and return tag
---@param line string
---@return (string|nil)
function Handling:handle_line_tag(line)
    local text = Match_substr(line, "@tag%s%a+"):gsub("@tag%s", "")
    if not text then return end
    table.insert(self.tags, text)
end

--- Receives a line and return a atom object
---@param line string
---@return Atom?, Error?
function Handling:handle_line_atom(line)
    local text = self:remove_comment(line)

    local symbol, end_symbol = Match_substr(text, "[A-Z][a-z]?")
    if not symbol then return nil, Error:new("symbol not found") end

    local charge_str, end_charge = Match_substr(text, "[+|-]%d")
    local charge = 0
    if charge_str then
        charge_str = charge_str:gsub("[+|-]", "")
        charge = tonumber(charge_str)
    end

    local atom = Atom:new(symbol, charge)
    table.insert(self.atoms, atom)

    local init_ligations = (end_charge and end_charge or end_symbol) + 1
    local ligations_str = line:sub(init_ligations)
    if not ligations_str then return end

    local my_Split_string = coroutine.wrap(Split_string)
    local ligation_key = my_Split_string(ligations_str)

    while ligation_key do
        if not self.ligations[ligation_key] then
            self.ligations[ligation_key] = Ligation:new()
        end

        if not self.ligations[ligation_key].from then
            self.ligations[ligation_key].from = atom
            atom:add_ligation(self.ligations[ligation_key])
        else
            self.ligations[ligation_key].to = atom
            atom:set_parent(self.ligations[ligation_key])
        end

        ligation_key = my_Split_string()
    end
end

---@param line string
---@return Error?
function Handling:handle_line_ligation(line)
    local ligation_tag = Match_substr(line, "%d+")

    local function str_to_type(p)
        if p == "c" then
            return "covalente"
        elseif p == 'd' then
            return "covalente dativa"
        elseif p == 'h' then
            return "hidrogênio"
        elseif p == 'i' then
            return "iônica"
        end
        return nil
    end

    local type_str = Match_substr(line, "[i|d|h|c];")
    local type = nil
    if type_str then
        type = str_to_type(type_str:gsub(";", ""))
    end

    local function str_to_eletron(p)
        if p == "-" then
            return 1
        elseif p == '=' then
            return 2
        elseif p == '%' then
            return 3
        end
    end

    local eletrons_str = Match_substr(line, "[-|=|%%]")
    local eletrons = str_to_eletron(eletrons_str)

    local angle_str = Match_substr(line, "%d+°")
    local angle = nil
    if angle_str then
        local s = string.gsub(angle_str, "°", "")
        angle = tonumber(s)
    end

    local angle_3d_str = Match_substr(line, "%b[]")
    local angle_3d = nil
    if angle_3d_str then
        local angle_x_str, end_angle_x = Match_substr(angle_3d_str, "-?%d+")
        local angle_y_str = Match_substr(angle_3d_str, "-?%d+", end_angle_x + 1)

        local angle_x = tonumber(angle_x_str)
        local angle_y = tonumber(angle_y_str)

        angle_3d = { angle_x, angle_y }
    end

    if not self.ligations[ligation_tag] then
        self.ligations[ligation_tag] = Ligation:new(type, eletrons, angle, angle_3d)
    else
        if type then self.ligations[ligation_tag].type = type end
        if eletrons then self.ligations[ligation_tag].eletrons = eletrons end
        if angle then self.ligations[ligation_tag].angle = angle end
        if angle_3d then self.ligations[ligation_tag].angle3d = angle_3d end
    end
    return nil
end

--- Receives a line and return a pattern object
---@param line string
---@return Error?
function Handling:handle_line_pattern(line)
    local pattern_name = Match_remove_substr(line, "@p%s[%a|_]+", "@p%s")

    local pattern = io.open(PATTERN_FOLDER .. pattern_name .. ".pre.z1", "r")
    if pattern == nil then
        return Error:new("Pattern '" .. pattern_name .. "' not found")
    end
    local pattern_content = pattern:read("*a")
    pattern:close()

    local params = self:split_params(line)

    local pattern_params = self:split_params(params[3], ",")
    for k, pattern_param in ipairs(pattern_params) do
        pattern_content = pattern_content:gsub("$" .. k, pattern_param)
    end

    return self:handle_sections(pattern_content)
end

function Handling:handle_line_name(line)
    local name = Match_remove_substr(line, "@name%s.+", "@name%s")
    self.name = name
end

--- Receives a text and return a table with tags, atoms and ligations
---@param text string
---@return Error?
function Handling:handle_sections(text)
    for line in text:gmatch("[^\n]+") do
        if string.find(line, "@name$s[%a+]") then
            self:handle_line_name(line)
        elseif string.find(line, "@tag %a+") then
            local tag = self:handle_line_tag(line)
            table.insert(self.tags, tag)
        elseif string.find(line, "@p ") then
            local error = self:handle_line_pattern(line)
            if error then return error end
        elseif string.find(line, "[A-Z][a-z]?%s[+|-0-9]?[%s%d+]*") then
            local atom, error = self:handle_line_atom(line)
            if error then return error end
        elseif string.find(line, "[%d+|@%a+][%s%d+°]?[%s@type-h|c|d|i]?[%s-|=|%%]?[%s%b[%d+%s%d+]]?") then
            local error = self:handle_line_ligation(line)
            if error then return error end
        end
    end

    return nil
end

function Handling:print()
    print("TAGS:")
    for _, tag in ipairs(self.tags) do
        print(tag)
    end

    print("\nATOMS:")
    for _, atom in ipairs(self.atoms) do
        print(atom.symbol)
        for k, l in ipairs(atom.ligations) do
            print("  " .. k .. " - " .. l.to.symbol)
        end
    end

    print("\nLIGATIONS:")
    for key, ligation in pairs(self.ligations) do
        print(ligation.angle)
        -- print(key .. " | " .. ligation.from.symbol .. " -> " .. ligation.to.symbol .. " | " .. ligation.angle)
    end
end

local content = CONTENT

local handling = Handling:new()
local error = handling:handle_sections(content)
if error then
    error:print()
    os.exit(1)
end

---@type string
local plugin_name = arg[1]

---@type Plugin?
local plugin = nil


---@class Svg
---@field content string
Svg = {
    content = ""
}

---Construct new SVG
---@return Svg
function Svg:new()
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

---Draw a line between point a (ax, ay) and b (bx, by)
---@param ax number
---@param ay number
---@param bx number
---@param by number
---@param className string?
function Svg:line(ax, ay, bx, by, className)
    if className == nil then className = 'svg-ligation' end
    self.content = string.format('%s<line class="%s" x1="%g" y1="%g" x2="%g" y2="%g"></line>', self.content, className,
        ax, ay, bx, by)
end

---Draw a circle centered in (x, y) with radius (r)
---@param x number
---@param y number
---@param r number
function Svg:circle(x, y, r)
    self.content = string.format('%s<circle class="svg-eletrons" cx="%g" cy="%g" r="%g"></circle>',
        self.content, x, y, r)
end

---Draw a text (symbol) in (x, y)
---@param symbol string
---@param x number
---@param y number
function Svg:text(symbol, x, y)
    self.content = string.format('%s<text class="svg-element svg-element-%s" x="%g" y="%g">%s</text>',
        self.content, symbol, x, y, symbol)
end

---Draw a subtext (symbol) in (x, y)
---@param symbol string
---@param x number
---@param y number
function Svg:subtext(symbol, x, y)
    self.content = string.format(
        '%s<circle class="svg-element-charge-border" cx="%g" cy="%g"/><text class="svg-element-charge" x="%g" y="%g">%s</text>',
        self.content, x, y, x, y, symbol)
end

---Build all svg in template
---@param width number
---@param height number
---@return string?, Error?
function Svg:build(width, height)
    local css_file = io.open(Z1_CSS, "r")
    if css_file == nil then
        return nil, Error:new("Template 'z1.css' não encontrado")
    end

    local css = css_file:read("*a")
    css = css:gsub("[\n|\t]", "")
    io.close(css_file)

    local svg_template_file = io.open(Z1_TEMP_SVG, "r")
    if svg_template_file == nil then
        return nil, Error:new("Template 'z1.temp.svg' não encontrado")
    end

    local svg_template = svg_template_file:read("*a")
    io.close(svg_template_file)

    local svg = string.format(svg_template, width, height, css, self.content)
    return svg, nil
end

---@class Z13
---@field atoms table[]
Z13 = {}

---construct new z13
---@return Z13
function Z13:new()
    local obj = {
        atoms = {}
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

---add new atom to z13
---@param color string
---@param radius number
---@param x number
---@param y number
---@param z number
function Z13:add(color, radius, x, y, z)
    local atom = {
        color = color,
        radius = radius,
        x = x,
        y = y,
        z = z
    }

    table.insert(self.atoms, atom)
end

function Z13:build(width, height, depth)
    local content = string.format("%.2f %.2f %.2f", width, height, depth)
    for _, atom in ipairs(self.atoms) do
        content = string.format("%s\n%s %.2f %.2f %.2f %.2f", content, atom.color, atom.radius, atom.x, atom.y, atom.z)
    end
    return content
end

BORDER = 20
STANDARD_LIGATION_SIZE = 30

---@class Plugin
---@field svg Svg
---@field tags string[]
---@field atoms Atom[]
---@field ligations Ligation[]
Plugin = {
    svg = Svg:new()
}

---constroi um novo Plugin padrao
---@param o Handling
---@return Plugin
function Plugin:new(o)
    local obj = {
        tags = o.tags,
        atoms = o.atoms,
        ligations = o.ligations
    }

    setmetatable(obj, self)
    self.__index = self
    return obj
end

---build the svg
---@return string?, Error?
function Plugin:build()
    self:calcAtomsPosition()

    local err = self:measureBounds()
    if err ~= nil then return nil, err end

    err = self:drawAtom()
    if err ~= nil then return nil, err end

    err = self:drawLigation()
    if err ~= nil then return nil, err end

    local svg_content, e = self.svg:build(self.width, self.height)
    return svg_content, e
end

---calcula posiçao dos atomos
---@param atom Atom?
---@param dad_atom Atom?
---@param ligation Ligation?
---@param order number
function Plugin:calcAtomsPosition(atom, dad_atom, ligation, order)
    if atom == nil then atom = self.atoms[1] end
    if atom.already == true then return end

    if ligation and dad_atom then
        if not ligation.angle then
            local default_dad_ligation = atom.parent_ligation and atom.parent_ligation.angle or 0
            local antipodal_pai = default_dad_ligation + 180
            local angulo_fatia = 360 / atom.ligation_num
            local angulo = antipodal_pai + angulo_fatia * (order + (atom.parent_ligation and 1 or 0))
            ligation.angle = math.floor(angulo % 360)
        end
    end

    local x = 0
    local y = 0
    if dad_atom ~= nil and ligation then
        local angle_rad = math.pi * ligation.angle / 180
        x = dad_atom.x + math.cos(angle_rad) * STANDARD_LIGATION_SIZE
        y = dad_atom.y + math.sin(angle_rad) * STANDARD_LIGATION_SIZE
    end

    atom.x = x
    atom.y = y
    atom.already = true

    for idx, lig in ipairs(atom.ligations) do
        self:calcAtomsPosition(lig.to, atom, lig, idx)
    end
end

---draw the atoms
---@return Error?
function Plugin:drawAtom()
    return Error:new("Method drawAtom not Implemented")
end

---draw the ligations
---@return Error?
function Plugin:drawLigation()
    return Error:new("Method drawLigation not Implemented")
end

function Plugin:measureBounds()
    local min_x = 0
    local min_y = 0
    local max_x = 0
    local max_y = 0

    for _, atom in ipairs(self.atoms) do
        local x = atom["x"]
        local y = atom["y"]

        if atom["symbol"] == "X" then
            goto continue
        end

        if x > max_x then max_x = x end
        if y > max_y then max_y = y end
        if x < min_x then min_x = x end
        if y < min_y then min_y = y end

        ::continue::
    end

    local cwidth = max_x + -min_x
    local cheight = max_y + -min_y

    self.width = BORDER * 2 + cwidth
    self.height = BORDER * 2 + cheight

    self.center_x = BORDER + math.abs(min_x)
    self.center_y = BORDER + math.abs(min_y)

    return nil
end

if plugin_name == "standard" then
    STANDARD_ATOM_RADIUS = 9

    StandardPlugin = {}

    function StandardPlugin:new(h)
        local obj = StandardPlugin
        local p = Plugin:new(h)
        setmetatable(self, obj)
        self.__index = p
        return obj
    end

    function StandardPlugin:drawAtom()
        for _, atom in ipairs(self.atoms) do
            local symbol = atom["symbol"]
            local x = self.center_x + atom["x"]
            local y = self.center_y + atom["y"]

            if symbol == "X" then
                goto continue
            end

            self.svg:text(atom["symbol"], x, y)

            local charge = atom["charge"]

            if charge ~= 0 then
                if charge == 1 then
                    charge = "+"
                end
                if charge == -1 then
                    charge = "-"
                end
                self.svg:subtext(charge, x + STANDARD_ATOM_RADIUS, y - STANDARD_ATOM_RADIUS)
            end

            ::continue::
        end

        return nil
    end

    STANDARD_DISTANCE_BETWEEN_LIGATIONS = 20

    STANDARD_WAVES = {
        { 0 },
        { STANDARD_DISTANCE_BETWEEN_LIGATIONS / 2, -STANDARD_DISTANCE_BETWEEN_LIGATIONS / 2 },
        { STANDARD_DISTANCE_BETWEEN_LIGATIONS,     0,                                       -STANDARD_DISTANCE_BETWEEN_LIGATIONS }
    }

    function StandardPlugin:drawLigation()
        for _, ligation in pairs(self.ligations) do
            local from_atom = ligation.from
            local to_atom = ligation.to

            if to_atom.symbol == "X" then
                goto continue
            end

            local ax = self.center_x + from_atom.x
            local ay = self.center_y + from_atom.y
            local bx = self.center_x + to_atom.x
            local by = self.center_y + to_atom.y

            local angles = STANDARD_WAVES[ligation.eletrons]

            local a_angle = math.atan((by - ay), (bx - ax))
            local b_angle = math.pi + a_angle

            if ligation.type ~= "iônica" then
                for _, angle in ipairs(angles) do
                    local nax = ax + math.cos(a_angle - (math.pi * angle / 180)) * STANDARD_ATOM_RADIUS
                    local nay = ay + math.sin(a_angle - (math.pi * angle / 180)) * STANDARD_ATOM_RADIUS

                    local nbx = bx + math.cos(b_angle + (math.pi * angle / 180)) * STANDARD_ATOM_RADIUS
                    local nby = by + math.sin(b_angle + (math.pi * angle / 180)) * STANDARD_ATOM_RADIUS

                    self.svg:line(nax, nay, nbx, nby)
                end
            end

            ::continue::
        end

        return nil
    end

    plugin = StandardPlugin:new(handling)
elseif plugin_name == "z13" then
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

    function Z13Plugin:measureBounds()
        local min_x = 0
        local min_y = 0
        local min_z = 0
        local max_x = 0
        local max_y = 0
        local max_z = 0

        for _, atom in ipairs(self.atoms) do
            local x = atom["x"]
            local y = atom["y"]
            local z = atom["z"]

            if atom["symbol"] == "X" then
                goto continue
            end

            if x > max_x then max_x = x end
            if y > max_y then max_y = y end
            if z > max_z then max_z = z end
            if x < min_x then min_x = x end
            if y < min_y then min_y = y end
            if z < min_z then min_z = z end

            ::continue::
        end

        self.width = max_x + math.abs(min_x)
        self.height = max_y + math.abs(min_y)
        self.depth = max_z + math.abs(min_z)

        self.center_x = min_x + self.width / 2
        self.center_y = min_y + self.height / 2
        self.center_z = min_z + self.depth / 2

        return nil
    end

    ---calcula posiçao dos atomos
    ---@param atom Atom?
    ---@param dad_atom Atom?
    ---@param ligation Ligation?
    function Z13Plugin:calcAtomsPosition(atom, dad_atom, ligation, order)
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
                radius = radius - 20
            end

            if ligation and dad_atom then
                if not ligation.angle then
                    local default_dad_ligation = atom.parent_ligation and atom.parent_ligation.angle or 0
                    local antipodal_pai = default_dad_ligation
                    local angulo_fatia = 360 / dad_atom.ligation_num
                    local angulo = antipodal_pai + angulo_fatia * (order - 1 + (atom.parent_ligation and 1 or 0))
                    ligation.angle = math.floor(angulo % 360)
                end
            end

            if not ligation.angle3d then
                ligation.angle3d = { (ligation.angle or 0) + 90, 90 }
            end

            local angle_theta_rad = math.pi * ligation.angle3d[1] / 180
            local angle_phi_rad = math.pi * ligation.angle3d[2] / 180

            x = dad_atom.x + radius * math.sin(angle_theta_rad) * math.cos(angle_phi_rad)
            y = dad_atom.y + radius * math.cos(angle_theta_rad)
            z = dad_atom.z + radius * math.sin(angle_theta_rad) * math.sin(angle_phi_rad)
        end

        atom.x = math.floor(x)
        atom.y = math.floor(y)
        atom.z = math.floor(z)
        atom.already = true

        for idx, lig in ipairs(atom.ligations) do
            self:calcAtomsPosition(lig.to, atom, lig, idx)
        end
    end

    function Z13Plugin:drawAtom()
        for _, atom in ipairs(self.atoms) do
            if atom.symbol == "X" then
                goto continue
            end

            self.z13:add(atom.color, atom.atomic_radius,
                atom.x - self.center_x,
                atom.y - self.center_y,
                atom.z - self.center_z
            )
            ::continue::
        end
        return nil
    end

    ---build the z13
    ---@return string?, Error?
    function Z13Plugin:build()
        self:calcAtomsPosition()
        self:measureBounds()

        local err = self:drawAtom()
        if err ~= nil then return nil, err end

        local z13_content, e = self.z13:build(self.width, self.height, self.depth)
        return z13_content, e
    end

    plugin = Z13Plugin:new(handling)
end

if plugin == nil then
    Error:new("Plugin not found"):print()
    os.exit(1)
end

local svg_content, err = plugin:build()
if err ~= nil then err:print() end

print(svg_content)