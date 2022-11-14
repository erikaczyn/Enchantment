
#include "game.h"
#include "mode0.h"
#include "spritesheet.h"
#include "collisionMap1.h"
#include "collisionMap2.h"
#include "collisionMap3.h"
#include "level1.h"
#include "level2.h"
#include "level3.h"
#include "sound.h"
#include "folkGuitar.h"
#include "aerate.h"
#include "spell.h"

// Variables
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

// Collision map
unsigned char * collisionMap;


// Witch animation states for aniState
enum {RIGHT, LEFT, JUMPRIGHT, JUMPLEFT, CASTRIGHT, CASTLEFT, HOVERRIGHT, HOVERLEFT};

// Initialize the game
void initGame() {
    // Place screen on map
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

// Updates the game each frame
void updateGame() {
	updatePlayer();
    updateAnts();
    updateWisps();
    updateSpells();
}

// Draws the game each frame
void drawGame() {
    drawPlayer();
    drawAnts();
    drawWisps();
    drawSpells();
    drawForeground();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);
    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
    REG_BG1HOFF = hOff / 2;
    REG_BG1VOFF = vOff / 2;
}

// Initialize the player
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

// Initialize the ants
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

// Initialize the wisps
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

        //wisps[1].worldRow = 24;
        //wisps[1].worldCol = 360;

        wisps[1].worldRow = 24;
        wisps[1].worldCol = 440; 
    } else if (level == 2) {
        wisps[0].worldRow = 40;
        wisps[0].worldCol = 140;

        //wisps[1].worldRow = 24;
        //wisps[1].worldCol = 360;

        wisps[1].worldRow = 24;
        wisps[1].worldCol = 440; 
    } else if (level == 3) {
        wisps[0].worldRow = 40;
        wisps[0].worldCol = 140 - 16;

        wisps[1].worldRow = 120;
        wisps[1].worldCol = 440 - 90; 
    }
    
}

// Initialize the spells
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

// Handle every-frame actions of the player
void updatePlayer() {
    // gravity
    if (collisionCheck(collisionMap, MAPWIDTH, witch.worldCol, witch.worldRow, witch.width, witch.height, 0, witch.rdel) && witch.worldRow < MAPHEIGHT && hoverCount == 0) {
        witch.worldRow += witch.rdel;
        onGround = 0;
        if (vOff + 1 < (MAPHEIGHT - SCREENHEIGHT) && (witch.worldRow - vOff) > (SCREENHEIGHT / 2)) {
            vOff++;
        }
    } else {
        jumpCount = 0;
        onGround = 1;
    }

    // jumping
    if (jumpCount > 0) {
        if (collisionCheck(collisionMap, MAPWIDTH, witch.worldCol, witch.worldRow, witch.width, witch.height, 0, -2 * witch.rdel) && witch.worldRow > 0) {
            witch.worldRow -= 2 * witch.rdel;
            jumpCount--;
            onGround = 0;
            if (vOff - 2 >= 0 && (witch.worldRow - vOff) <= (SCREENHEIGHT / 2)) {
                vOff -= 2;
            }
        }
    }
    if(BUTTON_PRESSED(BUTTON_UP) && jumpCount == 0 && hoverCount == 0 && onGround) {
        if (collisionCheck(collisionMap, MAPWIDTH, witch.worldCol, witch.worldRow, witch.width, witch.height, 0, -2 * witch.rdel) && witch.worldRow > 0) {
            witch.worldRow -= 2 * witch.rdel;
            jumpCount = 20;
            onGround = 0;
            if (vOff - 2 >= 0 && (witch.worldRow - vOff) <= (SCREENHEIGHT / 2)) {
                vOff -= 2;
            }
        }
    }

    // movement
    if(BUTTON_HELD(BUTTON_LEFT)) {
        if (collisionCheck(collisionMap, MAPWIDTH, witch.worldCol, witch.worldRow, witch.width, witch.height, -witch.cdel, 0) && witch.worldCol > 0) {
            witch.worldCol -= witch.cdel;
            if (hOff - 1 >= 0 && (witch.worldCol - hOff) <= (SCREENWIDTH / 2)) {
                hOff--;
            }
        }
    }
    if(BUTTON_HELD(BUTTON_RIGHT)) {
        if (collisionCheck(collisionMap, MAPWIDTH, witch.worldCol, witch.worldRow, witch.width, witch.height, witch.cdel, 0) && (witch.worldCol - hOff) < SCREENWIDTH) {
            witch.worldCol += witch.cdel;
            if (hOff + 1 < (MAPWIDTH - SCREENWIDTH) && (witch.worldCol - hOff) > (SCREENWIDTH / 2)) {
                hOff++;
            }
        }
        if ((witch.worldCol - hOff) >= SCREENWIDTH) {
            if (level == 3) {
                goToWin();
            } else {
                level++;
                goToGame();
                initGame();
                // modify the palette at runtime
                PALETTE[0]++;
                //PALETTE[1]++;
            }
        }
    }

    // primary spell
    if(BUTTON_PRESSED(BUTTON_A) && mana > 0) {
        playSoundB(spell_data, spell_length, 0);
        spawnSpell();
        if (!cheat) {
            mana--;
        }
    }

    // secondary spell
    if(BUTTON_PRESSED(BUTTON_B) && mana > 0) {
        playSoundB(spell_data, spell_length, 0);
        hoverCount = 80;
        if (collisionCheck(collisionMap, MAPWIDTH, witch.worldCol, witch.worldRow, witch.width, witch.height, 0, -8 * witch.rdel) && witch.worldRow > 0) {
            witch.worldRow -= 8;
            onGround = 0;
        }
        if (!cheat) {
            mana--;
        }
        
    }
    if (hoverCount > 0) {
        if (collisionCheck(collisionMap, MAPWIDTH, witch.worldCol, witch.worldRow, witch.width, witch.height, 0, -witch.rdel) && witch.worldRow > 0) {
            witch.worldRow -= witch.rdel;
            if (vOff - 1 >= 0 && (witch.worldRow - vOff) <= (SCREENHEIGHT / 2)) {
                vOff--;
            }
        }
        hoverCount--;
    }

    // cheat
    if (BUTTON_HELD(BUTTON_DOWN) && BUTTON_PRESSED(BUTTON_A)) {
        mana = 3;
        cheat = 1;
    }

    animatePlayer();
}

