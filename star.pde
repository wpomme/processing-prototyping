/*
 * 星型を描画するためのクラス
 **/
class Star implements Shape {
  final int VERTICES = 10;
  Coordinate[] coords;
  float cx, cy;

  Star(float cx, float cy, float r, float R) {
    this.cx = cx;
    this.cy = cy;
    coords = new Coordinate[VERTICES];

    for (int i = 0; i < VERTICES; i++) {
      float angle = TWO_PI / VERTICES * i - HALF_PI;
      if ((i % 2) == 0) {
        coords[i] = new Coordinate(cx + R * cos(angle), cy + R * sin(angle));
      } else {
        coords[i] = new Coordinate(cx + r * cos(angle), cy + r * sin(angle));
      }
    }
  }

  void draw() {
    beginShape();
    for (int i = 0; i < VERTICES; i++) {
      vertex(coords[i].x, coords[i].y);
    }
    endShape(CLOSE);
  }

  void scale(float n) {
    for (int i = 0; i < VERTICES; i++) {
      coords[i] = new Coordinate(cx + n * (coords[i].x - cx), cy + n * (coords[i].y - cy));
    }
  }

  void rotate(float rad) {
    for (int i = 0; i < VERTICES; i++) {
      float dx = coords[i].x - cx;
      float dy = coords[i].y - cy;
      float rx = cx + dx * cos(rad) - dy * sin(rad);
      float ry = cy + dx * sin(rad) + dy * cos(rad);
      coords[i] = new Coordinate(rx, ry);
    }
  }
}
