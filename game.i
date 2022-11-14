# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"

# 1 "game.h" 1
# 1 "mode0.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 62 "mode0.h"
extern volatile unsigned short *videoBuffer;
# 83 "mode0.h"
typedef struct {
    u16 tileimg[8192];
} charblock;


typedef struct {
    u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();


typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 152 "mode0.h"
void hideSprites();






typedef struct {
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
    int active;
} SPRITE;
# 191 "mode0.h"
extern unsigned short oldButtons;
extern unsigned short buttons;






typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 239 "mode0.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 271 "mode0.h"
typedef void (*ihp)(void);
# 295 "mode0.h"
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
int collisionCheck(unsigned char *collisionMap, int mapWidth, int col, int row, int width, int height,
        int colShift, int rowShift);
# 2 "game.h" 2






extern int hOff;
extern int vOff;
extern OBJ_ATTR shadowOAM[128];
extern SPRITE witch;


void initGame();
void updateGame();
void drawGame();
void initPlayer();
void updatePlayer();
void animatePlayer();
void drawPlayer();
# 3 "game.c" 2

# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 5 "game.c" 2
# 1 "collisionMap1.h" 1
# 21 "collisionMap1.h"
extern const unsigned short collisionMap1Bitmap[40960];


extern const unsigned short collisionMap1Pal[256];
# 6 "game.c" 2
# 1 "collisionMap2.h" 1
# 21 "collisionMap2.h"
extern const unsigned short collisionMap2Bitmap[40960];


extern const unsigned short collisionMap2Pal[256];
# 7 "game.c" 2
# 1 "collisionMap3.h" 1
# 21 "collisionMap3.h"
extern const unsigned short collisionMap3Bitmap[40960];


extern const unsigned short collisionMap3Pal[256];
# 8 "game.c" 2
# 1 "level1.h" 1
# 22 "level1.h"
extern const unsigned short level1Tiles[4912];


extern const unsigned short level1Map[2048];


extern const unsigned short level1Pal[256];
# 9 "game.c" 2
# 1 "level2.h" 1
# 22 "level2.h"
extern const unsigned short level2Tiles[6272];


extern const unsigned short level2Map[2048];


extern const unsigned short level2Pal[256];
# 10 "game.c" 2
# 1 "level3.h" 1
# 22 "level3.h"
extern const unsigned short level3Tiles[3376];


extern const unsigned short level3Map[2048];


extern const unsigned short level3Pal[256];
# 11 "game.c" 2
# 1 "sound.h" 1
void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void setupInterrupts();
void interruptHandler();

void pauseSound();
void unpauseSound();
void stopSound();
# 49 "sound.h"
typedef struct{
    const signed char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vBlankCount;
} SOUND;

SOUND soundA;
SOUND soundB;
# 12 "game.c" 2
# 1 "folkGuitar.h" 1


extern const unsigned int folkGuitar_sampleRate;
extern const unsigned int folkGuitar_length;
extern const signed char folkGuitar_data[];
# 13 "game.c" 2
# 1 "aerate.h" 1


extern const unsigned int aerate_sampleRate;
extern const unsigned int aerate_length;
extern const signed char aerate_data[];
# 14 "game.c" 2
# 1 "spell.h" 1


extern const unsigned int spell_sampleRate;
extern const unsigned int spell_length;
extern const signed char spell_data[];
# 15 "game.c" 2


int hOff;
int vOff;
OBJ_ATTR shadowOAM[128];
extern int level;
SPRITE witch;
SPRITE ants[3];
SPRITE wisps[3];
SPRITE spells[3];
int jumpCount;
int hoverCount;
int mana;
int onGround;
int cheat;


unsigned char * collisionMap;



enum {RIGHT, LEFT, JUMPRIGHT, JUMPLEFT, CASTRIGHT, CASTLEFT, HOVERRIGHT, HOVERLEFT};


void initGame() {

    vOff = 0;
    hOff = 0;
    if (level == 1) {
        collisionMap = (unsigned char *) collisionMap1Bitmap;
    } else if (level == 2) {
        collisionMap = (unsigned char *) collisionMap2Bitmap;
    } else if (level == 3) {
        collisionMap = (unsigned char *) collisionMap3Bitmap;
    }

    initPlayer();
    initAnts();
    initWisps();
    initSpells();
}


void updateGame() {
 updatePlayer();
    updateAnts();
    updateWisps();
    updateSpells();
}


void drawGame() {
    drawPlayer();
    drawAnts();
    drawWisps();
    drawSpells();
    drawForeground();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR *)(0x7000000)), 512);
    (*(volatile unsigned short *)0x04000010) = hOff;
    (*(volatile unsigned short *)0x04000012) = vOff;
    (*(volatile unsigned short *)0x04000014) = hOff / 2;
    (*(volatile unsigned short *)0x04000016) = vOff / 2;
}