// Handle player animation states
void animatePlayer() {

    // Set previous state to current state
    witch.prevAniState = witch.aniState;
    //witch.aniState = RIGHT;

    // Change the animation frame every 20 frames of gameplay
    if (witch.aniCounter % 20 == 0) {
        witch.curFrame = (witch.curFrame + 1) % witch.numFrames;
    }

    // Control movement and change animation state
    if (BUTTON_PRESSED(BUTTON_UP) || jumpCount > 0) {
        witch.aniState = JUMPRIGHT;
        witch.curFrame = 0;
        witch.numFrames = 1;
    } else if ((BUTTON_PRESSED(BUTTON_UP) && witch.prevAniState == LEFT) || jumpCount > 0) {
        witch.aniState = JUMPLEFT;
        witch.curFrame = 0;
        witch.numFrames = 1;
    }
    if (BUTTON_PRESSED(BUTTON_A) && witch.prevAniState == LEFT) {
        witch.aniState = CASTLEFT;
        witch.curFrame = 0;
        witch.numFrames = 1;
    } else if (BUTTON_PRESSED(BUTTON_A)) {
        witch.aniState = CASTRIGHT;
        witch.curFrame = 0;
        witch.numFrames = 1;
    }
    if (BUTTON_PRESSED(BUTTON_B) || hoverCount > 0) {
        witch.aniState = HOVERRIGHT;
        witch.curFrame = 0;
        witch.numFrames = 1;
    } else if ((BUTTON_PRESSED(BUTTON_B) && witch.prevAniState == LEFT) || hoverCount > 0) {
        witch.aniState = HOVERLEFT;
        witch.curFrame = 0;
        witch.numFrames = 1;
    }
    if (BUTTON_HELD(BUTTON_LEFT)) {
        witch.aniState = LEFT;
        witch.numFrames = 3;
        witch.aniCounter++;
    } else if (BUTTON_HELD(BUTTON_RIGHT)) {
        witch.aniState = RIGHT;
        witch.numFrames = 3;
        witch.aniCounter++;
    } else {
        witch.curFrame = 0;
    }

    // If the witch aniState is idle, frame is witch standing
    /*if (witch.aniState == RIGHT) {
        witch.curFrame = 0;
        witch.aniCounter = 0;
        witch.aniState = witch.prevAniState;
    } else {
        witch.aniCounter++;
    }*/
}

// Spawn a new spell sprite
void spawnSpell() {
    for (int i = 0; i < 3; i++) {
        if (spells[i].hide) {
            spells[i].hide = 0;
            spells[i].worldRow = witch.worldRow;
            spells[i].worldCol = witch.worldCol + witch.width;
        }
    }
}

