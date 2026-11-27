package org.example;

/** 螺旋のデータ構造を表すクラス 描画はProcessing側のレンダラーに委ねる */
public class Spiral {
  private static final int DEGREE = 360;

  public enum Type {
    ARCHIMEDEAN,
    LOGARITHMIC
  }

  @FunctionalInterface
  private interface Formula {
    Coord compute(float theta, float a, float b);
  }

  private final float cx, cy, a, b;
  private final int revs, totalSteps;
  private final Formula formula;
  public final Pixel[] pixels;

  // アルキメデスの螺旋
  public Spiral(float cx, float cy, float b, int revs, Type type) {
    this(cx, cy, 0, b, revs, type);
  }

  // 対数螺旋
  public Spiral(float cx, float cy, float a, float b, int revs, Type type) {
    this.cx = cx;
    this.cy = cy;
    this.a = a;
    this.b = b;
    this.revs = revs;
    this.totalSteps = DEGREE * revs;
    this.formula = resolveFormula(type);
    this.pixels = plot();
  }

  private static Formula resolveFormula(Type type) {
    switch (type) {
      case ARCHIMEDEAN:
        return (theta, a, b) ->
            new Coord(b * theta * (float) Math.cos(theta), b * theta * (float) Math.sin(theta));
      case LOGARITHMIC:
        return (theta, a, b) -> {
          float r = a * (float) Math.exp(b * theta);
          return new Coord(r * (float) Math.cos(theta), r * (float) Math.sin(theta));
        };
      default:
        throw new IllegalArgumentException("Unknown type: " + type);
    }
  }

  /** 回転後のピクセル配列を返す */
  public Pixel[] rotate(float rad) {
    Pixel[] rotated = new Pixel[totalSteps];
    for (int i = 0; i < totalSteps; i++) {
      float dx = pixels[i].x - cx;
      float dy = pixels[i].y - cy;
      float rx = cx + dx * (float) Math.cos(rad) - dy * (float) Math.sin(rad);
      float ry = cy + dx * (float) Math.sin(rad) + dy * (float) Math.cos(rad);
      rotated[i] = new Pixel(rx, ry);
    }
    return rotated;
  }

  private Pixel[] plot() {
    Coord[] coords = new Coord[totalSteps];
    for (int i = 0; i < totalSteps; i++) {
      float theta = (float) Math.toRadians(i);
      coords[i] = formula.compute(theta, a, b);
    }

    Pixel[] px = new Pixel[totalSteps];
    for (int i = 0; i < totalSteps; i++) {
      px[i] = toPixel(coords[i]);
    }
    return px;
  }

  private Pixel toPixel(Coord c) {
    return new Pixel(map(c.x, -b, b, cx - b, cx + b), map(c.y, -b, b, cy + b, cy - b));
  }

  private static float map(float value, float inMin, float inMax, float outMin, float outMax) {
    return outMin + (value - inMin) * (outMax - outMin) / (inMax - inMin);
  }
}
