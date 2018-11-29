#本例子学习相关逻辑分支
DEBUG:=1
NAME:=qssq
SEX:=man
EMPTY:=#定义空
SPACE:=$(EMPTY) $(EMPTY) #定义空格
ifeq ($(DEBUG),1)#关键字后面需要加空格，否则语法错误
$(warning 调试模式)
else
$(warning 非调试模式)
endif


#去掉收尾空格进行判断是否为空
ifeq ($(strip $(SPACE)),)
$(warning SPACE变量去掉首尾空格为空)
endif

# 如果不是空而是空格也是不匹配的。
ifneq ($(SPACE),)
$(warning 不去掉首尾，不是空)
endif

#----------------------------------------------
ifeq ($(DEBUG),qssq)
$(warning 输出了作者)
else
$(warning 不知道你输入了什么名字,名字是$(NAME))
endif

ifeq ($(SEX),man)
$(warning 是个男人)
endif

#是否SEX等于woman字符串
ifneq ($(SEX),woman)
$(warning 不是女人)
endif

#定义变量 (看上去是一个函数
define tempvar
$(warning  执行了temp定义)
endef

#判断是否定义了tempvar
ifdef tempvar
$(warning 即将执行tempvar)
$(call tempvar)
endif




#判断是否定义了tempvar3
ifdef tempvar3
$(warning 即将执行tempvar3)
$(call tempvar3)
endif


ifndef tempvar2
$(warning 没有定义tempvar2)
endif


test:
	@echo over