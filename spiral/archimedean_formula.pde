/**
 * アルキメデスの螺旋を表す計算式を実装するクラス
 */
class ArchimedeanFormula implements SpiralFormula {
  Coord compute(float theta, float a, float b) {
    return new Coord(b * theta * cos(theta), b * theta * sin(theta));
  }
}
