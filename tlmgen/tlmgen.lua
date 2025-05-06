local TlmGen = {}
local ffi = require("ffi")
local utl = require("tlmgen.tlmgen_utils")

local function create_cdef(struct_mems, struct_type)
    local cdef = string.format([[
typedef struct
{
%s
} %s;
]],
        struct_mems,
        struct_type
    )
    return cdef
end

function TlmGen.create_struct(struct_data)
    local struct_size = utl._extract_validate_struct_size(struct_data)
    local struct_mems = utl._extract_validate_struct_mems(struct_data)
    local struct_type = struct_data.name .. "_t"
    local struct_cdef = create_cdef(struct_mems, struct_type)
    ffi.cdef(struct_cdef)
    return ffi.metatype(ffi.typeof(struct_type), {
        __index = {
            size = function(self) return ffi.sizeof(self) end,
            type = struct_type,
            cdef = struct_cdef
        },
        __tostring = function(self)
            return string.format(
                "%s (%d bytes)\n%s",
                self.type,
                self:size(),
                self.cdef
            )
        end,
    })
end

return TlmGen
