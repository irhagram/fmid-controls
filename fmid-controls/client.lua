RegisterCommand('testct', function()
    -- print(FMID.Kontrol.PANAHATAS)

end)

-- Citizen.CreateThread(function()
--     while true do
--         Citizen.Wait(1)
--         local tidur = false
--         if whenKeyJustPressed(FMID.Kontrol.PANAHATAS) then
--             print('panah asmara')
--         end
--     end
-- end)

function tekan(key)
    if Citizen.InvokeNative(0x580417101DDB492F, 0, key) then
        return true
    else
        return false
    end
end

function tahan(key)
    if Citizen.InvokeNative(0xF3A21BCD95725A4A, 0, key) then
        return true
    else
        return false
    end
end

function lepas(key)
    if Citizen.InvokeNative(0x648EE3E7F38877DD, 0, key) then
        return true
    else
        return false
    end
end

exports('tekan', tekan)
exports('tahan', tahan)
exports('lepas', lepas)