class Cloth {
  float len = 20;
  Particle[][] particles;
  int rows = int(width/len);
  int cols = int(height/len) - 3;
  
  Cloth() {
    particles = new Particle[rows][cols];
    
    for(int x = 0; x < rows; x++) {
      for(int y = 0; y < cols; y++) { 
          particles[x][y] = new Particle(x * len, y * len, false);
      }
    }
    
    particles[0][0] = new Particle(0, 0, true);
    particles[rows-1][0] = new Particle(width, 0, true);
    //particles[round(rows/2 - 1)][0] = new Particle(width/2, 0, true);
    
    for(int i = 0; i < rows - 1; i++) {
      for(int j = 0; j < cols; j++) {
        DistanceJointDef djd = new DistanceJointDef();
        
        djd.bodyA = particles[i][j].body;
        djd.bodyB = particles[i + 1][j].body;
        djd.length = box2d.scalarPixelsToWorld(len);
        djd.frequencyHz = 4.0;
        djd.dampingRatio = 0.6;
        DistanceJoint dj = (DistanceJoint) box2d.world.createJoint(djd);
      }
    }
     for(int y = 0; y < cols - 1; y++) {
      for(int x = 0; x < rows; x++) {
        DistanceJointDef djd = new DistanceJointDef();
        
        djd.bodyA = particles[x][y].body;
        djd.bodyB = particles[x][y + 1].body;
        djd.length = box2d.scalarPixelsToWorld(len);
        djd.frequencyHz = 4.0;
        djd.dampingRatio = 0.60;
        DistanceJoint dj = (DistanceJoint) box2d.world.createJoint(djd);
      }
    }     
  }
  
  void display() {
     for(int x = 0; x < rows - 1; x++) {
      for(int y = 0; y < cols; y++) {
        Vec2 pos1 = box2d.getBodyPixelCoord(particles[x][y].body);
        Vec2 pos2 = box2d.getBodyPixelCoord(particles[x + 1][y].body); 
        
        stroke(0);
        line(pos1.x, pos1.y, pos2.x, pos2.y);
        particles[x][y].display();
        particles[x + 1][y].display();
      }
    }
    for(int y = 0; y < cols - 1; y++) {
      for(int x = 0; x < rows; x++) {
        Vec2 pos1 = box2d.getBodyPixelCoord(particles[x][y].body);
        Vec2 pos2 = box2d.getBodyPixelCoord(particles[x][y + 1].body); 
        
        stroke(0);
        line(pos1.x, pos1.y, pos2.x, pos2.y);
        particles[x][y].display();
        particles[x][y + 1].display();
      }
    }
  }   
}
