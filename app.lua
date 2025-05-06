#!/usr/bin/env luajit
local ffi = require("ffi")
local gen = require("tlmgen.tlmgen")
local cfg = require("config")

local Constructor = gen.create_struct(cfg[1])
local Model = Constructor()
print(Model)
print("last_error: ", ffi.string(Model.last_error))
ffi.copy(Model.last_error, "bad")
print("last_error: ", ffi.string(Model.last_error))
