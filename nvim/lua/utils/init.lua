local M = {}

function M.is_available(plugin)
  local lazy_config_avail, lazy_config = pcall(require, "lazy.core.config")
  return lazy_config_avail and lazy_config.spec.plugins[plugin] ~= nil
end

function M.get_icon(kind, padding, no_fallback)
  local icon = require("utils.icons")[kind]
  return icon and icon .. string.rep(" ", padding or 0) or ""
end

return M
