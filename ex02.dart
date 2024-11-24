void main(){
  Object object = 'hello';

  if(object is String){
    print('la String');
  
  }

  if(object is! int){
    print('ko phai la int');
  }

  String string = object as String;
  print(string.toUpperCase());
}
