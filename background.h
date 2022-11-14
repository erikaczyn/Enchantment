
//{{BLOCK(background)

//======================================================================
//
//	background, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 393 tiles (t|f reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 12576 + 4096 = 17184
//
//	Time-stamp: 2022-04-28, 16:27:23
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BACKGROUND_H
#define GRIT_BACKGROUND_H

#define backgroundTilesLen 12576
extern const unsigned short backgroundTiles[6288];

#define backgroundMapLen 4096
extern const unsigned short backgroundMap[2048];

#define backgroundPalLen 512
extern const unsigned short backgroundPal[256];

#endif // GRIT_BACKGROUND_H

//}}BLOCK(background)
