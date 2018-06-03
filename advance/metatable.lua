-- setmetatable(table, metatable)：此方法用于为一个表设置元表。
-- getmetatable(table)：此方法用于获取表的元表对象。

-- 设置元表的方法很简单，如下：
-- local mytable = {}
-- local mymetatable = {}
-- setmetatable(mytable, mymetatable)
-- 上面的代码可以简写成如下的一行代码：
-- local mytable = setmetatable({}, {})



local set1 = {10, 20, 30}   -- 集合
local set2 = {20, 40, 50}   -- 集合

-- 将用于重载__add的函数，注意第一个参数是self
local union = function (self, another)
    local set = {}
    local result = {}

    -- 利用数组来确保集合的互异性
    for i, j in pairs(self) do set[j] = true end
    for i, j in pairs(another) do set[j] = true end

    -- 加入结果集合
    for i, j in pairs(set) do table.insert(result, i) end
    return result
end

setmetatable(set1, {__add = union}) -- 重载 set1 表的 __add 元方法

local set3 = set1 + set2
for _, j in pairs(set3) do
    io.write(j.." ")               -->output：30 50 20 40 10
end



-- 除了加法可以被重载之外，Lua 提供的所有操作符都可以被重载：
-- 元方法	含义
-- "__add"	+ 操作
-- "__sub"	- 操作 其行为类似于 "add" 操作
-- "__mul"	* 操作 其行为类似于 "add" 操作
-- "__div"	/ 操作 其行为类似于 "add" 操作
-- "__mod"	% 操作 其行为类似于 "add" 操作
-- "__pow"	^ （幂）操作 其行为类似于 "add" 操作
-- "__unm"	一元 - 操作
-- "__concat"	.. （字符串连接）操作
-- "__len"	# 操作
-- "__eq"	== 操作 函数 getcomphandler 定义了 Lua 怎样选择一个处理器来作比较操作 仅在两个对象类型相同且有对应操作相同的元方法时才起效
-- "__lt"	< 操作
-- "__le"	<= 操作
-- 除了操作符之外，如下元方法也可以被重载，下面会依次解释使用方法：
-- 元方法	含义
-- "__index"	取下标操作用于访问 table[key]
-- "__newindex"	赋值给指定下标 table[key] = value
-- "__tostring"	转换成字符串
-- "__call"	当 Lua 调用一个值时调用
-- "__mode"	用于弱表(week table)
-- "__metatable"	用于保护metatable不被访问



mytable = setmetatable({key1 = "value1"},   --原始表
  {__index = function(self, key)            --重载函数
    if key == "key2" then
      return "metatablevalue"
    end
  end
})

print(mytable.key1,mytable.key2)  --> output：value1 metatablevalue



arr = {1, 2, 3, 4}
arr = setmetatable(arr, {__tostring = function (self)
    local result = '{'
    local sep = ''
    for _, i in pairs(self) do
        result = result ..sep .. i
        sep = ', '
    end
    result = result .. '}'
    return result
end})
print(arr)  --> {1, 2, 3, 4}



-- 看不懂
functor = {}
function func1(self, arg)
  print ("called from", arg)
end

setmetatable(functor, {__call = func1})

functor("functor")  --> called from functor
print(functor)      --> output：0x00076fc8 （后面这串数字可能不一样）


-- __metatable 元方法
-- 假如我们想保护我们的对象使其使用者既看不到也不能修改 metatables。我们可以对 metatable 设置了 __metatable 的值，getmetatable 将返回这个域的值，而调用 setmetatable 将会出错：
Object = setmetatable({}, {__metatable = "You cannot access here"})

print(getmetatable(Object)) --> You cannot access here
-- setmetatable(Object, {})    --> 引发编译器报错