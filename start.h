
//{{BLOCK(start)

//======================================================================
//
//	start, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 15 tiles (t|f reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 480 + 4096 = 5088
//
//	Time-stamp: 2022-04-22, 23:08:21
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_START_H
#define GRIT_START_H

#define startTilesLen 480
extern const unsigned short startTiles[240];

#define startMapLen 4096
extern const unsigned short startMap[2048];

#define startPalLen 512
extern const unsigned short startPal[256];

#endif // GRIT_START_H

//}}BLOCK(start)
