class Coordinate {
  float x, y;
  Coordinate(float x, float y) {
    this.x = x;
    this.y = y;
  }
}

/*
 * 星型を描画するためのクラス
 **/
class Star {
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
    for (int i = 0; i < coords.length; i++) {
      vertex(coords[i].x, coords[i].y);
    }
    endShape(CLOSE);
  }

  void scale(float n) {
    for (int i = 0; i < coords.length; i++) {
      coords[i] = new Coordinate(cx + n * (coords[i].x - cx), cy + n * (coords[i].y - cy));
    }
  }

  void rotate(float rad) {
    for (int i = 0; i < coords.length; i++) {
      float dx = coords[i].x - cx;
      float dy = coords[i].y - cy;
      float rx = cx + dx * cos(rad) - dy * sin(rad);
      float ry = cy + dx * sin(rad) + dy * cos(rad);
      coords[i] = new Coordinate(rx, ry);
    }
  }
}

void setup() {
  size(1350, 1080);

  background(255);
  // 三角形の重心x, y
  float cx = width / 2;
  float cy = height / 2;

  Star star = new Star(cx, cy, 50, 100);
  star.draw();
  star.rotate(HALF_PI);
  star.draw();
}
