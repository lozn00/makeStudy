#本例子学习了函数的调用以及字符串如何进行替换的方法。
#dir 方法可以传递任意多个参数将返回一个不带文件的目录。
#如下打印结果为fileopera.mk:3: ./ / ../ ../../  可以得出结论是获取相对目录，而不是磁盘转换的目录。
MY_VAR:=$(dir src /foo.c ../test.a ../../my.a)
$(warning 测试取目录函数 $(MY_VAR))
MY_VAR1:=$(notdir /a/t.txt /foo.c ../test.a ../../my.a)

# 提取文件名 不包含路径
$(warning 测试取文件名函数$(MY_VAR1))
#提取后缀数组
MY_VAR1:=$(suffix /aa/ttt.txt  ../aa/fff.c)
$(warning 测试去后缀函数 $(MY_VAR1))

#提取携带相对路径携带文件名但是不带后缀。
MY_VAR1:=$(basename /aa/ttt.txt  ../aa/fff.c)
$(warning 提取basename函数 $(MY_VAR1))

#添加后缀函数返回的是包含全部路径的文件名。 只能传递两个参数，第一个参数是后缀第二个是路径，指定多个路径用空格隔开
MY_VAR1:=$(addsuffix .txt,aa bb)
$(warning 测试添加后缀函数 $(MY_VAR1))
#给所有文件或者文件路径在前面再添加路径 只支持传递两个参数 操作多个文件用空格隔开
MY_VAR1:=$(addprefix /sdcard/,tencent qssq666)
$(warning 测试添加前缀函数添加路径 $(MY_VAR1))
#给list的每一个元素加入一个到前面
MY_VAR1:=$(join a b c,str1 str2 str3)
$(warning 测试join str 123前面分别插入了abc->$(MY_VAR1))

#测试 wildcard 通配符实现获取当前目录所有mk文件
MY_VAR1:=$(wildcard *.mk)
$(warning 搜索当前目录下所有mk文件 ->$(MY_VAR1))
# 获取执行文件的路径 (真实路径Cygdrive可能结果有点无法接受) realpath  abspath结果都一样

MY_VAR1:=$(realpath ./)
$(warning 获取当前目录文件 ->[$(MY_VAR1)])


MY_VAR1:=$(abspath fileopera.mk)
$(warning 获取当前绝对路径文件 ->$(MY_VAR1))


test:
	@echo over