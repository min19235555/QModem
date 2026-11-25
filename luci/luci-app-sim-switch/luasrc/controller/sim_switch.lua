module("luci.controller.sim_switch", package.seeall)

local http = require "luci.http"

local function reply(ok, data, err)
	http.prepare_content("application/json")
	http.write_json({ ok = ok and true or false, data = data, error = err })
end

local function sim_status()
	local f = io.popen("/usr/bin/simctl status 2>/dev/null")
	local slot = f and f:read("*l") or nil
	if f then f:close() end
	return slot
end

function api_status()
	local slot = sim_status()
	reply(slot ~= nil, { slot = tonumber(slot) or 0, label = slot_label(slot) })
end

function slot_label(slot)
	if slot == "1" then return "USIM (slot 1)" end
	if slot == "2" then return "ESIM1 (slot 2)" end
	if slot == "3" then return "ESIM2 (shared slot 2)" end
	return "Unknown"
end

function api_switch()
	local target = http.formvalue("slot")
	if target ~= "1" and target ~= "2" and target ~= "3" then
		reply(false, nil, "Invalid slot; expected 1, 2 or 3")
		return
	end
	local f = io.popen("/usr/bin/simctl switch " .. target .. " 2>&1")
	local out = f and f:read("*a") or ""
	if f then f:close() end
	reply(true, { slot = tonumber(target), label = slot_label(target), message = out })
end

function api_gpio()
	local f = io.popen("/usr/bin/simctl gpio 2>/dev/null")
	local out = f and f:read("*a") or ""
	if f then f:close() end
	http.prepare_content("application/json")
	http.write_json({ raw = out })
end

function index()
	entry({"admin", "modem", "sim_switch"}, template("sim_switch/sim_switch"), "SIM Switch", 60)
	entry({"admin", "modem", "sim_switch", "config"}, cbi("sim_switch/main"), "Preferences", 61)
	entry({"admin", "modem", "sim_switch", "status"}, call("api_status"), nil).leaf = true
	entry({"admin", "modem", "sim_switch", "switch"}, post("api_switch"), nil).leaf = true
	entry({"admin", "modem", "sim_switch", "gpio"}, call("api_gpio"), nil).leaf = true
end
