# @忽略命令名， -忽略错误 ， rm删除不存在的文件会出错
defaulttask:
	@echo 测试艾特[用肉眼比较区别]
	echo 测试艾特[比肉眼较区别]
	-mkdir qssq666
	-rm *.o
	rm *.fffffffffffffffffff*ffffffff*
	echo 你永远无法执行到这句话 除非上一行忽略错误或者匹配成立。