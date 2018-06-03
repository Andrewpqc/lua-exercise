

-- 函数的定义需要放在函数使用之前

local function hello_world()
    print("this is in function hello world")
    local a=1
    local b=2
    local c=a+b
    return c
end


print(hello_world())

hh=function()
    print("this is in function hh")
    hello_world()
end

hh()

-- 传值
local function swap(a, b) --定义函数swap,函数内部进行交换两个变量的值
    local temp = a
    a = b
    b = temp
    print(a, b)
 end
 
 local x = "hello"
 local y = 20
 print(x, y)
 swap(x, y)    --调用swap函数
 print(x, y)   --调用swap函数后，x和y的值并没有交换



 local function fun1(a, b)       --两个形参，多余的实参被忽略掉
    print(a, b)
 end
 
 local function fun2(a, b, c, d) --四个形参，没有被实参初始化的形参，用nil初始化
    print(a, b, c, d)
 end
 
 local x = 1
 local y = 2
 local z = 3
 
 fun1(x, y, z)         -- z被函数fun1忽略掉了，参数变成 x, y
 fun2(x, y, z)         -- 后面自动加上一个nil，参数变成 x, y, z, nil
 
 -->output
-- 1   2
-- 1   2   3   nil



local function func( ... )                -- 形参为 ... ,表示函数采用变长参数

    local temp = {...}                     -- 访问的时候也要使用 ...
    local ans = table.concat(temp, " ")    -- 使用 table.concat 库函数对数
                                           -- 组内容使用 " " 拼接成字符串。
    print(ans)
 end
 
 func(1, 2)        -- 传递了两个参数
 func(1, 2, 3, 4)  -- 传递了四个参数
 
 -->output
--  1 2
--  1 2 3 4


local function change(arg) -- change 函数，改变长方形的长和宽，使其各增长一倍
    arg.width = arg.width * 2
    arg.height = arg.height * 2
    return arg
end
  
  local rectangle = { width = 20, height = 15 }
  print("before change:", "width  =", rectangle.width,
                          "height =", rectangle.height)
  rectangle = change(rectangle)
  print("after  change:", "width  =", rectangle.width,
                          "height =", rectangle.height)
  
  -->output
--   before change: width = 20  height =  15
--   after  change: width = 40  height =  30



  function change(arg) --change函数，改变长方形的长和宽，使其各增长一倍
    arg.width = arg.width * 2  --表arg不是表rectangle的拷贝，他们是同一个表
    arg.height = arg.height * 2
  end                  -- 没有return语句了
  
  local rectangle = { width = 20, height = 15 }
  print("before change:", "width = ", rectangle.width,
                          " height = ", rectangle.height)
  change(rectangle)
  print("after change:", "width = ", rectangle.width,
                         " height =", rectangle.height)
  
  --> output
--   before change: width = 20  height = 15
--   after  change: width = 40  height = 30



-- 在常用基本类型中，除了 table 是按址传递类型外，其它的都是按值传递参数。
-- 用全局变量来代替函数参数的不好编程习惯应该被抵制，良好的编程习惯应该是减少全局变量的使用。

local s, e = string.find("hello world", "llo")
print(s, e)  -->output 3  5


local function swap(a, b)   -- 定义函数 swap，实现两个变量交换值
    return b, a              -- 按相反顺序返回变量的值
 end
 
 local x = 1
 local y = 20
 x, y = swap(x, y)           -- 调用 swap 函数
 print(x, y)                 --> output   20     1
 


 function init()             --init 函数 返回两个值 1 和 "lua"
    return 1, "lua"
  end
  
  x = init()
  print(x)
  
  x, y, z = init()
  print(x, y, z)
  
  --output
--   1
--   1 lua nil


local function init()       -- init 函数 返回两个值 1 和 "lua"
    return 1, "lua"
end

local x, y, z = init(), 2   -- init 函数的位置不在最后，此时只返回 1
print(x, y, z)              -->output  1  2  nil

local a, b, c = 2, init()   -- init 函数的位置在最后，此时返回 1 和 "lua"
print(a, b, c)              -->output  2  1  lua


local function init()
    return 1, "lua"
end

print(init(), 2)   -->output  1  2
print(2, init())   -->output  2  1  lua


local function init()
    return 1, "lua"
end

print((init()), 2)   -->output  1  2
print(2, (init()))   -->output  2  1



-- 回调函数
local function run(x, y)
    print('run', x, y)
end

local function attack(targetId)
    print('targetId', targetId)
end

local function do_action(method, ...)
    print("hhhhhhhhh")
    local args = {...} or {}
    method(unpack(args, 1, table.maxn(args)))
end

do_action(run, 1, 2)         -- output: run 1 2
do_action(attack, 1111)      -- output: targetId    1111