-- Carica dinamicamente tutti i file di plugin .lua nella directory spec
local plugins = {}

-- Percorso alla directory dei plugin
local plugins_path = "lua/kickstart/plugins/spec"
local plugins_module_path = "kickstart.plugins.spec"

local full_path = vim.fn.stdpath("config") .. "/" .. plugins_path

-- Legge tutti i file nella directory
for _, file_name in ipairs(vim.fn.readdir(full_path)) do
  -- Controlla se è un file .lua e non è questo file (loader.lua)
  if file_name:match("%.lua$") and file_name ~= "loader.lua" then
    -- Rimuove l'estensione .lua per creare il nome del modulo
    local module_name = plugins_module_path .. "." .. file_name:gsub("%.lua$", "")

    -- Carica il modulo in modo sicuro
    local ok, plugin_spec = pcall(require, module_name)

    if ok and type(plugin_spec) == "table" then
      -- Un file di plugin può restituire una singola configurazione di plugin
      -- (una tabella con una stringa come primo elemento, es. { 'user/repo', opts = {} })
      -- oppure una lista di configurazioni.
      if (plugin_spec[1] and type(plugin_spec[1]) == "string") or type(plugin_spec.name) == "string" then
        -- Aggiunge la singola configurazione alla lista
        table.insert(plugins, plugin_spec)
      else
        -- Aggiunge tutte le configurazioni dalla lista
        for _, spec in ipairs(plugin_spec) do
          table.insert(plugins, spec)
        end
      end
    end
  end
end

return plugins
