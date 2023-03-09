local QBCore = exports[Config.CoreName]:GetCoreObject()
local mode = 0
local canToggle = false

RegisterCommand('toggleNV', function()
    if QBCore.Functions.HasItem(Config.NVItem) then
        if Config.CheckHelmet then
            if GetPedPropIndex(PlayerPedId(), 0) == 116 then
                canToggle = true
            else
                canToggle = false
            end
        else
            canToggle = true
        end

        if canToggle then
            if mode == 0 then
                QBCore.Functions.Notify('Nightvision on!')
                SetNightvision(true)
                mode = 1
            elseif mode == 1 then
                QBCore.Functions.Notify('Thermal vision on!')
                SetSeethrough(true)
                mode = 2
            elseif mode == 2 then
                QBCore.Functions.Notify('Nightvision off!')
                SetNightvision(false)
                SetSeethrough(false)
                mode = 0
            end
        else
            QBCore.Functions.Notify('You are not wearing a nightvision helmet!', 'error')
        end
    end
end)
RegisterKeyMapping('toggleNV', 'Toggle nightvision', 'keyboard', Config.NVKey)

RegisterNetEvent('nightvision:toggleHelmet', function()
    if GetPedPropIndex(PlayerPedId(), 0) == 116 then
        SetPedPropIndex(PlayerPedId(), 0, 8, 0, true)
    else
        SetPedPropIndex(PlayerPedId(), 0, 116, 0, true)
    end
end)
