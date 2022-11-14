
//{{BLOCK(level2)

//======================================================================
//
//	level2, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 392 tiles (t|f reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 12544 + 4096 = 17152
//
//	Time-stamp: 2022-04-28, 21:48:05
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LEVEL2_H
#define GRIT_LEVEL2_H

#define level2TilesLen 12544
extern const unsigned short level2Tiles[6272];

#define level2MapLen 4096
extern const unsigned short level2Map[2048];

#define level2PalLen 512
extern const unsigned short level2Pal[256];

#endif // GRIT_LEVEL2_H

//}}BLOCK(level2)
