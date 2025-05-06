local TlmGen = {}
local ffi = require("ffi")

function TlmGen._extract_validate_struct_size(struct_data)
    assert(type(struct_data) == "table", "Error: bad type for struct_data")
    local size = 0
    for _, member in ipairs(struct_data.members) do
        size = size + ffi.sizeof(member.type)
    end
    return size
end

function TlmGen._extract_validate_struct_mems(struct_data)
    assert(type(struct_data) == "table", "Error: bad type for struct_data")
    local members, indent = {}, "   "
    for _, member in ipairs(struct_data.members) do
        local n = member.name
        n = member.len and string.format("%s[%d]", n, member.len) or n
        local m = string.format(indent .. "%s %s;", member.type, n)
        table.insert(members, m)
    end
    return table.concat(members, "\n")
end

return TlmGen
