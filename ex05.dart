/*
Giai PT: ax^2 +bx +c =0
*/
import 'dart:io';
import 'dart:math';

void main (){
  double a = 0, b=0, c=0;
  //input a
  do {
    stdout.write('nhap he so a (a khac 0):');
    String? input  = stdin.readLineSync();
    if(input!=null){
      a = double.tryParse(input) ?? 0;
    }
    if(a==0){
      print("vui long nhap lai");
    }
  } while (a==0);

  //input b
    stdout.write('nhap he so b :');
    String? inputB  = stdin.readLineSync();
    if(inputB!=null){
      a = double.tryParse(inputB) ?? 0;
    }
     //input c
    stdout.write('nhap he so c :');
    String? inputC  = stdin.readLineSync();
    if(inputC!=null){
      a = double.tryParse(inputC) ?? 0;
    }

    //tinh DETAl
    double delta = b*b - 4*a*c;
    print('delta = $delta');
    // Hien thi PT
    print('PT: ${a}x^2 + ${b}x + c =0 ');
    //Giai PT

    if(delta<0){
      print("PT vo nghiem");
    }else if(delta == 0){
      double x = -b/(2*a);
      x=double.parse(x.toStringAsFixed(2)) ;
      print('phuong trinh co nghiem kep x = $x');
    }else{
      double x1 = (-b + sqrt(delta)) / (2*a);
      double x2 = (-b - sqrt(delta)) / (2*a);
      //lam tron den 2 chu thap phan
      x1=double.parse(x1.toStringAsFixed(2)) ;
      x2=double.parse(x2.toStringAsFixed(2)) ;

      print('PT co 2 nghiem phan biet');
      print('x1 = $x1');
      print('x2 = $x2');


    }
}