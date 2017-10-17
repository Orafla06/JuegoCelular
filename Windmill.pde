class Windmill {

  RevoluteJoint joint;
  Box box1;
  Box box2;
  
  Windmill(float x, float y) {
    box1 = new Box(x, y-90, 150, 10, false);
    box2 = new Box(x, y-90, 1, 4, true); 
    
    RevoluteJointDef rjd = new RevoluteJointDef();
    Vec2 offset = box2d.vectorPixelsToWorld(new Vec2(0, 60));
    
   rjd.initialize(box1.body,box2.body, box1.body.getWorldCenter());
    
    rjd.motorSpeed = PI*2;       // how fast?
    rjd.maxMotorTorque = 1000.0; // how powerful?
    rjd.enableMotor = true;      // is it on?
    
    joint = (RevoluteJoint) box2d.world.createJoint(rjd);
  } 
  
   void toggleMotor() {
    joint.enableMotor(!joint.isMotorEnabled());
  }

  boolean motorOn() {
    return joint.isMotorEnabled();
  }
 
   void display() {
    box1.display();
    box2.display();

    // Draw anchor just for debug
    Vec2 anchor = box2d.coordWorldToPixels(box1.body.getWorldCenter());
    fill(0,100,100);
    noStroke();
    ellipse(anchor.x, anchor.y, 6, 6);
  }
}