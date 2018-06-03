local person = {name = "Bob", sex = "M"}
print(person.name)
-- do something
person = nil
-- do something

-- print(person.name)


-- 然而，在实际的工程代码中，我们很难这么轻易地发现我们引用了 nil 变量。
-- 因此，在很多情况下我们在访问一些 table 型变量时，需要先判断该变量是
-- 否为 nil，例如将上面的代码改成：
local person = {name = "Bob", sex = "M"}

-- do something
person = nil
-- do something
if person ~= nil and person.name ~= nil then
  print(person.name)
else
  -- do something
end



-- 对于简单类型的变量，我们可以用 if (var == nil) then 这样的简单句子
-- 来判断。但是对于 table 型的 Lua 对象，就不能这么简单判断它是否为空了。
-- 一个 table 型变量的值可能是 {}，这时它不等于 nil。我们来看下面这段代码：
local next = next
local a = {}
local b = {name = "Bob", sex = "Male"}
local c = {"Male", "Female"}
local d = nil

print(#a)
print(#b)
print(#c)
--print(#d)    -- error

if a == nil then
    print("a == nil")
end

if b == nil then
    print("b == nil")
end

if c == nil then
    print("c == nil")
end

if d== nil then
    print("d == nil")
end

if next(a) == nil then
    print("next(a) == nil")
end

if next(b) == nil then
    print("next(b) == nil")
end

if next(c) == nil then
    print("next(c) == nil")
end

-- 输出:
-- 0
-- 0
-- 2
-- d == nil
-- next(a) == nil


-- 因此判断一个table是否为空
function isTableEmpty(t)
    return t == nil or next(t) == nil
end