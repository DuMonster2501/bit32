bit32 = {};
local N = 32;
local P = 2 ^ N;

bit32.bnot = function(x)
    x = x % P;
    return (P - 1) - x;
end;

bit32.band = function(x, y)
    if (y == 255) then return x % 256; end
    if (y == 65535) then return x % 65536; end
    if (y == 4294967295) then return x % 4294967296; end
    x, y = x % P, y % P;
    local r = 0;
    local p = 1;
    for i = 1, N do
        local a, b = x % 2, y % 2;
        x, y = math.floor(x / 2), math.floor(y / 2);
        if ((a + b) == 2) then r = r + p; end
        p = 2 * p;
    end
    return r;
end;

bit32.bor = function(x, y)
    if (y == 255) then return (x - (x % 256)) + 255; end
    if (y == 65535) then return (x - (x % 65536)) + 65535; end
    if (y == 4294967295) then return 4294967295; end
    x, y = x % P, y % P;
    local r = 0;
    local p = 1;
    for i = 1, N do
        local a, b = x % 2, y % 2;
        x, y = math.floor(x / 2), math.floor(y / 2);
        if ((a + b) >= 1) then r = r + p; end
        p = 2 * p;
    end
    return r;
end;

bit32.bxor = function(x, y)
    x, y = x % P, y % P;
    local r = 0;
    local p = 1;
    for i = 1, N do
        local a, b = x % 2, y % 2;
        x, y = math.floor(x / 2), math.floor(y / 2);
        if ((a + b) == 1) then r = r + p; end
        p = 2 * p;
    end
    return r;
end;

bit32.lshift = function(x, s_amount)
    if (math.abs(s_amount) >= N) then return 0; end
    x = x % P;
    if (s_amount < 0) then
        return math.floor(x * (2 ^ s_amount));
    else
        return (x * (2 ^ s_amount)) % P;
    end
end;

bit32.rshift = function(x, s_amount)
    if (math.abs(s_amount) >= N) then return 0; end
    x = x % P;
    if (s_amount > 0) then
        return math.floor(x * (2 ^ -s_amount));
    else
        return (x * (2 ^ -s_amount)) % P;
    end
end;

bit32.arshift = function(x, s_amount)
    if (math.abs(s_amount) >= N) then return 0; end
    x = x % P;
    if (s_amount > 0) then
        local add = 0;
        if (x >= (P / 2)) then
            add = P - (2 ^ (N - s_amount));
        end
        return math.floor(x * (2 ^ -s_amount)) + add;
    else
        return (x * (2 ^ -s_amount)) % P;
    end
end;

bit32.extract = function(n, field, width)
    width = width or 1;
    return (n >> field) & ((1 << width) - 1);
end;

bit32.replace = function(n, v, field, width)
    width = width or 1;
    local mask = ((1 << width) - 1) << field;
    return (n & ~mask) | ((v << field) & mask);
end;

bit32.btest = function(...)
    return bit32.band(...) ~= 0;
end;
