package org.example;

/**
 * 対数螺旋の計算式
 */
class LogarithmicFormula implements SpiralFormula {
    @Override
    public Coord compute(float theta, float a, float b) {
        float r = a * (float) Math.exp(b * theta);
        return new Coord(
            r * (float) Math.cos(theta),
            r * (float) Math.sin(theta)
        );
    }
}
