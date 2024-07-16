

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

--数组排序 采用快速排序
function quick_sort(t, left, right)
    if left < right then
        local i = left
        local j = right
        local x = t[left]
        while i < j do
            while i < j and t[j] >= x do
                j = j - 1
            end
            if i < j then
                t[i] = t[j]
                i = i + 1
            end
            while i < j and t[i] < x do
                i = i + 1
            end
            if i < j then
                t[j] = t[i]
                j = j - 1
            end
        end
        t[i] = x
        quick_sort(t, left, i - 1)
        quick_sort(t, i + 1, right)
    end
end

-- 解释下快速排序的原理：
-- 1. 从数列中挑出一个元素，称为 “基准”（pivot），
-- 2. 重新排序数列，所有元素比基准值小的摆放在基准前面，所有元素比基准值大的摆在基准的后面（相同的数可以到任一边）。在这个分区退出之后，该基准就处于数列的中间位置。这个称为分区（partition）操作。
-- 3. 递归地（recursive）把小于基准值元素的子数列和大于基准值元素的子数列排序。



