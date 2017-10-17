PImage fondo;

import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;

ArrayList<Boundary> boundaries;
ArrayList<Particle> particles;

Windmill windmill;

void setup() {
  size(400,400);
  fondo = loadImage("fondo.jpg");
 
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -20);
  
  windmill = new Windmill(200,200);
  
  boundaries = new ArrayList<Boundary>();
  particles = new ArrayList<Particle>();
  
  for(int i =0; i<8; i++){
    float sz = 13;
    particles.add(new Particle(random(30,50), random(20,150), sz));
    particles.add(new Particle(random(340,370), random(20,150), sz));
  }

  //Boundaries de contorno
  boundaries.add(new Boundary(width/2,height-25,width,50));
  boundaries.add(new Boundary(width/2,2.5,width,5));
  boundaries.add(new Boundary(2.5,height/2,5,height));
  boundaries.add(new Boundary(width-2.5,height/2,5,height));
  //Boundaries centrales
  boundaries.add(new Boundary(width/2,270,30,2));  
  boundaries.add(new Boundary((width/2)-15,240,2,60));  
  boundaries.add(new Boundary((width/2)+15,240,2,60)); 
  boundaries.add(new Boundary((width/2)-30,210,30,2));  
  boundaries.add(new Boundary((width/2)+30,210,30,2));
  boundaries.add(new Boundary((width/2)-45,205,2,10));  
  boundaries.add(new Boundary((width/2)+45,205,2,10));
  boundaries.add(new Boundary((width/2)-60,200,30,2));  
  boundaries.add(new Boundary((width/2)+60,200,30,2));
  boundaries.add(new Boundary((width/2)-75,195,2,10));  
  boundaries.add(new Boundary((width/2)+75,195,2,10));
  boundaries.add(new Boundary((width/2)-90,190,30,2));  
  boundaries.add(new Boundary((width/2)+90,190,30,2));
  boundaries.add(new Boundary((width/2)-105,160,2,60));  
  boundaries.add(new Boundary((width/2)+105,160,2,60));
}

void draw() {
  background(255);
  image(fondo,0,0);
  box2d.step();
 windmill.display();
 for (int i = particles.size()-1; i >= 0; i--) {
 Particle p = particles.get(i);
 p.display();
 }
 
 for (Boundary wall: boundaries) {
    wall.display();
  }
  
 fill(200,200,0);
 text("Haz click en la pantalla y presiona tecla 'U' y 'D' para mover las esferas", 10, 370);
 text("y lograr acomodar 3 en el tubo central para ganar", 70, 390);
}

void keyPressed(){
  if (key=='u'||key=='U'){
        box2d.setGravity(0, 20);
      }
      
   if(key=='d'||key=='D'){
        box2d.setGravity(0, -20);
      }
  
}