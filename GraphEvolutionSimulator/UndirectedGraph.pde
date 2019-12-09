/**
 * Simmple graph layout system
 * http://processingjs.nihongoresources.com/graphs
 * This code is in the public domain
 */

// this class models a directed graph, consisting of any number of nodes
class UndirectedGraph
{
  ArrayList<Node> nodes = new ArrayList<Node>();

  void addNode(Node node) {
    if(!nodes.contains(node)) {
      nodes.add(node); 
    }
  }

  int size() { return nodes.size(); }

  boolean linkNodes(Node n1, Node n2) {
    if(nodes.contains(n1) && nodes.contains(n2)) {
      n1.addLink(n2);
      n2.addLink(n1);
      return true; 
    }
    return false; 
  }

  Node getNode(int index) {
    return nodes.get(index); 
  }

  ArrayList<Node> getNodes() {
    return nodes; 
  }

  //ArrayList<Node> getRoots() {
  //  ArrayList<Node> roots = new ArrayList<Node>();
  //  for(Node n: nodes) {
  //    if(n.getIncomingLinksCount()==0) {
  //      roots.add(n); }}
  //  return roots; }

  //ArrayList<Node> getLeaves() {
  //  ArrayList<Node> leaves = new ArrayList<Node>();
  //  for(Node n: nodes) {
  //    if(n.getOutgoingLinksCount()==0) {
  //      leaves.add(n); }}
  //  return leaves; }

  // this does nothing other than tell nodes to draw themselves.
  void draw() {
    translate(width/2, height/2);
    for(Node n: nodes) {
      n.draw(); 
    }
  }
}