// Handle every-frame actions of the ants
void updateAnts() {
    for (int i = 0; i < 3; i++) {
        if ((collision(witch.worldCol, witch.worldRow, witch.width, witch.height, ants[i].worldCol, ants[i].worldRow, ants[i].width, ants[i].height) && ants[i].active) || witch.worldRow + witch.height >= SCREENHEIGHT) {
            goToLose();
        }
        if ((ants[i].worldCol - hOff) > 0 && (ants[i].worldCol - hOff) < SCREENWIDTH) {
            ants[i].hide = 0;
        }
        if (ants[i].curFrame > 0 && ants[i].curFrame < 3) {
            animateAnt(i);
        }
    }
}

// Handle every-frame actions of the wisps
void updateWisps() {
    for (int i = 0; i < 3; i++) {
        if (collision(wisps[i].worldCol, wisps[i].worldRow, wisps[i].width, wisps[i].height, witch.worldCol, witch.worldRow, witch.width, witch.height) && wisps[i].active) {
            wisps[i].active = 0;
            mana++;
        }
        if ((wisps[i].worldCol - hOff) > 0 && (wisps[i].worldCol - hOff) < SCREENWIDTH) {
            wisps[i].hide = 0;
        }
    }
}

// Handle wisp animation states
void animateWisp() {
    for (int i = 0; i < 3; i++) {

        // Change the animation frame every 20 frames of gameplay
        if (wisps[i].aniCounter % 20 == 0) {
            wisps[i].curFrame = (wisps[i].curFrame + 1) % wisps[i].numFrames;
        }
        wisps[i].aniCounter++;
    }
}

// Handle every-frame actions of the spells
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
        if (spells[i].worldCol > SCREENWIDTH) {
            spells[i].hide = 1;
        }
        
    }
}

// Handle ant animation states
void animateAnt(int i) {

    // Change the animation frame every 20 frames of gameplay
    if (ants[i].aniCounter % 20 == 0) {
        ants[i].curFrame = (ants[i].curFrame + 1) % ants[i].numFrames;
    }
    ants[i].aniCounter++;
}

// Draw the player
void drawPlayer() {
    if (witch.hide) {
        shadowOAM[0].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[0].attr0 = witch.worldRow - vOff | ATTR0_SQUARE;
        shadowOAM[0].attr1 = witch.worldCol - hOff | ATTR1_SMALL;
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(witch.aniState * 2, witch.curFrame * 2);
    }
}

// Draw the ants
void drawAnts() {
    for (int i = 0; i < 3; i++) {
        if (ants[i].hide) {
            shadowOAM[1 + i].attr0 |= ATTR0_HIDE;
        } else {
            shadowOAM[1 + i].attr0 = (ants[i].worldRow - vOff) & ROWMASK | ATTR0_WIDE;
            shadowOAM[1 + i].attr1 = (ants[i].worldCol - hOff) & COLMASK | ATTR1_MEDIUM;
            shadowOAM[1 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(17, ants[i].curFrame * 2);
        }
    }
}

// Draw the wisps
void drawWisps() {
    for (int i = 0; i < 3; i++) {
        if (wisps[i].hide || !wisps[i].active) {
            shadowOAM[4 + i].attr0 |= ATTR0_HIDE;
        } else {
            shadowOAM[4 + i].attr0 = (wisps[i].worldRow - vOff) & ROWMASK | ATTR0_SQUARE;
            shadowOAM[4 + i].attr1 = (wisps[i].worldCol - hOff) & COLMASK | ATTR1_TINY;
            shadowOAM[4 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(16, wisps[i].curFrame);
        }
    }
}

// Draw the spells
void drawSpells() {
    for (int i = 0; i < 3; i++) {
        if (spells[i].hide) {
            shadowOAM[7 + i].attr0 |= ATTR0_HIDE;
        } else {
            shadowOAM[7 + i].attr0 = spells[i].worldRow - vOff | ATTR0_SQUARE;
            shadowOAM[7 + i].attr1 = spells[i].worldCol - hOff | ATTR1_SMALL;
            shadowOAM[7 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(21, 0);
        }
    }
}

// Draw the foreground (HUD)
void drawForeground() {
    for (int i = 0; i < 3; i++) {
        shadowOAM[10 + i].attr0 |= ATTR0_HIDE;
    }
    for (int i = 0; i < mana; i++) {
        shadowOAM[10 + i].attr0 = 8 | ATTR0_SQUARE;
        shadowOAM[10 + i].attr1 = 6 + (8 * i) | ATTR1_TINY;
        shadowOAM[10 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(16, 0);
    }
    


}
    