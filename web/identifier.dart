class Identifier{
  static int nextInt = 0;
  static var nextName;
  int presentAt;
  var oldName, newName;
  static var firstAvail = "ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ_";
  static var remainAvail = firstAvail + "0123456789";
  
  Identifier(var name){
    this.oldName = name;
    this.newName = getNextName();
  }
 
  
  static getNextName(){
    if(nextInt < firstAvail.length)
      return firstAvail.substring(nextInt, ++nextInt);
    return "ERRORRRRRRRRR";
  }
  
   getOldName(){return this.oldName;}
  
  getNewName(){
    return this.newName;
  }
}