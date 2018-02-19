class HiddenNode extends Node{
  double bias;
  
   HiddenNode(double val){
    super();
    this.val = val;
    this.weight = getRandomWeight();
    this.bias = getRandomWeight();
  }
  
  HiddenNode(double val, double weight, double bias){
    super();
    this.val = val;
    this.weight = weight;
    this.bias = bias;
  }
  
  double getWeight(){
    return this.weight;
  }
  
  double getBias(){
    return this.bias;
  }
  
  double getVal(){
    return this.val;
  }
}