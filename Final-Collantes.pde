///Project 5
///By: Ana Collantes

String author="Final - Ana Collantes";
String randomly="Press 'r' to reset/ move randomly";
String tallest="Press 't' to move tallest to the end";
String fattest="Press 'f' to move fattest to the end";
String bird="Press 'b' to move bird to the last person";
String raise="Press 'a' to move the person with the biggest $ to the end "; /// text for raise

int many=8;
Person[] human=new Person[many];
int x=750;
int y=550;
float sidewalk=461;
float l; ///where letters are going to be at
int last;

float birdX, birdY;
int wing1=7;
int wing2;
int flap=25;
//float cloudX;
//float cloudY=random(5,500 );
Clouds cloud= new Clouds();
String [] names={"Joe", "James", "Jay", "Jimmy", "Kevin", "Joey", "Ted", "Kai"};
String [] statures={ "8'9in", "8'2in", "11'0in", "10'5in", "4'7in", "9'2in", "10'9in", "9'8in"}; ///height of humans
String [] rgbs={"random#", "random#", "random#", "random#", "random#", "random#", "random#", "random#"};
String [] pounds={"100lbs", "160lbs", "175lbs", "195lbs", "200lbs", "205lbs", "123lbs", "188lbs"};
float [] tall={  90, 70, 150, 130, 50, 100, 145, 110};
float [] weight={20, 35, 49, 50, 55, 60, 29, 42};

String [] ages={"10","18","25","36","47","50","82","99"};
float [] ag={10,18,25,36,47,50,82,99};
String [] salaries= {"$1000", "$5000", "$85976",  "$8066", "$54000", "$90078","$95000", "$100000"};
float [] sals={ 1000, 5000, 85976,  8066, 54000, 90078,95000, 100000};

int alot=11; /// instead of many used alot
Gente[] ge= new Gente[alot];  ////new class for gente(means people in spanish)

float moonX;  /// x coordinate of the moon
float moonY;  /// y coordinate of the moon


void setup() {
  size(x, y);
  reset();
  
}
void reset() {
  l=height/1.3;
  //--for ( int p=0; p<=7; p=p+1) {
     for ( int e=0; e<alot; e=e+1) { /// new array for people -- e for people
  ge[e]= new Gente(e*66); ////e*66 means the space between the rectangles
  }
  
  for ( int p=0; p<many; p=p+1) {
    human[p]= new Person(p*79);
    human[p].name=names[p];
    human[p].stature=statures[p];
    human[p].rgb=rgbs[p];
    human[p].pound=pounds[p];
    human[p].big=tall[p];
    human[p].w=weight[p];
    
    human[p].age=ages[p];  /// put on the screen the different ages
   human[p].edad=ag[p];  /// ages for random
   human[p].salary=salaries[p];  /// puts salaries on screen
   human[p].sal=sals[p];  //// salaries=sal/sals for random
   
  }
  last=  many-1;
  
 /* for ( int e=0; e<alot; e=e+1) {
  ge[e]= new Gente(e*66);
  }*/
  
}

void moon() {
   //Moon
     noStroke();
     fill(165,170,165);
     stroke(0);
     ellipse(moonX,moonY,70,70); ///moon
     fill(227);
     ellipse(moonX+5,moonY-5,10,10); // inside circles of the moon
     ellipse(moonX-9,moonY+7,5,5);  //// inside circles of the moon
     ellipse(moonX+13,moonY+12,15,15);  // inside circles of the moon 
     ellipse(moonX-13,moonY-12,7,7);  // inside circles of the moon

     
      if (moonX>width) {  ///moon moves from left to right
       moonX=0;
    }
    
     moonX=moonX+1;
     moonY=40;  //// y of the moon

}

void messages() {
  fill(255);
  textSize(16);
  text(author,585,15);
  text(randomly, 10,15);
  text(tallest,10,30);
  text(fattest,10,45);
  text(bird,10,60);
  text(raise,10,75); /// text for raise on screen
}


void draw() {
  background(39,66,100); /// new background for new array 
  fill(230, 201, 255);
  rect(0, l, x, y);

  moon();
  messages();
  bird();
  cloud.drawCloud();
 // clouds();
  ///this creates the numbers written on the left side of the screen
  //for ( int c=0; c<=4; c=c+1) { 
    //text( c, 10, 10+c*12 );
  //} 
   for ( int e=0; e<alot; e=e+1) { /// array for gente(new class of people)
    ge[e].drawGent(); /// to draw on screen 
   }


  
  for ( int p=0; p<many; p=p+1) {
    human[p].drawhuman();
    //human[p].raise();
  }
  
 /* for ( int e=0; e<alot; e=e+1) {
    ge[e].drawGent();
   }*/
}

void bird() {
  fill(92, 185, 174);
  ellipse(birdX, birdY, 30, 20); // body
  triangle(birdX-wing1, birdY, birdX+wing1, birdY, birdX+wing2, birdY+flap); //// wing
  ellipse(birdX+16, birdY, 10, 10); // head


  birdX +=  (human[last].personX - birdX) / 90;
  float top=  (sidewalk - human[last].big);
  birdY +=  (top -birdY) / 90;
  //--  text( birdX, 10,10 );
  //--  text( birdY, 10,20 );

  if (birdY>0) { 
    flap=-25;
  } 
  if (birdY<200) { 
    flap=25;
  }
}

