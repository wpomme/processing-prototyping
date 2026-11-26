package org.example;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class SpiralTest {

    private static final float DELTA = 0.001f;
    private static final float CX = 400f;
    private static final float CY = 400f;

    // 1. pixels の基本検証

    @Test
    @DisplayName("pixelsの数がDEGREE * revsと一致する")
    void pixelsLengthEqualsDegreesTimesRevs() {
        Spiral spiral = new Spiral(CX, CY, 20f, 3, Spiral.Type.ARCHIMEDEAN);
        assertEquals(360 * 3, spiral.pixels.length);
    }

    @Test
    @DisplayName("pixelsにnullが含まれない")
    void pixelsContainsNoNull() {
        Spiral spiral = new Spiral(CX, CY, 20f, 3, Spiral.Type.ARCHIMEDEAN);
        for (Pixel p : spiral.pixels) {
            assertNotNull(p);
        }
    }

    // 2. アルキメデスの螺旋 — theta=0 で中心になる

    @Test
    @DisplayName("アルキメデスの螺旋: theta=0の最初のピクセルが中心座標になる")
    void archimedeanFirstPixelIsCenter() {
        Spiral spiral = new Spiral(CX, CY, 20f, 3, Spiral.Type.ARCHIMEDEAN);
        assertEquals(CX, spiral.pixels[0].x, DELTA);
        assertEquals(CY, spiral.pixels[0].y, DELTA);
    }

    // 3. 対数螺旋 — theta=0 で中心にならない

    @Test
    @DisplayName("対数螺旋: theta=0の最初のピクセルが中心座標にならない")
    void logarithmicFirstPixelIsNotCenter() {
        Spiral spiral = new Spiral(CX, CY, 1f, 0.4f, 3, Spiral.Type.LOGARITHMIC);
        boolean notCenter = Math.abs(spiral.pixels[0].x - CX) > DELTA
                         || Math.abs(spiral.pixels[0].y - CY) > DELTA;
        assertTrue(notCenter);
    }

    // 4. rotate()

    @Test
    @DisplayName("rotate(0)で回転したとき元のpixelsと同じ座標が返る")
    void rotateByZeroReturnsSameCoords() {
        Spiral spiral = new Spiral(CX, CY, 20f, 3, Spiral.Type.ARCHIMEDEAN);
        Pixel[] rotated = spiral.rotate(0f);
        for (int i = 0; i < spiral.pixels.length; i++) {
            assertEquals(spiral.pixels[i].x, rotated[i].x, DELTA);
            assertEquals(spiral.pixels[i].y, rotated[i].y, DELTA);
        }
    }

    @Test
    @DisplayName("rotate(2π)で回転したとき元のpixelsとほぼ同じ座標が返る")
    void rotateByTwoPiReturnsSameCoords() {
        Spiral spiral = new Spiral(CX, CY, 20f, 3, Spiral.Type.ARCHIMEDEAN);
        Pixel[] rotated = spiral.rotate((float) (2 * Math.PI));
        for (int i = 0; i < spiral.pixels.length; i++) {
            assertEquals(spiral.pixels[i].x, rotated[i].x, DELTA);
            assertEquals(spiral.pixels[i].y, rotated[i].y, DELTA);
        }
    }

    @Test
    @DisplayName("rotate()を呼んでも元のpixelsが変化しない")
    void rotateDoesNotMutateOriginalPixels() {
        Spiral spiral = new Spiral(CX, CY, 20f, 3, Spiral.Type.ARCHIMEDEAN);
        float[] originalX = new float[spiral.pixels.length];
        float[] originalY = new float[spiral.pixels.length];
        for (int i = 0; i < spiral.pixels.length; i++) {
            originalX[i] = spiral.pixels[i].x;
            originalY[i] = spiral.pixels[i].y;
        }

        spiral.rotate((float) (Math.PI / 4));

        for (int i = 0; i < spiral.pixels.length; i++) {
            assertEquals(originalX[i], spiral.pixels[i].x, DELTA);
            assertEquals(originalY[i], spiral.pixels[i].y, DELTA);
        }
    }
}
