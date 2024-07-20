
local schemes = {
  "tokyonight-moon",
  "tokyonight-night",
  "onedark",
  "OceanicNext",
  "gruvbox",
  "nord",   --太素了
  "nightfox",
}
local colorscheme = schemes[1]

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " 没有找到！")
  return
end

