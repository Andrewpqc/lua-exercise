-- 返回字符 s[i]、s[i + 1]、s[i + 2]、······、s[j] 
-- 所对应的 ASCII 码。i 的默认值为 1，即第一个字节,j 的默认值为 i 。
print(string.byte( "abc",1,3 ))
print(string.byte( "abc",2))
print(string.byte( "abc"))


print(string.char(96, 97, 98))
print(string.char())        -- 参数为空，默认是一个0，
                            -- 你可以用string.byte(string.char())测试一下
print(string.char(65, 66))

--> output


print(string.upper("Hello Lua"))  -->output  HELLO LUA


print(string.lower("Hello Lua"))  -->output   hello lua


print(string.len("hello lua")) -->output  9

-- 使用此函数是不推荐的。应当总是使用 # 运算符来获取 Lua 字符串的长度。
-- 由于 Lua 字符串的长度是专门存放的，并不需要像 C 字符串那样即时计算，
-- 因此获取字符串长度的操作总是 O(1) 的时间复杂度。

print(#"hhhh")



local find = string.find
print(find("abc cba", "ab"))
print(find("abc cba", "ab", 2))     -- 从索引为2的位置开始匹配字符串：ab
print(find("abc cba", "ba", -1))    -- 从索引为7的位置开始匹配字符串：ba
print(find("abc cba", "ba", -3))    -- 从索引为6的位置开始匹配字符串：ba
print(find("abc cba", "(%a+)", 1))  -- 从索引为1处匹配最长连续且只含字母的字符串
print(find("abc cba", "(%a+)", 1, true)) --从索引为1的位置开始匹配字符串：(%a+)


print(string.format("%.4f", 3.1415926))     -- 保留4位小数
print(string.format("%d %x %o", 31, 31, 31))-- 十进制数31转换成不同进制
d = 29; m = 7; y = 2015                     -- 一行包含几个语句，用；分开
print(string.format("%s %02d/%02d/%d", "today is:", d, m, y))

-->output
-- 3.1416
-- 31 1f 37
-- today is: 29/07/2015


print(string.match("hello lua", "lua"))
print(string.match("lua lua", "lua", 2))  --匹配后面那个lua
print(string.match("lua lua", "hello"))
print(string.match("today is 27/7/2015", "%d+/%d+/%d+"))



s = "hello world from Lua"
for w in string.gmatch(s, "%a+") do  --匹配最长连续且只含字母的字符串
    print(w)
end

-->output
-- hello
-- world
-- from
-- Lua


t = {}
s = "from=world, to=Lua"
for k, v in string.gmatch(s, "(%a+)=(%a+)") do  --匹配两个最长连续且只含字母的
    t[k] = v                                    --字符串，它们之间用等号连接
end
for k, v in pairs(t) do
print (k,v)
end

-->output
-- to      Lua
-- from    


print(string.rep("abc", 3)) --拷贝3次"abc"
-->output  abcabcabc

print(string.sub("Hello Lua", 4, 7))
print(string.sub("Hello Lua", 2))
print(string.sub("Hello Lua", 2, 1))    --看到返回什么了吗
print(string.sub("Hello Lua", -3, -1))

-->output
-- lo L
-- ello Lua

-- Lua


print(string.gsub("Lua Lua Lua", "Lua", "hello"))
print(string.gsub("Lua Lua Lua", "Lua", "hello", 2)) --指明第四个参数

-->output
-- hello hello hello   3
-- hello hello Lua     2

print(string.reverse("Hello Lua"))  --> output: auL olleH
