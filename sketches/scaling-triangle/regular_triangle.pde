/*
 * 正三角形を描画するためのクラス
 **/
class RegularTriangle implements Shape {
  final int VERTICES = 3;
  Coord[] coords;
  float cx, cy;

  RegularTriangle(float cx, float cy, float r) {
    this.cx = cx;
    this.cy = cy;
    coords = new Coord[VERTICES];

    for (int i = 0; i < VERTICES; i++) {
      float angle = TWO_PI / VERTICES * i - HALF_PI;
      coords[i] = new Coord(cx + r * cos(angle), cy + r * sin(angle));
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
      coords[i] = new Coord(cx + n * (coords[i].x - cx), cy + n * (coords[i].y - cy));
    }
  }

  void rotate(float rad) {
    for (int i = 0; i < VERTICES; i++) {
      float dx = coords[i].x - cx;
      float dy = coords[i].y - cy;
      float rx = cx + dx * cos(rad) - dy * sin(rad);
      float ry = cy + dx * sin(rad) + dy * cos(rad);
      coords[i] = new Coord(rx, ry);
    }
  }
}

