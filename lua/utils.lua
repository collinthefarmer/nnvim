function Map(tbl, f)
    local t = {}
    for k, v in pairs(tbl) do
        t[k] = f(v)
    end
    return t
end

function Reduce(tbl, f, initial)
    local acc = initial
    for _, v in pairs(tbl) do
        acc = f(acc, v)
    end
    return acc
end

function Filter(tbl, f)
    local t = {}
    for k, v in pairs(tbl) do
        if f(v) then
            t[k] = v
        end
    end
    return t
end

local function hex2rgb(hex)
    hex = hex:gsub("#", "")
    return {
        r = tonumber("0x" .. hex:sub(1, 2)) / 255,
        g = tonumber("0x" .. hex:sub(3, 4)) / 255,
        b = tonumber("0x" .. hex:sub(5, 6)) / 255,
    }
end

local function rgb2hex(rgb)
    return string.format("#%02x%02x%02x", rgb.r * 255, rgb.g * 255, rgb.b * 255)
end

local function rgb2hsl(rgb)
    local r, g, b = rgb.r, rgb.g, rgb.b
    local max, min = math.max(r, g, b), math.min(r, g, b)
    local h, s, l = (max + min) / 2, (max + min) / 2, (max + min) / 2

    if max == min then
        -- achromatic
        h, s = 0, 0
    else
        local delta = max - min
        s = l > 0.5 and delta / (2 - max - min) or delta / (max + min)
        if max == r then
            h = (g - b) / delta + (g < b and 6 or 0)
        elseif max == g then
            h = (b - r) / delta + 2
        elseif max == b then
            h = (r - g) / delta + 4
        end
        h = h / 6
    end

    return { h = h, s = s, l = l }
end

local function hsl2rgb(hsl)
    local r, g, b

    if hsl.s == 0 then
        -- achromatic
        r, g, b = hsl.l, hsl.l, hsl.l
    else
        local function hue2rgb(p, q, t)
            if t < 0 then
                t = t + 1
            end
            if t > 1 then
                t = t - 1
            end
            if t < 1 / 6 then
                return p + (q - p) * 6 * t
            end
            if t < 1 / 2 then
                return q
            end
            if t < 2 / 3 then
                return p + (q - p) * (2 / 3 - t) * 6
            end
            return p
        end

        local q = hsl.l < 0.5 and hsl.l * (1 + hsl.s)
            or hsl.l + hsl.s - hsl.l * hsl.s
        local p = 2 * hsl.l - q
        r = hue2rgb(p, q, hsl.h + 1 / 3)
        g = hue2rgb(p, q, hsl.h)
        b = hue2rgb(p, q, hsl.h - 1 / 3)
    end

    return { r = r, g = g, b = b }
end

function ColorLighten(hex, percent)
    local hsl = rgb2hsl(hex2rgb(hex))
    local adjustment = percent / 100.0
    hsl.l = math.min(hsl.l + adjustment, 1)
    return rgb2hex(hsl2rgb(hsl))
end

function ColorDarken(hex, percent)
    local hsl = rgb2hsl(hex2rgb(hex))
    local adjustment = percent / 100.0
    hsl.l = math.max(hsl.l - adjustment, 0)
    return rgb2hex(hsl2rgb(hsl))
end
