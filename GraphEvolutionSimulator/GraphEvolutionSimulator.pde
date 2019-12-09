/**
 * Simmple graph layout system
 * http://processingjs.nihongoresources.com/graphs
 * This code is in the public domain
 */

UndirectedGraph g = null;
int padding = 30;
int clk = 1;
Button rand_button, new_node_button;

void setup()
{
  size(800,800);
  // frameRate(24);
  // noLoop();
  rand_button = new Button("Random Graph", 20, 20, 100, 50);
  new_node_button = new Button("Add node", 140, 20, 100, 50);
}

void draw()
{
  background(0);
  if (rand_button.MouseIsOver()) {
      rand_button.colour = 200;
  } else {
      // hide the square if the mouse cursor is not over the button
      rand_button.colour = 255;
  }
  if (new_node_button.MouseIsOver()) {
     new_node_button.colour = 200;
  } else {
     new_node_button.colour = 255;
  }
  rand_button.Draw();
  new_node_button.Draw();
  if(g != null)
  {
      g.draw();
  }
}

// mouse button clicked
void mousePressed()
{
  if (rand_button.MouseIsOver()) {
    makeGraph();
    redraw();
    print("Random Graph: ");
    println(clk++);
  }
  if (new_node_button.MouseIsOver()) {
    print("New Node: ");
    println(clk++);
  }
}

void makeGraph()
{
  // define a graph
  g = new UndirectedGraph();
  ArrayList<Node> nodes = new ArrayList<Node>();
  
  float r = min(width, height) / 3; //radius of circle
  float circWid = 10; //width of ellipses
  // Calculate number of ellipses round circumference
  int numDots = int(random(10,100));
  // Calculate angle between two ellipses
  float theta = TWO_PI / numDots;
  // Adjust radius so that this number of dots exactly matchs the circumference
  //r = (numDots * circWid)/ TWO_PI;
  pushMatrix();
  translate(width/2, height/2);
  for (float p = 0; p < numDots; p++) {
    float myTheta = p*theta; //calculate current angle
    int x = round(r*cos(myTheta)); //calculate xPos
    int y = round(r*sin(myTheta)); //calculate yPos
    stroke(255);
    fill(255);
    ellipse(x, y, circWid-2, circWid-2); //draw dot
    nodes.add(new Node(str(round(p)), x, y));
  }
  popMatrix();

  // add nodes to graph
  for (Node n: nodes) { 
    g.addNode(n);
  }
  
  float prob_link = 0.05;
  for (Node n: nodes) {
    for (Node m: nodes) {
      if (random(1) < prob_link) {
        g.linkNodes(n, m);
      }
    }
    println(n.getLinksCount());
  }
  
  // link nodes
  //g.linkNodes(n1,n2);
  //g.linkNodes(n2,n3);
  //g.linkNodes(n3,n4);
  //g.linkNodes(n4,n1);
  //g.linkNodes(n1,n3);
  //g.linkNodes(n2,n4);
  //g.linkNodes(n5,n6);
  //g.linkNodes(n1,n6);
  //g.linkNodes(n2,n5);
}
