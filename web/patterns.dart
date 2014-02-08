class Patterns{
  static final String patternStart = "[\\s]*";
  static final String patternEnd = "[\\s]+.*";
  static final Pattern 
  PUNCTUATORS = new RegExp(patternStart + "(\\{|\\}|\\(|\\)|\\[|\\]" +
      "|;|,|\\?|:" +
      "|<=?|>=?|={1,3}|!={0,2}" +
      "|\\+\\+?|--?|\\*|/|%" +
      "|&&|[|]{2}).*")
      
  ,KEYWORD=new RegExp(patternStart + "(var|function|if|else|while|break|continue|return|NaN|null|new|delete)"+ "(" + patternEnd + "|" + PUNCTUATORS.pattern + ")")
  
   
  ,COMMENT = new RegExp(patternStart + "(\\/\\*[\\w\\'\\s\\r\\n\\*]*\\*\\/).*|" //multiline
      + patternStart + "(//[^\\n]*).*")
  
  ,IDENTIFIER_NAME = new RegExp(patternStart + "([A-Za-z]+[A-Za-z0-9]*)"+ "(" + patternEnd + "|" + PUNCTUATORS.pattern + ")")
  
  ,NUMERIC_LITERAL= new RegExp(patternStart + "([0-9]+)" + "(" + patternEnd + "|" + PUNCTUATORS.pattern + ")")
  
  ,FLOATINGPOINT_LITERAL= new RegExp(patternStart + "([+-]?\\d*\\.\\d+(?:[eE][+-]?\\d+)?)" + "(" + patternEnd + "|" +PUNCTUATORS.pattern + ")")
  
  ,BOOLEAN_LITERAL= new RegExp(patternStart + "(true|false)" + "(" + patternEnd + "|" + PUNCTUATORS.pattern + ")")
  
  ,STRING_LITERAL= new RegExp(patternStart + "\"([^\\\n\"]*)\"" + "(" + patternEnd + "|" + PUNCTUATORS.pattern + ")");  
}