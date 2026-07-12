local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local function safeHttpGet(url)
    local success, result = pcall(function()
        return game:HttpGet(url)
    end)
    if success and result then
        return result
    end
    return nil
end

local librarySource = safeHttpGet(repo .. 'Library.lua')
local themeSource = safeHttpGet(repo .. 'addons/ThemeManager.lua')
local saveSource = safeHttpGet(repo .. 'addons/SaveManager.lua')

if not librarySource or not themeSource or not saveSource then
    warn("Failed to load library files")
    return
end

local Library = loadstring(librarySource)()
local ThemeManager = loadstring(themeSource)()
local SaveManager = loadstring(saveSource)()

local Window = Library:CreateWindow({
    Title = 'WELCOME TO THE RIFT',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

local Tabs = {
    Combat = Window:AddTab('Combat'),
    Visuals = Window:AddTab('Visuals'),
    World = Window:AddTab('World'),
    Character = Window:AddTab('Character'),
    Exploit = Window:AddTab('Exploit'),
    ['UI Settings'] = Window:AddTab('UI Settings')
}
