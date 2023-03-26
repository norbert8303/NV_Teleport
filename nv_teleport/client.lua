Citizen.CreateThread(function()
    local options = {}

    for k, v in pairs(Config.Tps) do
        table.insert(options, {
            title = v[4],
            onSelect = function() safezone(v[1], v[2], v[3]) end
        })
    end

    lib.registerContext({
        id = 'nv_teleport',
        title = Config.Title,
        options = options
    })
end)

function safezone(x, y, z)
    SetEntityCoords(PlayerPedId(), x, y, z)
end

RegisterCommand('tpmenu', function()
    lib.showContext('nv_teleport')
end)