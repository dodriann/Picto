#include <3ds.h>
#include <stdio.h>

int main(void)
{
    gfxInitDefault();
    consoleInit(GFX_TOP, NULL);

    printf("Hallo 3DS!\\n");
    printf("Druecke START zum Beenden.\\n");

    while (aptMainLoop())
    {
        hidScanInput();
        if (hidKeysDown() & KEY_START) break;

        gfxFlushBuffers();
        gfxSwapBuffers();
        gspWaitForVBlank();
    }

    gfxExit();
    return 0;
}
