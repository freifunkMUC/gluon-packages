local io = io
local os = os
local require = require
local tonumber = tonumber
local type = type

module 'ffmuc-domain-director'

-- Returns true if provided path exists
function path_exists(path)
  local unistd = require 'posix.unistd'
  return unistd.access(path)
end

-- Returns true if current firmware has multidomain support
function firmware_is_multidomain(domain_name)
  return path_exists("/lib/gluon/domains")
end

-- Returns true if supplied domain is present on device
function check_domain_exists(domain_name)
  local domain_directory = "/lib/gluon/domains/"
  local domain_path = domain_directory..domain_name..".json"
  return path_exists(domain_path)
end

-- Returns director URL stored in UCI
function get_director_url()
  local uci = require('simple-uci').cursor()
  return uci:get('ffmuc', 'director', 'url')
end

-- Returns switch-after time from UCI as UNIX epoch
function get_switch_time()
  local uci = require('simple-uci').cursor()
  local switch_time = uci:get('ffmuc', 'director', 'switch_after')
  if switch_time == nil then
    switch_time = -1
  end
  if type(switch_time)=="string" then
    switch_time = tonumber(switch_time)
  end
  return switch_time
end

-- Returns treshold for node-offline domain switching in minutes from UCI in minutes
function get_offline_treshold()
  local uci = require('simple-uci').cursor()
  local offline_treshold = uci:get('ffmuc', 'director', 'switch_after_offline')
  if offline_treshold == nil then
    offline_treshold = 120
  end
  if type(offline_treshold)=="string" then
    offline_treshold = tonumber(offline_treshold)
  end
  return offline_treshold
end

-- Returns true if node was offline long enough to perform domain switch
function is_offline_treshold_reached()
  local util = require 'gluon.util'

  if not path_exists("/tmp/ffmuc_director_gw_unreach") then
    return false
  end

  local offline_treshold = get_offline_treshold() * 60
  if offline_treshold < 0 then
    return false
  end

  local f = io.open("/tmp/ffmuc_director_gw_unreach")
  if not f then
    return false
  end
  local offline_since = f:read('*a')
  f:close()

  local offline_duration = util.get_uptime() - offline_since

  return offline_duration > offline_treshold
end

-- Returns whether or not a switch time has been set. Returns false on -1.
function has_switch_time()
  return get_switch_time() ~= -1
end

-- Returns whether or not switch time has passed. Returns false on -1.
function switch_time_passed()
  local current_epoch = os.time()
  local switch_time = get_switch_time()

  if switch_time == -1 then
    return false
  end

  return switch_time < current_epoch
end

-- Returns true if the domain director is enabled in UCI
function is_enabled_uci()
  local uci = require('simple-uci').cursor()

  return uci:get_bool("ffmuc", "director", "enabled")
end

-- Returns true if the domain director is enabled in-site for the current domain
function is_enabled_site()
  local site = require 'gluon.site'

  return site.domain_director.enabled(false)
end

-- Returns if true the domain director is enabled in-site for the current domain
-- and by the user (Active by default)
function is_enabled()
  return is_enabled_site() and is_enabled_uci()
end
