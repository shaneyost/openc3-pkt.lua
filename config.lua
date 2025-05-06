return {
	{
		name = "trash_compactor",
		apid = 0x001,
		members = {
			{ name = "status", type = "uint8_t", min = 0, max = 7 },
			{ name = "pressure", type = "float", min = 0.0, max = 500.0 }, -- psi
			{ name = "op_count", type = "uint16_t", min = 0, max = 10000 },
			{ name = "temperature", type = "float", min = -40.0, max = 85.0 }, -- °C
			{ name = "power_draw", type = "float", min = 0.0, max = 250.0 }, -- watts
			{ name = "last_error", type = "char", len = 32 },
		},
	},
	{
		name = "superlaser_control",
		apid = 0x003,
		members = {
			{ name = "beam_power", type = "float", min = 0.0, max = 1000000.0 }, -- MW
			{ name = "focus_ring_temp", type = "double", min = 0.0, max = 1000.0 }, -- K
			{ name = "emitter_status", type = "uint8_t", min = 0, max = 3 }, -- enum
			{ name = "coolant_flow", type = "float", min = 0.0, max = 100.0 }, -- liters/sec
			{ name = "target_coords", type = "int32_t", len = 3 },
			{ name = "cooling_grid_temp", type = "float", len = 8, min = 0.0, max = 120.0 }, -- °C
			{ name = "charge_percent", type = "uint16_t", min = 0, max = 100 }, -- %
			{ name = "operator", type = "char", len = 64 },
			{ name = "alignment_matrix", type = "double", len = 9 },
		},
	},
	{
		name = "reactor_core",
		apid = 0x00B,
		members = {
			{ name = "core_temp", type = "float", min = 200.0, max = 1200.0 }, -- °C
			{ name = "pressure", type = "float", min = 0.0, max = 10000.0 }, -- psi
			{ name = "neutron_flux", type = "double", min = 1e10, max = 1e14 }, -- n/cm²/s
			{ name = "containment_state", type = "uint8_t", min = 0, max = 2 }, -- enum
			{ name = "emergency_flags", type = "uint16_t" },
			{ name = "coolant_valve_pos", type = "uint16_t", len = 4, min = 0, max = 100 }, -- %
			{ name = "thermal_map", type = "float", len = 16, min = 0.0, max = 900.0 }, -- °C
			{ name = "last_scram_time", type = "uint64_t" },
			{ name = "comment", type = "char", len = 128 },
		},
	},
}