//void clouds() {
 // fill(255, 255, 255, 191);
 // ellipse(cloudX, cloudY, 50, 20);

//  cloudX=cloudX+3;
//}


void keyPressed() {
  if (key == 'r') reset();
  if (key == 't') tall();
  if (key == 'b') birdX=birdY=0;
  if(key=='f') fattest();
  if(key=='a') raise();  /// moves the biggest amount of money to the end
}

void fattest() {
 
  //// Move fattest to end.
  //// Find index "k" of tallest; change personX to PersonX of last.
  int k=0;
  for (int j=1; j<many; j++) {
    if(human[j].w > human[k].w) k=j;
  }
  swap( human, k, last );
  //// 
  //
  last=  k;
}
  
void tall() {
  //// Move tallest to end.
  //// Find index "k" of tallest; change personX to PersonX of last.
  int k=0;
  for (int j=1; j<many; j++) {
    if(human[j].big > human[k].big) k=j;
  }
  swap( human, k, last );
  //// 
  //
  last=  k;
}
void swap( Person human[], int k, int last ) {
  float save;
  save=human[k].personX;
  human[k].personX=  human[last].personX;      // Move k-th to end.
  human[last].personX=  save;                   // Move last to old X of tallest.
}

void raise() {
 
  //// Move biggest $ to end.
  //// Find index "k" of biggest $; change personX to PersonX of last.
  int k=0;
  for (int j=1; j<many; j++) {     
    if(human[j].sal > human[k].sal) k=j;   /// for the salaries for the biggest $ to move at the end
    
  }
  swap( human, k, last );
  //// 
  //
  last=  k;
  
  
}


class Gente  { ///  new class of people
   float genX;
   float grande;
   float widt;
   
   
   Gente(float alto) { /// height =  alto
   genX=alto+random(20,40);
   grande=random(70,150); /// grande = tall-big
   widt=random(10,60); /// the width of the rectangles or of the new people
   
   }
   
   void drawGent() { 
     fill(0);
     rect(genX,sidewalk-55, widt, -grande); /// the position and the size of where the new Gente are at
     
     fill(255,0,0);
     triangle(genX+1,sidewalk-grande-25, genX+1,sidewalk-grande-10, genX+10,sidewalk-grande-10); /// left eye of the new Gente
     triangle(genX+30,sidewalk-grande-25, genX+30,sidewalk-grande-10, genX+20,sidewalk-grande-10);  /// right eye of the new Gente
   }
}





//// OBJECTS ////
class Person {
  float personX;
  float big;
  float w;
  float r;
  float b;
  float g;
  String name;
  String stature;
  String rgb;
  String pound;
  
  
  String age; /// NEW AGE
  float edad; //// age 
  String salary; /// salary
  float sal;
  
  
  
  // CONSTRUCTOR //
  Person(float h) {
    personX=h+random(20, 40);
    big=  random(50, 150);
    w=  random(20, 60);
    r=  random(0, 255);
    b=  random(0, 255);
    g=  random(0, 255);
    edad = random(1,99);
    sal = random(1000,100000);
    name="";
    stature="";
    rgb="";
    pound="";
    age="";
    salary="";
  }
  void drawhuman() {
    fill(r, g, b);
    rect(personX, sidewalk, w, -big);
    ellipse(personX+w/2, sidewalk-big-15, 15, 25);
    
    textSize(12);
    text(name, personX, 480); ///names of the people
    text(stature,personX, 500);  ///height of the people
    text(rgb,personX,520); /// color of the people
    text(pound,personX, 540);
    
    
    text(age,personX,big+140); /// text for age
    text(salary, personX,big+128); // text for salary
  }
  
 /* void raise() {
    
    sal= sal * (1 +25/100);
  }*/
}
  
 // void bonus() {


class Clouds {
  int cloudX;
  int cloudY;
  
  Clouds() {
  cloudX=(int)random(0,150);
  cloudY=(int)random(1,250);
  }
  
  void drawCloud() {
  fill(255, 255, 255, 191);
  ellipse(cloudX, cloudY, 50, 20);
  ellipse(cloudX-50, cloudY+30, 50, 20);
  ellipse(cloudX-70, cloudY+50, 45, 15);
  ellipse(cloudX-90, cloudY+70, 40, 10);
  ellipse(cloudX-110, cloudY+90, 35, 5);
  ellipse(cloudX-130, cloudY+110, 30, 3);

  cloudX=cloudX+3;
  
  if(cloudX>width) {cloudX=0; cloudY=(int)random(1,250);}
  
  
  }
}

/*class Gente  { /// people
   float genX;
   float grande;
   float widt;
   
   
   Gente(float alto) { /// alto-height
   genX=alto+random(20,40);
   grande=random(50,150); /// tall-big
   widt=random(10,60);
   
   }
   
   void drawGent() {
     fill(0);
     rect(genX,sidewalk-20, widt, -grande);
   }
}*/
   
   
   

