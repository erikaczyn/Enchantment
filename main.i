# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
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
# 2 "main.c" 2
# 1 "title.h" 1
# 22 "title.h"
extern const unsigned short titleTiles[5568];


extern const unsigned short titleMap[1024];


extern const unsigned short titlePal[256];
# 3 "main.c" 2
# 1 "instructions.h" 1
# 22 "instructions.h"
extern const unsigned short instructionsTiles[5264];


extern const unsigned short instructionsMap[1024];


extern const unsigned short instructionsPal[256];
# 4 "main.c" 2
# 1 "level1.h" 1
# 22 "level1.h"
extern const unsigned short level1Tiles[4912];


extern const unsigned short level1Map[2048];


extern const unsigned short level1Pal[256];
# 5 "main.c" 2
# 1 "level2.h" 1
# 22 "level2.h"
extern const unsigned short level2Tiles[6272];


extern const unsigned short level2Map[2048];


extern const unsigned short level2Pal[256];
# 6 "main.c" 2
# 1 "level3.h" 1
# 22 "level3.h"
extern const unsigned short level3Tiles[3376];


extern const unsigned short level3Map[2048];


extern const unsigned short level3Pal[256];
# 7 "main.c" 2
# 1 "game.h" 1







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
# 8 "main.c" 2
# 1 "pause.h" 1
# 22 "pause.h"
extern const unsigned short pauseTiles[5216];


extern const unsigned short pauseMap[1024];


extern const unsigned short pausePal[256];
# 9 "main.c" 2
# 1 "lose.h" 1
# 22 "lose.h"
extern const unsigned short loseTiles[7232];


extern const unsigned short loseMap[1024];


extern const unsigned short losePal[256];
# 10 "main.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 11 "main.c" 2
# 1 "trees.h" 1
# 22 "trees.h"
extern const unsigned short treesTiles[8416];


extern const unsigned short treesMap[2048];


extern const unsigned short treesPal[256];
# 12 "main.c" 2
# 1 "win.h" 1
# 22 "win.h"
extern const unsigned short winTiles[5968];


extern const unsigned short winMap[1024];


extern const unsigned short winPal[256];
# 13 "main.c" 2
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
# 14 "main.c" 2
# 1 "folkGuitar.h" 1


extern const unsigned int folkGuitar_sampleRate;
extern const unsigned int folkGuitar_length;
extern const signed char folkGuitar_data[];
# 15 "main.c" 2
# 1 "aerate.h" 1


extern const unsigned int aerate_sampleRate;
extern const unsigned int aerate_length;
extern const signed char aerate_data[];
# 16 "main.c" 2






void initialize();


void goToStart();
void start();
void goToInstructions();
void instructions();
void goToGame();
void game();
void goToGame2();
void game2();
void goToPause();
void pause();
void goToLose();
void lose();
void goToWin();
void win();


enum {
    START,
    INSTRUCTIONS,
    GAME,
    PAUSE,
    LOSE,
    WIN
};
int state;
int level;


unsigned short buttons;
unsigned short oldButtons;


OBJ_ATTR shadowOAM[128];

int main() {
    initialize();

    while (1) {

        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);


        switch (state) {
        case START:
            start();
            break;
        case INSTRUCTIONS:
            instructions();
            break;
        case GAME:
            game();
            break;
        case PAUSE:
            pause();
            break;
        case LOSE:
            lose();
            break;
        case WIN:
            win();
            break;
        }
    }
}


void initialize() {
    (*(volatile unsigned short *)0x4000000) = 0 | (1 << 8) | (1 << 9) | (1 << 12);

    (*(volatile unsigned short *)0x4000008) = ((0) << 2) | ((24) << 8) | (1 << 14);
    (*(volatile unsigned short *)0x400000A) = ((1) << 2) | ((30) << 8) | (1 << 14);

    buttons = (*(volatile unsigned short *)0x04000130);
    oldButtons = 0;

    setupSounds();
    setupInterrupts();

    playSoundA(aerate_data, aerate_length, 1);
    goToStart();
}


void goToStart() {

    waitForVBlank();
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR *)(0x7000000)), 512);


    DMANow(3, titlePal, ((unsigned short *)0x5000000), 256);
    DMANow(3, titleTiles, &((charblock *)0x6000000)[0], 11136 / 2);
    DMANow(3, titleMap, &((screenblock *)0x6000000)[24], 2048 / 2);

    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;

    state = START;
}


