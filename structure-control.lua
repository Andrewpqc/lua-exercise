x = 10
if x > 0 then
    print("x is a positive number")
end



x = 0
if x > 0 then
    print("x is a positive number")
else
    print("x is a non-positive number")
end


score = 90
if score == 100 then
    print("Very good!Your score is 100")
elseif score >= 60 then
    print("Congratulations, you have passed it,your score greater or equal to 60")
--此处可以添加多个elseif
else
    print("Sorry, you do not pass the exam! ")
end


score = 0
if score == 100 then
    print("Very good!Your score is 100")
elseif score >= 60 then
    print("Congratulations, you have passed it,your score greater or equal to 60")
else
    if score > 0 then
        print("Your score is better than 0")
    else
        print("My God, your score turned out to be 0")
    end --与上一示例代码不同的是，此处要添加一个end
end


x = 1
sum = 0

while x <= 5 do
    sum = sum + x
    x = x + 1
end
print(sum)  -->output 15



local t = {1, 3, 5, 8, 11, 18, 21}

local i
for i, v in ipairs(t) do
    if 11 == v then
        print("index[" .. i .. "] have right value[11]")
        break
    end
end


x = 10
repeat
    x=x+1
    print(x)
until x>100

for i = 1, 5 do
    print(i)
end
  
for i = 1, 5, 2 do
    print(i)
end



for i = 1, math.huge do
    if (0.3*i^3 - 20*i^2 - 500 >=0) then
      print(i)
      break
    end
end
  
local a = {"a", "b", "c", "d"}
for i, v in ipairs(a) do
  print("index:", i, " value:", v)
end


for k in pairs(t) do
    print(k)
end



local days = {
    "Monday", "Tuesday", "Wednesday", "Thursday",
    "Friday", "Saturday","Sunday"
 }
 
 local revDays = {}
 for k, v in pairs(days) do
   revDays[v] = k
 end
 
 -- print value
 for k,v in pairs(revDays) do
   print("k:", k, " v:", v)
 end
 
 -- 计算最小的x,使从1到x的所有数相加和大于100
sum = 0
i = 1
while true do
    sum = sum + i
    if sum > 100 then
        break
    end
    i = i + 1
end
print("The result is " .. i)  -->output:The result is 14


local function add(x, y)
    return x + y
    --print("add: I will return the result " .. (x + y))
    --因为前面有个return，若不注释该语句，则会报错
end

local function is_positive(x)
    if x > 0 then
        return x .. " is positive"
    else
        return x .. " is non-positive"
    end

    --由于return只出现在前面显式的语句块，所以此语句不注释也不会报错
    --，但是不会被执行，此处不会产生输出
    print("function end!")
end

sum = add(10, 20)
print("The sum is " .. sum)  -->output:The sum is 30
answer = is_positive(-10)
print(answer)         

--为了调试的方便，短路控制流
local function foo()
    print("before")
    do return end
    -- return　　　　　　直接return 不行
    print("after")  -- 这一行语句永远不会执行到
end

foo()