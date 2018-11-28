#配置环境变量make,用法 输入 make -f test.mk
#图标是可以指定的，如果没有指定目标会找到第一个，如果传递了目标比如传递make -f test.mk run:则会执行后者，而不是前者。
VARIABLE1:= 555
$(param $(1))
$(info 2-$(VARIABLE1))

include test1.mk#包含就会执行
aa=$(call VARIABLE1,hello,world)#不用冒号也可以定义?/
$(warning 你可以输入make -f test.mk help执行菜单帮助)
test:run #执行test会导致run执行，类似别名。
$(info 2-$(aa))
help:
	@echo 欢迎学习mk,你如果能执行本文件,那么你应该可以算和我一样已经找到了写make的感觉了。
	@echo 输入make -f 文件 run 执行文件
	@echo 输入make -f 文件 compile 编译文件
	@echo 执行了all任务，
	@echo 隐含的内置变量$(RM)和$(AR)和$(CC)和$(CXX)
	@echo 你好 你好 target下面的东西都需要用空格隔开，否则会出现语法错误。
	@echo make语法中以艾特开头可以执行系统的命令，如echo就属于.
	
	
	
$(warning Wellcome Study write makefile)
TEMP:=HELLO
$(warning execcompile)#不执行..似乎不能连续输出多个
compile: #语法规定
	gcc -o foo hello.c
	./foo.exe
	@echo 执行编译完成


run:
	@echo 执行了run。。。。。。。。。。。。。。。。。。。
	./foo.exe