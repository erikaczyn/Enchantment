#include "mode0.h"
#include "title.h"
#include "instructions.h"
#include "level1.h"
#include "level2.h"
#include "level3.h"
#include "game.h"
#include "pause.h"
#include "lose.h"
#include "spritesheet.h"
#include "trees.h"
#include "win.h"
#include "sound.h"
#include "folkGuitar.h"
#include "aerate.h"

/*
How to play: UP is jump, A is primary spell (shrink ant), B is secondary spell (hover), START and A are state transitions, 
SELECT changes the color of the witch's clothes, hold DOWN and press A to activate the infinite mana cheat*/

// Prototypes
void initialize();

// State Prototypes
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

// States
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

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Shadow OAM
OBJ_ATTR shadowOAM[128];

int main() {
    initialize();

    while (1) {
        // Update button variables.
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine.
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

// Sets up GBA
void initialize() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
    // BG setup
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(24) | BG_SIZE_WIDE;
    REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(30) | BG_SIZE_WIDE;

    buttons = BUTTONS;
    oldButtons = 0;

    setupSounds();
    setupInterrupts();

    playSoundA(aerate_data, aerate_length, 1);
    goToStart();
}

// Sets up the start state
void goToStart() {

    waitForVBlank();
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);

    // Set up the start screen
    DMANow(3, titlePal, PALETTE, 256);
    DMANow(3, titleTiles, &CHARBLOCK[0], titleTilesLen / 2);
    DMANow(3, titleMap, &SCREENBLOCK[24], titleMapLen / 2);

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    state = START;
}

// Runs every frame of the start state
void start() {
    // State transition
    if (BUTTON_PRESSED(BUTTON_A)) {
        goToInstructions();
    }
    // State transition
    if (BUTTON_PRESSED(BUTTON_START)) {
        level = 1;
        goToGame();
        playSoundA(folkGuitar_data, folkGuitar_length, 1);
        initGame();
    }
}

// Sets up the instructions state
void goToInstructions() {
    waitForVBlank();
    hideSprites();

    // Set up the instructions screen
    DMANow(3, instructionsPal, PALETTE, 256);
    DMANow(3, instructionsTiles, &CHARBLOCK[0], instructionsTilesLen / 2);
    DMANow(3, instructionsMap, &SCREENBLOCK[24], instructionsMapLen / 2);

    state = INSTRUCTIONS;
}

// Runs every frame of the win state
void instructions() {
    // State transition
    if (BUTTON_PRESSED(BUTTON_A)) {
        goToStart();
    }
    // State transition
    if (BUTTON_PRESSED(BUTTON_START)) {
        level = 1;
        goToGame();
        playSoundA(folkGuitar_data, folkGuitar_length, 1);
        initGame();
    }
}

// Sets up the game state
void goToGame() {
    waitForVBlank();

    // Set up the game background
    DMANow(3, level1Pal, PALETTE, 256);
    DMANow(3, treesTiles, &CHARBLOCK[1], treesTilesLen / 2);
    DMANow(3, treesMap, &SCREENBLOCK[30], treesMapLen / 2);

    //REG_BG1VOFF = vOff;
    //REG_BG1HOFF = hOff;

    // Set up the foreground
    if (level == 1) {
        DMANow(3, level1Tiles, &CHARBLOCK[0], level1TilesLen / 2);
        DMANow(3, level1Map, &SCREENBLOCK[24], level1MapLen / 2);
    } else if (level == 2) {
        DMANow(3, level2Tiles, &CHARBLOCK[0], level2TilesLen / 2);
        DMANow(3, level2Map, &SCREENBLOCK[24], level2MapLen / 2);
    } else if (level == 3) {
        DMANow(3, level3Tiles, &CHARBLOCK[0], level3TilesLen / 2);
        DMANow(3, level3Map, &SCREENBLOCK[24], level3MapLen / 2);
    }

    REG_BG0VOFF = vOff;
    REG_BG0HOFF = hOff;

    // Set up the sprites
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen / 2);
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);

    state = GAME;
}

// Runs every frame of the game state
void game() {
    updateGame();
    drawGame();
    
    // State transition
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
}

// Sets up the pause state
void goToPause() {
    waitForVBlank();
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);

    // Set up the pause screen
    DMANow(3, pausePal, PALETTE, 256);
    DMANow(3, pauseTiles, &CHARBLOCK[0], pauseTilesLen / 2);
    DMANow(3, pauseMap, &SCREENBLOCK[24], pauseMapLen / 2);

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    state = PAUSE;
}

// Runs every frame of the pause state
void pause() {
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    // State transition
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
    // State transition
    if (BUTTON_PRESSED(BUTTON_A)) {
        playSoundA(aerate_data, aerate_length, 1);
        goToStart();
    }
}

// Sets up the lose state
void goToLose() {
    waitForVBlank();
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);

    // Set up the lose screen
    DMANow(3, losePal, PALETTE, 256);
    DMANow(3, loseTiles, &CHARBLOCK[0], loseTilesLen / 2);
    DMANow(3, loseMap, &SCREENBLOCK[24], loseMapLen / 2);

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    state = LOSE;
}

// Runs every frame of the lose state
void lose() {
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    // State transition
    if (BUTTON_PRESSED(BUTTON_START)) {
        playSoundA(aerate_data, aerate_length, 1);
        goToStart();
    }
}

// Sets up the win state
void goToWin() {
    waitForVBlank();
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);

    // Set up the win screen
    DMANow(3, winPal, PALETTE, 256);
    DMANow(3, winTiles, &CHARBLOCK[0], winTilesLen / 2);
    DMANow(3, winMap, &SCREENBLOCK[24], winMapLen / 2);

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    state = WIN;
}

// Runs every frame of the win state
void win() {
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    // State transition
    if (BUTTON_PRESSED(BUTTON_START)) {
        playSoundA(aerate_data, aerate_length, 1);
        goToStart();
    }
}