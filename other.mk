#某sdk的写法测试
LOCAL_PATH:=$(realpath ./)
$(warning 本地目录 $(LOCAL_PATH))
#\结尾代表下一行是连续上一行的
ALLFILES :=a b c fff/b.cpp $(LOCAL_PATH)/b.cpp\
B\
C\
 dd.cpp  bb.c\
$(warning 原始数据 $(ALLFILES))
FILE_LIST := $(filter %.cpp, $(ALLFILES)) #只列出.cpp结尾的文件到FILE_LIST变量
$(warning 过滤后数据 $(FILE_LIST))
MODULE_JCLASS_SRC := $(FILE_LIST:$(LOCAL_PATH)/%=%)#把携带了路径的进行替换，实际效果就是以 $(LOCAL_PATH)开头 ，如果本身不是以这个开头则保持原样。

MODULE_JCLASS_SRC := $(FILE_LIST:$(LOCAL_PATH)/%=%_replace)#把匹配 包含了绝对路径 LOCAL_PATH/任意文件 删掉不包含绝对路径然后再加上一个bbbb
$(warning 替换结果 $(MODULE_JCLASS_SRC))
