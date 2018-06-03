local _M = {}

local mt = { __index = _M }

function _M.deposit (self, v)
    self.balance = self.balance + v
end

function _M.withdraw (self, v)
    if self.balance > v then
        self.balance = self.balance - v
    else
        error("insufficient funds")
    end
end

function _M.new (self, balance)
    balance = balance or 0
    return setmetatable({balance = balance}, mt)
end

return _M
引用代码示例：
local account = require("account")

local a = account:new()
a:deposit(100)

local b = account:new()
b:deposit(50)

print(a.balance)  --> output: 100
print(b.balance)  --> output: 50
-- 上面这段代码 "setmetatable({balance = balance}, mt)"，
-- 其中 mt 代表 { __index = _M } ，这句话值得注意。根据我们
-- 在元表这一章学到的知识，我们明白，setmetatable 将 _M 作为新
-- 建表的原型，所以在自己的表内找不到 'deposit'、'withdraw' 
-- 这些方法和变量的时候，便会到 __index 所指定的 _M 类型中去寻找。