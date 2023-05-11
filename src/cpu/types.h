#ifndef TYPES_H
#define TYPES_H

typedef unsigned 	int		u32;
typedef 			int		i32;
typedef unsigned	short	u16;
typedef 			short	i16;
typedef unsigned	char	u8;
typedef 			char	i8;

#define low_16(address) (u16)((address) & 0xFFFF)
#define high_16(address) (u16)(((address) >> 16) & 0xFFFF)

#endif
