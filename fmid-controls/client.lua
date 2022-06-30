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

local Keys = {
    ["A"] = 0x7065027D,
    ["B"] = 0x4CC0E2FE,
    ["C"] = 0x9959A6F0,
    ["D"] = 0xB4E465B4,
    ["E"] = 0xCEFD9220,
    ["F"] = 0xB2F377E8,
    ["G"] = 0x760A9C6F,
    ["H"] = 0x24978A28,
    ["I"] = 0xC1989F95,
    ["J"] = 0xF3830D8E,
    -- ["K"] = Missing,
    ["L"] = 0x80F28E95,
    ["M"] = 0xE31C6A41,
    ["N"] = 0x4BC9DABB, --(Push to talk key),
    ["O"] = 0xF1301666,
    ["P"] = 0xD82E0BD2,
    ["Q"] = 0xDE794E3E,
    ["R"] = 0xE30CD707,
    ["S"] = 0xD27782E3,
    ["T"] = -1759445778,
    ["U"] = 0xD8F73058,
    ["V"] = 0x7F8D09B8,
    ["W"] = 0x8FD015D8,
    ["X"] = 0x8CC9CD42,
    -- ["Y"] = Missing,
    ["Z"] = 0x26E9DC00,
    ["TUTUPSIKU"] = 0xA5BDCD3C,
    ["BUKASIKU"] = 0x430593AA,
    ["MOUSEKIRI"] = 0x07CE1E61,
    ["MOUSEKANAN"] = 0xF84FA74F,
    ["MOUSETENGAH"] = 0xCEE12B50,
    ["MOUSEATAS"] = 0x3076E97C,
    ["MOUSEBAWAH"] = 0x8BDE7443,
    ["CTRL"] = 0xDB096B85,
    ["TAB"] = 0xB238FE0B,
    ["SHIFT"] = 0x8FFC75D6,
    ["SPASI"] = 0xD9D0E1C0,
    ["ENTER"] = 0xC7B5340A,
    ["BACKSPACE"] = 0x156F7119,
    ["ALTKIRI"] = 0x8AAA0AD4,
    ["HOME"] = 0x064D1698,
    ["DEL"] = 0x4AF4D473,
    ["PGUP"] = 0x446258B6,
    ["PGDN"] = 0x3C3DD371,
    ["F1"] = 0xA8E3F467, -- doesn't work
    ["F4"] = 0x1F6D95E5,
    ["F6"] = 0x3C0A40F2,
    ["1"] = 0xE6F612E4,
    ["2"] = 0x1CE6D9EB,
    ["3"] = 0x4F49CC4C,
    ["4"] = 0x8F9F9E58,
    ["5"] = 0xAB62E997,
    ["6"] = 0xA1FDE2A6,
    ["7"] = 0xB03A913B,
    ["8"] = 0x42385422,
    ["PANAHATAS"] = 0x6319DB71,
    ["PANAHBAWAH"] = 0x05CA7C52,
    ["PANAHKIRI"] = 0xA65EBAB4,
    ["PANAHKANAN"] = 0xDEB34313,
}

Citizen.CreateThread(function()
    while true do
        if IsInputDisabled() then -- this insures this will only work with keyboard keys, not controller ones
            for key, hash in pairs(Keys) do -- loops through the above key table
                if IsDisabledControlJustPressed(2, hash) then  -- send an event when you press down a key
                    TriggerEvent("fmid-controls:tekan", key)
                elseif IsDisabledControlJustReleased(2, hash) then  -- send an event when you release a key
                    TriggerEvent("fmid-controls:tahan", key)
                end
            end
        end
        Wait(0)
    end
end)

exports('tekan', tekan)
exports('tahan', tahan)
exports('lepas', lepas)