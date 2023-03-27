## gdbinit 

#add-auto-load-safe-path $VM_KERNEL/vmlinux-gdb.py

#set logging on
set history save on
set pagination off
set max-value-size unlimited
set print pretty on
set print object on
set print static-members on
set print vtbl on
set print demangle on
set demangle-style gnu-v3
set print sevenbit-strings off
set print array on
set print array-indexes on
set print elements 0

define vm_attach
    target remote /dev/pts/$arg0
end

define add_symbol
#source /mnt/nfs-working/DCC/driver/module_symbol.txt
end
