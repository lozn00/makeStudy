$(warning ----------------------)
#.PHONY 关键字 作用1 如果文件名和target名一样会导致 这个无法执行提示is up to date.
#http://www.gnu.org/software/make/manual/make.html#Phony-Targets
#如果没有传递参数会执行第一个任务，而这里的作用是依次执行了all:右边所有任务，最后执行all自身。
all:testphony bbb test1 test2
	@echo ...exec clean clean exe file
	@echo ...default task execute over....

#虚假模板放到最上面就默认执行了不方便测试PYTHON:的作用。
.PHONY:testphony

testphony:
	@echo testphony
.PHONY:clean
# -表示执行出错也会继续执行。@则不显示执行的命令名
clean:
	-rm *.o
	@echo clean exec over

bbb:
	@echo bbb
test1:
	@echo test1
test2:
	@echo test2
