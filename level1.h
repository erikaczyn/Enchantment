
//{{BLOCK(level1)

//======================================================================
//
//	level1, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 307 tiles (t|f reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 9824 + 4096 = 14432
//
//	Time-stamp: 2022-04-28, 19:01:57
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LEVEL1_H
#define GRIT_LEVEL1_H

#define level1TilesLen 9824
extern const unsigned short level1Tiles[4912];

#define level1MapLen 4096
extern const unsigned short level1Map[2048];

#define level1PalLen 512
extern const unsigned short level1Pal[256];

#endif // GRIT_LEVEL1_H

//}}BLOCK(level1)
