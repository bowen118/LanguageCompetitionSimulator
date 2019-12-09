/**
 * Simmple graph layout system
 * http://processingjs.nihongoresources.com/graphs
 * This code is in the public domain
 */

// This is a generic node in a graph
class Node
{
  ArrayList<Node> links = new ArrayList<Node>();
  //ArrayList<Node> inlinks = new ArrayList<Node>();
  //ArrayList<Node> outlinks = new ArrayList<Node>();
  String label;

  Node(String _label, int _x, int _y) {
    label=_label; x=_x; y=_y; r1=5; r2=5; }
    
  void addLink(Node n) {
    if (!links.contains(n)) {
      links.add(n);
    }
  }
  
  ArrayList<Node> getLinks() {
    return links;
  }
  
  int getLinksCount() {
    return links.size();
  }

  //void addIncomingLink(Node n) {
  //  if(!inlinks.contains(n)) {
  //    inlinks.add(n);}}

  //ArrayList<Node> getIncomingLinks(){
  //  return inlinks; }

  //int getIncomingLinksCount() {
  //  return inlinks.size(); }

  //void addOutgoingLink(Node n) {
  //  if(!outlinks.contains(n)) {
  //    outlinks.add(n);}}

  //ArrayList<Node> getOutgoingLinks(){
  //  return outlinks; }

  //int getOutgoingLinksCount() {
  //  return outlinks.size(); }

  float getShortestLinkLength() {
    if(links.size() == 0) { return -1; }
    float l = 100;
    for(Node node: links) {
      int dx = node.x-x;
      int dy = node.y-y;
      float il = sqrt(dx*dx + dy*dy);
      if(il<l) { l=il; }
    }
    return l; 
  }

  boolean equals(Node other) {
    if(this == other) return true;
    return label.equals(other.label); 
  }

  // visualisation-specific
  int x=0;
  int y=0;
  int r1=20;
  int r2=20;

  void setPosition(int _x, int _y) {
    x=_x; y=_y; }

  void setRadii(int _r1, int _r2) {
    r1=_r1; r2=_r2; }

  void draw() {
    stroke(173, 216, 230);
    fill(173, 216, 230);
    for(Node o: links) {
      drawLink(x,y,o.x,o.y); 
    }
    stroke(26,87,143);
    fill(26,87,143);
    ellipse(x,y,r1*2,r2*2);
  }

  //int[] arrowhead = {0,-4,0,4,7,0};
  void drawLink(int x, int y, int ox, int oy)
  { 
    line(x,y,ox,oy);
  }
  
  //void drawArrowHead(int ox, int oy, float angle) {
  //  int[] rc1 = rotateCoordinate(arrowhead[0], arrowhead[1], angle);
  //  int[] rc2 = rotateCoordinate(arrowhead[2], arrowhead[3], angle);
  //  int[] rc3 = rotateCoordinate(arrowhead[4], arrowhead[5], angle);
  //  int[] narrow = {ox+ rc1[0], oy+ rc1[1], ox+ rc2[0], oy+ rc2[1], ox+ rc3[0], oy+ rc3[1]};
  //  stroke(0);
  //  fill(255);
  //  triangle(narrow[0], narrow[1], narrow[2], narrow[3], narrow[4], narrow[5]);
  //}
}
