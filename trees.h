
//{{BLOCK(trees)

//======================================================================
//
//	trees, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 526 tiles (t|f reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 16832 + 4096 = 21440
//
//	Time-stamp: 2022-04-29, 02:47:40
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_TREES_H
#define GRIT_TREES_H

#define treesTilesLen 16832
extern const unsigned short treesTiles[8416];

#define treesMapLen 4096
extern const unsigned short treesMap[2048];

#define treesPalLen 512
extern const unsigned short treesPal[256];

#endif // GRIT_TREES_H

//}}BLOCK(trees)
