#!/usr/bin/env luajit
local ffi = require("ffi")
local gen = require("tlmgen.tlmgen")
local cfg = require("config")

packets = {}

-- Create the Ctype constructor and allocate our packets
for i = 1, #cfg do
    local Constructor = gen.create_struct(cfg[i])
    table.insert(packets, Constructor())
end

-- An example of assinging value to char memeber via ffi
ffi.copy(packets[1].last_error, "bad")
ffi.copy(packets[2].operator, "shane")
ffi.copy(packets[3].comment, "hello")

-- An example of printing char members via ffi
print("trash_compactor last_error: ", ffi.string(packets[1].last_error))
print("superlaser_control operator: ", ffi.string(packets[2].operator))
print("reactor_core comment: ", ffi.string(packets[3].comment))

-- Looping on our new objects
for i = 1, #cfg do
    print(packets[i])
end
