import "identifier.dart";

class IdentifierTable {
  Map<String, Identifier> hm = null;
  
  IdentifierTable(){
    hm = new Map<String, Identifier>();
  }
  
  addIdentifier(Identifier i){
    hm.putIfAbsent(i.getNewName(), () =>  i);
    hm.putIfAbsent(i.getOldName(), () => i);
  }
  
  Identifier getIdentifier(String name){
    return hm[name];
  }
}