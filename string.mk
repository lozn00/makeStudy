$(warning -------)


#非正则替换 把a.cpp替换为 d.cpp
tempvar:=$(subst a.cpp,d.cpp,aaa bbb ccc a.c b.c e.c a.cpp)
$(warning 替换过滤结果把所有.c后缀替换为.cpp后缀 $(tempvar))

#正则替换 把所有.c后缀替换为.cpp后缀 
tempvar:=$(patsubst %.c,%.cpp,aaa bbb ccc a.c b.c e.c a.cpp)
$(warning 正则替换过滤结果把所有.c后缀替换为.cpp后缀 $(tempvar))


#正则替换 的另外一种简单替换方法，但是不能自己赋值变量给自己
mylist:=aaa bbb ccc a.c b.c e.c a.cpp
tempvar=$(mylist:%.c=%.txt)

$(warning parttern 替换把.c替换为.txt-> $(tempvar))
#取出第一个词 也就是aaa
tempvar:=$(firstword aaa bbb)

$(warning 取出第一个结果$(tempvar))

tempvar:=$(lastword aaa bbb)

$(warning 取出最后一个结果$(tempvar))
tempvar:=$(word 2,aaa bbb ccc)
#注意逗号分隔参数 ，
$(warning 取出指定的单词(下标从1开始)$(tempvar))

#strip test strip的意思是删除首尾空格
temptest:= eee aaa bbb ccc 55 00 
$(warning 没strip之前 [$(temptest)])
tempvar:=$(strip $(temptest))
$(warning strip结果 [$(tempvar)])


#除了第一个没有逗号外后面都是参数
tempvar:=$(wordlist 2,3,aaa bbb ccc)
$(warning 取出第二和第三个结果(下标从1开始)$(tempvar))

#将根据annsi码表排序
tempvar:=$(sort eee aaa bbb ccc 55 00)
$(warning sort排序 $(tempvar))
#过滤 filter 表示的是符合参数1规则的才保留
obj0:= %.o %.c test.cpp
obj1:=0.o b.o 1.obj 10.obj 5.obj test.c test.cpp a.cpp
tempvar:=$(filter $(obj0),$(obj1))
$(warning filter 过滤只有.o和.c结尾以及test.cpp才保留其他全部移除 $(tempvar))


#过滤out和filter相反 符合参数1的被移除  操作结果是返回了obj1（b.o被移除) 传递2个参数
obj:= a.o b.o c.obj b.abj
obj1:=0.o b.o 1.obj 10.obj 5.obj
tempvar:=$(filter-out $(obj),$(obj1))
$(warning filter-out参数是保留参数2的元素但是如果在参数1中有的会排除掉 $(tempvar))

