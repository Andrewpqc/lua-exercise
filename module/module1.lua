local foo={}

local function getname()
    return "Lucy"
end

function foo.greeting()
    print("hello " .. getname())
end

-- 注意这里还有一个return 
return foo
