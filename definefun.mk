define testFunc1
$(warning called)
$(warning            函数名$(0)----arg1-$(1)---arg2-$(2)---arg3-$(3)------)
endef #不是endif 而是endef
$(call testFunc1,testa,testb,testc)