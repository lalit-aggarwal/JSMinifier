import "patterns.dart";
import "identifier.dart";
import "identifiertable.dart";

class Lexer{
  String buffer;
  static int offset;
  static final int bufferSize = 200;
  IdentifierTable it = new IdentifierTable();
  Lexer(var input){
    buffer = input;
    offset = 0;
  }
  
  fillbuffer(){
    buffer = buffer.trim() + "\n";
    buffer = buffer.substring(offset);
    offset = 0;
  }
  
  bool isEOF(){
    return buffer.length <= offset;
  }
  
  String nextToken(){
    var matches, token;
    fillbuffer();
    
    matches = Patterns.COMMENT.matchAsPrefix(this.buffer);
    if(matches != null){
      token =  matches;
      String mcomment = token.group(1),
          scomment = token.group(0);
      if(mcomment != null){
        offset += mcomment.length;
        return "";
      }
      else if(scomment != null){
        offset += scomment.length;
        return "";
      }
    }
    
    matches = Patterns.PUNCTUATORS.matchAsPrefix(this.buffer);
    if(matches != null){
      token =  matches;
      offset += token.group(1).length;
      return token.group(1);
    }
    
    matches = Patterns.KEYWORD.matchAsPrefix(this.buffer);
    if(matches != null){
      token =  matches;
      token = token.group(1);
      offset += token.length;
      return token + " ";
    }
    
    matches = Patterns.NUMERIC_LITERAL.matchAsPrefix(this.buffer);
    if(matches != null){
      token =  matches;
      offset += token.group(1).length;
      return token.group(1);
    }
    
    matches = Patterns.FLOATINGPOINT_LITERAL.matchAsPrefix(this.buffer);
    if(matches != null){
      token =  matches;
      offset += token.group(1).length;
      return token.group(1);
    }
    
    matches = Patterns.BOOLEAN_LITERAL.matchAsPrefix(this.buffer);
    if(matches != null){
      token =  matches;
      offset += token.group(1).length;
      return token.group(1);
    }
    
    matches = Patterns.STRING_LITERAL.matchAsPrefix(this.buffer);
    if(matches != null){
      token =  matches;
      offset += token.group(1).length;
      return token.group(1);
    }
    
    matches = Patterns.IDENTIFIER_NAME.matchAsPrefix(this.buffer);
      if(matches != null){
        token =  matches;
      offset += token.group(1).length;
      token = token.group(1);
      var tokenI = it.getIdentifier(token);
      if(tokenI == null){
        tokenI = new Identifier(token);
        it.addIdentifier(tokenI);
      }
      
      return tokenI.getNewName();
    }
    
    offset = buffer.length;
    return "";
  }
}