void start() {

    if ((!(~(oldButtons) & ((1 << 0))) && (~buttons & ((1 << 0))))) {
        goToInstructions();
    }

    if ((!(~(oldButtons) & ((1 << 3))) && (~buttons & ((1 << 3))))) {
        level = 1;
        goToGame();
        playSoundA(folkGuitar_data, folkGuitar_length, 1);
        initGame();
    }
}


void goToInstructions() {
    waitForVBlank();
    hideSprites();


    DMANow(3, instructionsPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, instructionsTiles, &((charblock *)0x6000000)[0], 10528 / 2);
    DMANow(3, instructionsMap, &((screenblock *)0x6000000)[24], 2048 / 2);

    state = INSTRUCTIONS;
}


void instructions() {

    if ((!(~(oldButtons) & ((1 << 0))) && (~buttons & ((1 << 0))))) {
        goToStart();
    }

    if ((!(~(oldButtons) & ((1 << 3))) && (~buttons & ((1 << 3))))) {
        level = 1;
        goToGame();
        playSoundA(folkGuitar_data, folkGuitar_length, 1);
        initGame();
    }
}


void goToGame() {
    waitForVBlank();


    DMANow(3, level1Pal, ((unsigned short *)0x5000000), 256);
    DMANow(3, treesTiles, &((charblock *)0x6000000)[1], 16832 / 2);
    DMANow(3, treesMap, &((screenblock *)0x6000000)[30], 4096 / 2);





    if (level == 1) {
        DMANow(3, level1Tiles, &((charblock *)0x6000000)[0], 9824 / 2);
        DMANow(3, level1Map, &((screenblock *)0x6000000)[24], 4096 / 2);
    } else if (level == 2) {
        DMANow(3, level2Tiles, &((charblock *)0x6000000)[0], 12544 / 2);
        DMANow(3, level2Map, &((screenblock *)0x6000000)[24], 4096 / 2);
    } else if (level == 3) {
        DMANow(3, level3Tiles, &((charblock *)0x6000000)[0], 6752 / 2);
        DMANow(3, level3Map, &((screenblock *)0x6000000)[24], 4096 / 2);
    }

    (*(volatile unsigned short *)0x04000012) = vOff;
    (*(volatile unsigned short *)0x04000010) = hOff;


    DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 32768 / 2);
    DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 512 / 2);
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR *)(0x7000000)), 512);

    state = GAME;
}


void game() {
    updateGame();
    drawGame();


    if ((!(~(oldButtons) & ((1 << 3))) && (~buttons & ((1 << 3))))) {
        goToPause();
    }
}


void goToPause() {
    waitForVBlank();
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR *)(0x7000000)), 512);


    DMANow(3, pausePal, ((unsigned short *)0x5000000), 256);
    DMANow(3, pauseTiles, &((charblock *)0x6000000)[0], 10432 / 2);
    DMANow(3, pauseMap, &((screenblock *)0x6000000)[24], 2048 / 2);

    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;

    state = PAUSE;
}


void pause() {
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR *)(0x7000000)), 512);
    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;

    if ((!(~(oldButtons) & ((1 << 3))) && (~buttons & ((1 << 3))))) {
        goToGame();
    }

    if ((!(~(oldButtons) & ((1 << 0))) && (~buttons & ((1 << 0))))) {
        playSoundA(aerate_data, aerate_length, 1);
        goToStart();
    }
}


void goToLose() {
    waitForVBlank();
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR *)(0x7000000)), 512);


    DMANow(3, losePal, ((unsigned short *)0x5000000), 256);
    DMANow(3, loseTiles, &((charblock *)0x6000000)[0], 14464 / 2);
    DMANow(3, loseMap, &((screenblock *)0x6000000)[24], 2048 / 2);

    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;

    state = LOSE;
}


void lose() {
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR *)(0x7000000)), 512);
    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;

    if ((!(~(oldButtons) & ((1 << 3))) && (~buttons & ((1 << 3))))) {
        playSoundA(aerate_data, aerate_length, 1);
        goToStart();
    }
}


void goToWin() {
    waitForVBlank();
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR *)(0x7000000)), 512);


    DMANow(3, winPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, winTiles, &((charblock *)0x6000000)[0], 11936 / 2);
    DMANow(3, winMap, &((screenblock *)0x6000000)[24], 2048 / 2);

    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;

    state = WIN;
}


void win() {
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR *)(0x7000000)), 512);
    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;

    if ((!(~(oldButtons) & ((1 << 3))) && (~buttons & ((1 << 3))))) {
        playSoundA(aerate_data, aerate_length, 1);
        goToStart();
    }
}
