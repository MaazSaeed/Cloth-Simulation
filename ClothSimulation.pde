import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;
Cloth c;

void setup() {
  size(269, 269);
  smooth();
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  c = new Cloth();
}

void draw() {
  background(255);
  box2d.step();
  c.display();
}
