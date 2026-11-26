package org.example;

/**
 * アルキメデスの螺旋の計算式
 */
class ArchimedeanFormula implements SpiralFormula {
    @Override
    public Coord compute(float theta, float a, float b) {
        return new Coord(
            b * theta * (float) Math.cos(theta),
            b * theta * (float) Math.sin(theta)
        );
    }
}