void initPlayer() {
    witch.width = 16;
    witch.height = 16;
    witch.rdel = 1;
    witch.cdel = 1;
    jumpCount = 0;
    hoverCount = 0;
    mana = 3;
    onGround = 1;
    cheat = 0;

    witch.worldRow = 120;
    witch.worldCol = 4;
    witch.aniCounter = 0;
    witch.curFrame = 0;
    witch.numFrames = 3;
    witch.aniState = RIGHT;
}


void initAnts() {
    for (int i = 0; i < 3; i++) {
        ants[i].width = 32;
        ants[i].height = 16;
        ants[i].rdel = 1;
        ants[i].cdel = 1;
        ants[i].aniCounter = 0;
        ants[i].curFrame = 0;
        ants[i].numFrames = 4;
        ants[i].active = 1;
        ants[i].hide = 1;
    }
    if (level == 1) {
        ants[0].worldRow = 72 + 24;
        ants[0].worldCol = 120;

        ants[1].worldRow = 72 + 48;
        ants[1].worldCol = 400 - 80;
    } else if (level == 2) {
        ants[0].worldRow = 72;
        ants[0].worldCol = 120;

        ants[1].worldRow = 72;
        ants[1].worldCol = 400;
    } else if (level == 3) {
        ants[0].worldRow = 72 + 41;
        ants[0].worldCol = 125;

        ants[1].worldRow = 72 + 2;
        ants[1].worldCol = 400 - 6;
    }

}


void initWisps() {
    for (int i = 0; i < 3; i++) {
        wisps[i].width = 8;
        wisps[i].height = 8;
        wisps[i].rdel = 1;
        wisps[i].cdel = 1;
        wisps[i].aniCounter = 0;
        wisps[i].curFrame = 0;
        wisps[i].numFrames = 2;
        wisps[i].hide = 1;
        wisps[i].active = 1;
    }
    if (level == 1) {
        wisps[0].worldRow = 40 - 24;
        wisps[0].worldCol = 140;




        wisps[1].worldRow = 24;
        wisps[1].worldCol = 440;
    } else if (level == 2) {
        wisps[0].worldRow = 40;
        wisps[0].worldCol = 140;




        wisps[1].worldRow = 24;
        wisps[1].worldCol = 440;
    } else if (level == 3) {
        wisps[0].worldRow = 40;
        wisps[0].worldCol = 140 - 16;

        wisps[1].worldRow = 120;
        wisps[1].worldCol = 440 - 90;
    }

}


void initSpells() {
    for (int i = 0; i < 3; i++) {
        spells[i].width = 16;
        spells[i].height = 16;
        spells[i].rdel = 1;
        spells[i].cdel = 2;
        spells[i].hide = 1;

        spells[i].worldRow = witch.worldRow;
        spells[i].worldCol = witch.worldCol + witch.width;
    }
}


