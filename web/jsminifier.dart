import "dart:html";
import 'lexer.dart';
import "identifier.dart";

TextAreaElement src = querySelector("#container_id1");
TextAreaElement dest = querySelector("#container_id2");
void main() {
  src.spellcheck = false;
  
 querySelector("#button_id").onClick.listen((_){
   Identifier.nextInt = 0;
    Lexer l = new Lexer(src.value);
    String s = "", t;
    while(l.isEOF() == false){
     t = l.nextToken();
     s +=t;
    }
    dest.value = s.trim();
    
    int srcLength = src.value.length;
    int destLength = dest.value.length;
    
    querySelector("#initial_memory").text = "Initial size : " + srcLength.toString();
    
    querySelector("#final_memory").text = "Final size : " + destLength.toString();
    
    querySelector("#efficiency").text = "Bytes Saved : " + (srcLength - destLength).toString();
  });
}
