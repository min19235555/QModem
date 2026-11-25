local m = Map("sim_switch", "SIM Slot Switch",
	"Select the active SIM slot for the Quectel RG200U-CN modem on CPE1252S.")

local s = m:section(NamedSection, "main", "sim_switch", "Current Slot")
s.addremove = false

local slot = s:option(ListValue, "active_slot", "Active SIM slot")
slot:value("1", "USIM (slot 1)")
slot:value("2", "ESIM1 (slot 2)")
slot:value("3", "ESIM2 (shared slot 2)")
slot.default = "2"
slot.description = "Changing this value only records the preference. Use the buttons below to apply it to the GPIO switching matrix."

local stype = s:option(Value, "switch_type", "Switch type")
stype.default = "i2c"
stype.readonly = true

return m
