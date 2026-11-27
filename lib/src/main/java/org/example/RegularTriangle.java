package org.example;

public class RegularTriangle {
  private final int VERTICES = 3;
  private final float TWO_PI = (float) (Math.PI * 2);
  private final float HALF_PI = (float) (Math.PI / 2);
  private final float cx, cy, r;
  public final Pixel[] pixels;

  RegularTriangle(float cx, float cy, float r) {
    this.cx = cx;
    this.cy = cy;
    this.r = r;
    this.pixels = toPixel(new Pixel[VERTICES], r);
  }

  private Pixel[] toPixel(Pixel[] px, float r) {
    for (int i = 0; i < VERTICES; i++) {
      float angle = TWO_PI / VERTICES * i - HALF_PI;
      px[i] = new Pixel(cx + r * (float) Math.cos(angle), cy + r * (float) Math.sin(angle));
    }
    return px;
  }

  /** 拡大縮小した値を返す n = 2なら二倍の値を返す */
  public Pixel[] scale(float n) {
    Pixel[] px = new Pixel[VERTICES];
    for (int i = 0; i < VERTICES; i++) {
      px[i] = new Pixel(cx + n * (pixels[i].x - cx), cy + n * (pixels[i].y - cy));
    }
    return px;
  }

  public Pixel[] rotate(float rad) {
    Pixel[] rotated = new Pixel[VERTICES];
    for (int i = 0; i < VERTICES; i++) {
      float dx = pixels[i].x - cx;
      float dy = pixels[i].y - cy;
      float rx = cx + dx * (float) Math.cos(rad) - dy * (float) Math.sin(rad);
      float ry = cy + dx * (float) Math.sin(rad) + dy * (float) Math.cos(rad);
      rotated[i] = new Pixel(rx, ry);
    }
    return rotated;
  }
}