void updatePlayer() {

    if (collisionCheck(collisionMap, 512, witch.worldCol, witch.worldRow, witch.width, witch.height, 0, witch.rdel) && witch.worldRow < 160 && hoverCount == 0) {
        witch.worldRow += witch.rdel;
        onGround = 0;
        if (vOff + 1 < (160 - 160) && (witch.worldRow - vOff) > (160 / 2)) {
            vOff++;
        }
    } else {
        jumpCount = 0;
        onGround = 1;
    }


    if (jumpCount > 0) {
        if (collisionCheck(collisionMap, 512, witch.worldCol, witch.worldRow, witch.width, witch.height, 0, -2 * witch.rdel) && witch.worldRow > 0) {
            witch.worldRow -= 2 * witch.rdel;
            jumpCount--;
            onGround = 0;
            if (vOff - 2 >= 0 && (witch.worldRow - vOff) <= (160 / 2)) {
                vOff -= 2;
            }
        }
    }
    if((!(~(oldButtons) & ((1 << 6))) && (~buttons & ((1 << 6)))) && jumpCount == 0 && hoverCount == 0 && onGround) {
        if (collisionCheck(collisionMap, 512, witch.worldCol, witch.worldRow, witch.width, witch.height, 0, -2 * witch.rdel) && witch.worldRow > 0) {
            witch.worldRow -= 2 * witch.rdel;
            jumpCount = 20;
            onGround = 0;
            if (vOff - 2 >= 0 && (witch.worldRow - vOff) <= (160 / 2)) {
                vOff -= 2;
            }
        }
    }


    if((~((*(volatile unsigned short *)0x04000130)) & ((1 << 5)))) {
        if (collisionCheck(collisionMap, 512, witch.worldCol, witch.worldRow, witch.width, witch.height, -witch.cdel, 0) && witch.worldCol > 0) {
            witch.worldCol -= witch.cdel;
            if (hOff - 1 >= 0 && (witch.worldCol - hOff) <= (240 / 2)) {
                hOff--;
            }
        }
    }
    if((~((*(volatile unsigned short *)0x04000130)) & ((1 << 4)))) {
        if (collisionCheck(collisionMap, 512, witch.worldCol, witch.worldRow, witch.width, witch.height, witch.cdel, 0) && (witch.worldCol - hOff) < 240) {
            witch.worldCol += witch.cdel;
            if (hOff + 1 < (512 - 240) && (witch.worldCol - hOff) > (240 / 2)) {
                hOff++;
            }
        }
        if ((witch.worldCol - hOff) >= 240) {
            if (level == 3) {
                goToWin();
            } else {
                level++;
                goToGame();
                initGame();

                ((unsigned short *)0x5000000)[0]++;

            }
        }
    }


    if((!(~(oldButtons) & ((1 << 0))) && (~buttons & ((1 << 0)))) && mana > 0) {
        playSoundB(spell_data, spell_length, 0);
        spawnSpell();
        if (!cheat) {
            mana--;
        }
    }


    if((!(~(oldButtons) & ((1 << 1))) && (~buttons & ((1 << 1)))) && mana > 0) {
        playSoundB(spell_data, spell_length, 0);
        hoverCount = 80;
        if (collisionCheck(collisionMap, 512, witch.worldCol, witch.worldRow, witch.width, witch.height, 0, -8 * witch.rdel) && witch.worldRow > 0) {
            witch.worldRow -= 8;
            onGround = 0;
        }
        if (!cheat) {
            mana--;
        }

    }
    if (hoverCount > 0) {
        if (collisionCheck(collisionMap, 512, witch.worldCol, witch.worldRow, witch.width, witch.height, 0, -witch.rdel) && witch.worldRow > 0) {
            witch.worldRow -= witch.rdel;
            if (vOff - 1 >= 0 && (witch.worldRow - vOff) <= (160 / 2)) {
                vOff--;
            }
        }
        hoverCount--;
    }


    if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 7))) && (!(~(oldButtons) & ((1 << 0))) && (~buttons & ((1 << 0))))) {
        mana = 3;
        cheat = 1;
    }

    animatePlayer();
}


void animatePlayer() {


    witch.prevAniState = witch.aniState;



    if (witch.aniCounter % 20 == 0) {
        witch.curFrame = (witch.curFrame + 1) % witch.numFrames;
    }


    if ((!(~(oldButtons) & ((1 << 6))) && (~buttons & ((1 << 6)))) || jumpCount > 0) {
        witch.aniState = JUMPRIGHT;
        witch.curFrame = 0;
        witch.numFrames = 1;
    } else if (((!(~(oldButtons) & ((1 << 6))) && (~buttons & ((1 << 6)))) && witch.prevAniState == LEFT) || jumpCount > 0) {
        witch.aniState = JUMPLEFT;
        witch.curFrame = 0;
        witch.numFrames = 1;
    }
    if ((!(~(oldButtons) & ((1 << 0))) && (~buttons & ((1 << 0)))) && witch.prevAniState == LEFT) {
        witch.aniState = CASTLEFT;
        witch.curFrame = 0;
        witch.numFrames = 1;
    } else if ((!(~(oldButtons) & ((1 << 0))) && (~buttons & ((1 << 0))))) {
        witch.aniState = CASTRIGHT;
        witch.curFrame = 0;
        witch.numFrames = 1;
    }
    if ((!(~(oldButtons) & ((1 << 1))) && (~buttons & ((1 << 1)))) || hoverCount > 0) {
        witch.aniState = HOVERRIGHT;
        witch.curFrame = 0;
        witch.numFrames = 1;
    } else if (((!(~(oldButtons) & ((1 << 1))) && (~buttons & ((1 << 1)))) && witch.prevAniState == LEFT) || hoverCount > 0) {
        witch.aniState = HOVERLEFT;
        witch.curFrame = 0;
        witch.numFrames = 1;
    }
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 5)))) {
        witch.aniState = LEFT;
        witch.numFrames = 3;
        witch.aniCounter++;
    } else if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 4)))) {
        witch.aniState = RIGHT;
        witch.numFrames = 3;
        witch.aniCounter++;
    } else {
        witch.curFrame = 0;
    }
# 357 "game.c"
}


void spawnSpell() {
    for (int i = 0; i < 3; i++) {
        if (spells[i].hide) {
            spells[i].hide = 0;
            spells[i].worldRow = witch.worldRow;
            spells[i].worldCol = witch.worldCol + witch.width;
        }
    }
}


