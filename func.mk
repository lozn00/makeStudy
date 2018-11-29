#本例子学习了函数的调用以及字符串如何进行替换的方法。
comma:= -#逗号 表示用作替换的
empty:=#空 
space:= $(empty) $(empty)#空格 查找的文本
strs:= a b c d e f g#字符串替换把里面的空格全部替换为逗号

bar:= $(subst $(space),$(comma),$(strs)) #$subst路径替换方法 要替换的文本 用作替换的文本,字符串 ,可以看出来 这函数不需要括号的。不过外层需要括号。
$(warning result:$(bar))

#转义与匹配
#把任意*.c替换为*.o x.c.c bar.c替换结果: x.c.o bar.o
result:=$(patsubst %.c,%.o,str is[x.c.c bar.c])


$(warning $(result))
result1:=$(patsubst %.c,%.\,,str 11is[x.c.c bar.c])
$(warning $(result1))
test:
	@echo over