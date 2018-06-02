print(1 + 2)       -->打印 3
print(5 / 10)      -->打印 0.5。 这是Lua不同于c语言的
print(5.0 / 10)    -->打印 0.5。 浮点数相除的结果是浮点数
-- print(10 / 0)   -->注意除数不能为0，计算的结果会出错
print(2 ^ 10)      -->打印 1024。 求2的10次方

local num = 1357
print(num % 2)       -->打印 1
print((num % 2) == 1) -->打印 true。 判断num是否为奇数
print((num % 5) == 0)  -->打印 false。判断num是否能被5整数

print("---------------------------")
print(1 < 2)    -->打印 true
print(1 == 2)   -->打印 false
print(1 ~= 2)   -->打印 true
local a, b = true, false
print(a == b)  -->打印 false


print("------------------------------")
-- 在使用“==”做等于判断时，要注意对于 table, userdate 
-- 和函数， Lua 是作引用比较的。也就是说，只有当两个变量
-- 引用同一个对象时，才认为它们相等。可以看下面的例子：
local a = { x = 1, y = 0}
local b = { x = 1, y = 0}
if a == b then
  print("a==b")
else
  print("a~=b")
end

-->output:a~=b


print("---------------------------------")
local c = nil
local d = 0
local e = 100
print(c and d)  -->打印 nil
print(c and e)  -->打印 nil
print(d and e)  -->打印 100
print(c or d)   -->打印 0
print(c or e)   -->打印 100
print(not c)    -->打印 true
print(not d)    -->打印 false


print("-------------------------------")
print("Hello " .. "World")    -->打印 Hello World
print(0 .. 1)                 -->打印 01

str1 = string.format("%s-%s","hello","world")
print(str1)              -->打印 hello-world

str2 = string.format("%d-%s-%.2f",123,"world",1.21)
print(str2)              -->打印 123-world-1.21


print("------------------------------------")
-- 进行大量字符串拼接的正确姿势
local pieces = {}
local my_list={"aaa","bbb"}
for i, elem in ipairs(my_list) do
    print(i,elem)
    pieces[i] = elem
end
local res = table.concat(pieces)
print(res)