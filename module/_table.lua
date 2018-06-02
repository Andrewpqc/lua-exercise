-- 在初始化一个数组的时候，若不显式地用键值对方式赋值，
-- 则会默认用数字作为下标，从 1 开始。由于在 Lua 内部
-- 实际采用哈希表和数组分别保存键值对、普通值，所以不推荐混合使用这两种赋值方式。


local color={first="red", "blue", third="green", "yellow"}
print(color["first"])                 --> output: red
print(color[1])                       --> output: blue
print(color["third"])                 --> output: green
print(color[2])                       --> output: yellow
print(color[3])                       --> output: nil


local tblTest1 = { 1, a = 2, 3 }
print("Test1 " .. table.getn(tblTest1))

local tblTest2 = { 1, nil }
print("Test2 " .. table.getn(tblTest2))

local tblTest3 = { 1, nil, 2 }
print("Test3 " .. table.getn(tblTest3))

local tblTest4 = { 1, nil, 2, nil }
print("Test4 " .. table.getn(tblTest4))

local tblTest5 = { 1, nil, 2, nil, 3, nil }
print("Test5 " .. table.getn(tblTest5))

local tblTest6 = { 1, nil, 2, nil, 3, nil, 4, nil }
print("Test6 " .. table.getn(tblTest6))

-- 不要在 Lua 的 table 中使用 nil 值，如果一个元素要删除，
-- 直接 remove，不要用 nil 去代替。

local a = {1, 3, 5, "hello" }
print(table.concat(a))              -- output: 135hello
print(table.concat(a, "|"))         -- output: 1|3|5|hello
print(table.concat(a, " ", 4, 2))   -- output:
print(table.concat(a, " ", 2, 4))   -- output: 3 5 hello


local a = {1, 8}             --a[1] = 1,a[2] = 8
table.insert(a, 1, 3)   --在表索引为1处插入3
print(a[1], a[2], a[3])
table.insert(a, 10)    --在表的最后插入10
print(a[1], a[2], a[3], a[4])

-->output
-- 3    1    8
-- 3    1    8    10


local a = {}
a[-1] = 10
print(table.maxn(a))
a[5] = 10
print(table.maxn(a))

-->output
-- 0
-- 5
