class Node {
  double val;
  double weight;

  Node(double val){
    this.val = val;
    this.weight = getRandomWeight();
  }
  
  Node(double val, double weight){
    this.val = val;
    this.weight = weight;
  }
  
  Node(){
    this.weight = getRandomWeight();
  }
  
    double getWeight(){
    return this.weight;
  }
  
  double getVal(){
    return this.val;
  }
}