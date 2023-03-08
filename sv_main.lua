local QBCore = exports[Config.CoreName]:GetCoreObject()

QBCore.Functions.CreateUseableItem(Config.NVItem, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemByName(item.name) then
        TriggerClientEvent('nightvision:toggleHelmet', source)
    end
end)