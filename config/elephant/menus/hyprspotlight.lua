Name = "hyprspotlight"
NamePretty = "Hypr Spotlight"
Description = "Projects, windows, apps, and actions"
Icon = "system-search"
HideFromProviderlist = true
FixedOrder = true
History = false
SearchName = false
Action = "/home/erik/.local/bin/hypr-project menu-open '%VALUE%'"

function GetEntries()
    local handle = io.popen("/home/erik/.local/bin/hypr-project-menu-json --lua-file 2>/dev/null")
    if not handle then
        return {}
    end

    local path = handle:read("*a")
    handle:close()

    if not path or path == "" then
        return {}
    end

    path = path:gsub("%s+$", "")
    return dofile(path)
end
