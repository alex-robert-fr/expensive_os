ENTRY(kstart)
OUTPUT_FORMAT(elf32-i386)

SECTIONS {
    . = 0x1000;

    .text : {
        *(.text*)
    }

    /DISCARD/ : {
        *(.comment*)
        *(.eh_frame*)
        *(.gcc_except_table*)
        *(.note*)
        *(.rel.eh_frame*)
    }
}