void updateAnts() {
    for (int i = 0; i < 3; i++) {
        if ((collision(witch.worldCol, witch.worldRow, witch.width, witch.height, ants[i].worldCol, ants[i].worldRow, ants[i].width, ants[i].height) && ants[i].active) || witch.worldRow + witch.height >= 160) {
            goToLose();
        }
        if ((ants[i].worldCol - hOff) > 0 && (ants[i].worldCol - hOff) < 240) {
            ants[i].hide = 0;
        }
        if (ants[i].curFrame > 0 && ants[i].curFrame < 3) {
            animateAnt(i);
        }
    }
}


void updateWisps() {
    for (int i = 0; i < 3; i++) {
        if (collision(wisps[i].worldCol, wisps[i].worldRow, wisps[i].width, wisps[i].height, witch.worldCol, witch.worldRow, witch.width, witch.height) && wisps[i].active) {
            wisps[i].active = 0;
            mana++;
        }
        if ((wisps[i].worldCol - hOff) > 0 && (wisps[i].worldCol - hOff) < 240) {
            wisps[i].hide = 0;
        }
    }
}


void animateWisp() {
    for (int i = 0; i < 3; i++) {


        if (wisps[i].aniCounter % 20 == 0) {
            wisps[i].curFrame = (wisps[i].curFrame + 1) % wisps[i].numFrames;
        }
        wisps[i].aniCounter++;
    }
}


void updateSpells() {
    for (int i = 0; i < 3; i++) {
        if (!spells[i].hide) {
            spells[i].worldCol += spells[i].cdel;
            for (int j = 0; j < 3; j++) {
                if (collision(spells[i].worldCol, spells[i].worldRow, spells[i].width, spells[i].height, ants[j].worldCol, ants[j].worldRow, ants[j].width, ants[j].height)) {
                    spells[i].hide = 1;
                    ants[j].active = 0;
                    ants[j].curFrame = 1;
                    animateAnt(j);
                }
            }
        }
        if (spells[i].worldCol > 240) {
            spells[i].hide = 1;
        }

    }
}


void animateAnt(int i) {


    if (ants[i].aniCounter % 20 == 0) {
        ants[i].curFrame = (ants[i].curFrame + 1) % ants[i].numFrames;
    }
    ants[i].aniCounter++;
}


void drawPlayer() {
    if (witch.hide) {
        shadowOAM[0].attr0 |= (2 << 8);
    } else {
        shadowOAM[0].attr0 = witch.worldRow - vOff | (0 << 14);
        shadowOAM[0].attr1 = witch.worldCol - hOff | (1 << 14);
        shadowOAM[0].attr2 = ((0) << 12) | ((witch.curFrame * 2)*32 + (witch.aniState * 2));
    }
}


void drawAnts() {
    for (int i = 0; i < 3; i++) {
        if (ants[i].hide) {
            shadowOAM[1 + i].attr0 |= (2 << 8);
        } else {
            shadowOAM[1 + i].attr0 = (ants[i].worldRow - vOff) & 0xFF | (1 << 14);
            shadowOAM[1 + i].attr1 = (ants[i].worldCol - hOff) & 0x1FF | (2 << 14);
            shadowOAM[1 + i].attr2 = ((0) << 12) | ((ants[i].curFrame * 2)*32 + (17));
        }
    }
}


void drawWisps() {
    for (int i = 0; i < 3; i++) {
        if (wisps[i].hide || !wisps[i].active) {
            shadowOAM[4 + i].attr0 |= (2 << 8);
        } else {
            shadowOAM[4 + i].attr0 = (wisps[i].worldRow - vOff) & 0xFF | (0 << 14);
            shadowOAM[4 + i].attr1 = (wisps[i].worldCol - hOff) & 0x1FF | (0 << 14);
            shadowOAM[4 + i].attr2 = ((0) << 12) | ((wisps[i].curFrame)*32 + (16));
        }
    }
}


void drawSpells() {
    for (int i = 0; i < 3; i++) {
        if (spells[i].hide) {
            shadowOAM[7 + i].attr0 |= (2 << 8);
        } else {
            shadowOAM[7 + i].attr0 = spells[i].worldRow - vOff | (0 << 14);
            shadowOAM[7 + i].attr1 = spells[i].worldCol - hOff | (1 << 14);
            shadowOAM[7 + i].attr2 = ((0) << 12) | ((0)*32 + (21));
        }
    }
}


void drawForeground() {
    for (int i = 0; i < 3; i++) {
        shadowOAM[10 + i].attr0 |= (2 << 8);
    }
    for (int i = 0; i < mana; i++) {
        shadowOAM[10 + i].attr0 = 8 | (0 << 14);
        shadowOAM[10 + i].attr1 = 6 + (8 * i) | (0 << 14);
        shadowOAM[10 + i].attr2 = ((0) << 12) | ((0)*32 + (16));
    }



}
