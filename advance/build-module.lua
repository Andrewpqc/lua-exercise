-- 推荐的构建模块的方法

-- square.lua 长方形模块
local _M = {}           -- 局部的变量
_M._VERSION = '1.0'     -- 模块版本

local mt = { __index = _M }

function _M.new(self, width, height)
    return setmetatable({ width=width, height=height }, mt)
end

function _M.get_square(self)
    return self.width * self.height
end

function _M.get_circumference(self)
    return (self.width + self.height) * 2
end

return _M


-- 引用示例代码：
-- local square = require "square"

-- local s1 = square:new(1, 2)
-- print(s1:get_square())          --output: 2
-- print(s1:get_circumference())   --output: 6


-- 因为 Lua module 只会在第一次请求时加载一次（除非显式禁用了 lua_code_cache 配置指令），
-- 后续请求便可直接复用。

--[[
另一个跟 Lua 的 module 模块相关需要注意的点是，当 lua_code_cache on 开启时
，require 加载的模块是会被缓存下来的，这样我们的模块就会以最高效的方式运行，直到
被显式地调用如下语句（这里有点像模块卸载）：
package.loaded["square"] = nil
我们可以利用这个特性代码来做一些高阶玩法，比如代码热更新等。
--]]