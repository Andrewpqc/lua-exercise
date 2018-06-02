
--     math.rad(x)	角度x转换成弧度
--     math.deg(x)	弧度x转换成角度
--     math.max(x, ...)	返回参数中值最大的那个数，参数必须是number型
--     math.min(x, ...)	返回参数中值最小的那个数，参数必须是number型
--     math.random ([m [, n]])	不传入参数时，返回 一个在区间[0,1)内均匀分布的伪随机实数；只使用一个整数参数m时，返回一个在区间[1, m]内均匀分布的伪随机整数；使用两个整数参数时，返回一个在区间[m, n]内均匀分布的伪随机整数
--     math.randomseed (x)	为伪随机数生成器设置一个种子x，相同的种子将会生成相同的数字序列
--     math.abs(x)	返回x的绝对值
--     math.fmod(x, y)	返回 x对y取余数
--     math.pow(x, y)	返回x的y次方
--     math.sqrt(x)	返回x的算术平方根
--     math.exp(x)	返回自然数e的x次方
--     math.log(x)	返回x的自然对数
--     math.log10(x)	返回以10为底，x的对数
--     math.floor(x)	返回最大且不大于x的整数
--     math.ceil(x)	返回最小且不小于x的整数
--     math.pi	圆周率
--     math.sin(x)	求弧度x的正弦值
--     math.cos(x)	求弧度x的余弦值
--     math.tan(x)	求弧度x的正切值
--     math.asin(x)	求x的反正弦值
--     math.acos(x)	求x的反余弦值
--     math.atan(x)	求x的反正切值

print(math.pi)           -->output  3.1415926535898
print(math.rad(180))     -->output  3.1415926535898
print(math.deg(math.pi)) -->output  180

print(math.sin(1))       -->output  0.8414709848079
print(math.cos(math.pi)) -->output  -1
print(math.tan(math.pi / 4))  -->output  1

print(math.atan(1))      -->output  0.78539816339745
print(math.asin(0))      -->output  0

print(math.max(-1, 2, 0, 3.6, 9.1))     -->output  9.1
print(math.min(-1, 2, 0, 3.6, 9.1))     -->output  -1

print(math.fmod(10.1, 3))   -->output  1.1
print(math.sqrt(360))      -->output  18.97366596101

print(math.exp(1))         -->output  2.718281828459
print(math.log(10))        -->output  2.302585092994
print(math.log10(10))      -->output  1

print(math.floor(3.1415))  -->output  3
print(math.ceil(7.998))    -->output  8



math.randomseed (os.time())   --把100换成os.time()
print(math.random())          -->output 0.88369396038697
print(math.random(100))       -->output 66
print(math.random(100, 360))  -->output 228