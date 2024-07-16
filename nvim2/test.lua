

function Test()
    local i = 1
    i = 1 + 3
    return i
end

Test()

function Test2()
    local t = {}
    table.insert(t, 1, 22)
    table.sort(t, function (l, r)
       return l < r
    end)
    print("hello")
end

