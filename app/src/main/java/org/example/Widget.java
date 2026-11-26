package org.example;

import javax.swing.JFrame;
import java.awt.GraphicsEnvironment;
import java.awt.Rectangle;

public class Widget {
    private static final int HEIGHT = 1350;
    private static final int WIDTH = 1350;

    Widget() {
      var f = new JFrame("テスト");
      f.setVisible(true);

      f.setSize(HEIGHT, WIDTH);
      setLocation(f);
      return;
    }

    /**
     * 前提条件: monitorSize > WIDTH, HEIGHTとする
     */
    private void setLocation(JFrame f) {
      Rectangle bounds = GraphicsEnvironment.getLocalGraphicsEnvironment().getMaximumWindowBounds();
      int monitorHeight = bounds.height;
      int monitorWidth = bounds.width;

      int moveHeight = 0;
      int moveWidth = 0;

      moveHeight = toCenter(HEIGHT, monitorHeight);
      moveWidth = toCenter(WIDTH, monitorWidth);

      f.setLocation(moveHeight, moveWidth);
    }

    private int toCenter(int widgetSize, int monitorSize) {
      return (widgetSize - monitorSize) / 2;
    }
}

