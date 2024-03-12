// void main(){
//   var sum=0;
//   var a=1;
//   do{
//     sum=sum+a;
//     print("$sum");
//   a++;
//   }
//   while(a<=100);
// }




// void main(){
//   var sum=0;
//   var a=2;
//   var b=1;
//   do{
//     var t=a*b;
//     sum=sum+t;
//     b++;
//   }
//   while(b<=10);
//   print("$sum");
// }

// void main(){
//   int a=1;
//   do {
//     int b = 2;
//     do {
//       int x = a * b;
//       a++;
//       print("$x");
//     }
//     while (2 <= 20);
//     print(" ");
//   }while (1 <= 10);
//     a++;
//   }



// void main() {
//    var evensum = 0;
//   var oddsum = 0;
//   var a = 1;
//   while (a <= 100);
//   if (a % 2 == 0) {
//     evensum = evensum + a;
//   }
//   else {
//     oddsum = oddsum + a;
//     a++;
//   }
//   print("evensum");
//   print("oddsum");
// }

// void main() {
//   int n = 50; // Adjust the range as needed
//
//   int i = 2;
//   do {
//     int j = 2;
//     int count = 0;
//
//     do {
//       if (i % j == 0) {
//         count++;
//       }
//       j++;
//     } while (j <= i);
//
//     if (count == 1) {
//       print("$i is a prime number");
//     }
//     else{
//       print("$i is a not  prime number");
//     }
//
//     i++;
//   } while (i <= n);
// }

// void main(){
//   var x=90;
//   var y=70;
//   var z=203;
//   var maxnumber=x;
//   if(y>maxnumber){
//     maxnumber=y;
//   }
// if(z>maxnumber){
//   maxnumber=z;
// }
// print('$maxnumber');
//
// }

// void main(){
//   var x=90;
//   var y=70;
//   var z=203;
//   var minimumnumber=x;
//   if(y<minimumnumber){
//     minimumnumber=y;
//   }
//   if(z<minimumnumber){
//     minimumnumber=z;
//   }
// print('$minimumnumber');
// }

// void main() {
//   List<int>numbers=[90,70,203];
//   int maxNum=numbers[0];
//   for(int num in numbers){
//     if(num>maxNum){
//       maxNum=num;
//     }
//   }
// print('$maxNum');
//
// }

// void main(){
//   List numbers=[90,70,203];
//   int minNum=numbers[0];
//   for(int num in numbers){
//     if(num<minNum){
//       minNum=num;
//     }
//   }
// print('$minNum');
//
// }

// void main(){
//   var num=57;
//   var check=0;
//   for(int i=2;i<=num/2;i++){
//     if(num%i==0){
//       check++;
//     }
//   }
// if(check>=1){
//   print("$num is not prime");
// }
// else{
//   print("$num is prime");
// }
// }

// void main(){
//   int num=57;
//   bool  isPrime=true;
//   int i=2;
//   while(i<=num~/2){
//     if(num%i==0){
//       isPrime=false;
//       break;
//     }
//   i++;
//   }
// if(isPrime){
//   print('$num is prime');
// }
// else{
//   print('$num is not prime');
// }
// }

// void main(){
//   int num=57;
//   bool isPrime=true;
//   int i=2;
//   do{
//     if(num%i==0){
//       isPrime=false;
//       break;
//     }
//   i++;
//   }
//   while(i<=num%2);
//   if(isPrime){
//     print("$num is prime");
//   }
// else{
//   print("$num is not prime");
//   }
// }

// void main(){
//   List<int>numbers=[82,16,61,3,0,4];
//   for(int i=0;i<numbers.length-1;i++){
//     for(int j=i+1;j<numbers.length;j++){
//       if(numbers[i]>numbers[j]){
//         int data=numbers[i];
//         numbers[i]=numbers[j];
//         numbers[j]=data;
//       }
//     }
//   }
// print('Ascendingorder:$numbers');
// }

// void main(){
//   List<int>numbers=[82,16,61,3,0,4];
//   numbers.sort();
//   print("$numbers");
// }
import 'dart:io';

// void main(){
//   var a=1;
//   do{
//     print(" ");
//     var b=5;
//     do{
//       var c=a*b;
//       stdout.write(c);
//       b++;
//       stdout.write(" ");
//     }
//     while(b<=40);
//     print(" ");
//     a++;
//   }
// while(a<=10);
// }

// void main() {
//   var a = 1;
//   while (a <= 10) {
//     print(" ");
//     var b = 5;
//     while (b <= 40) {
//       var c = a * b;
//       stdout.write(c);
//       b++;
//       stdout.write(" ");
//     }
//     print(" ");
//     a++;
//   }
// }


// void main() {
//   for (var a = 1; a <= 10; a++) {
//     for (var space = 1; space <= 2; space++) {
//       print(" ");
//     }
//
//     for (var b = 5; b <= 40; b++) {
//       var c = a * b;
//       stdout.write(c);
//       stdout.write(" ");
//     }
//
//     print(" ");
//   }
// }

// type of function
//Q7.(i) without argument and without return type
// void number(){
//   int x=10;
//   int y=5;
//   int sum=x+y;
//   print('$sum');
//   // sub
//   int sub=x-y;
//   print('$sub');
//   // mul
//   int mul=x*y;
//   print('mul');
//   //divid
//   int divid=x%y;
//   print('$divid');
// }
// void main(){
//   number();
// }

//Q(ii) with argument and no return type
// void numbers(x1,x2){
//   int sum=x1+x2;
//   int sub=x1-x2;
//   int mul=x1*x2;
//   int divid=x1%x2;
// print('$sum');
// }
// void main(){
//   numbers(5,2);
// }

//Q(iii) no argument and no return type

// void numbers(){
//   int x1=10;
//   int x2=2;
//   var sum=x1+x2;
//   var sub=x1-x2;
//   var mul=x1*x2;
//   var divid=x1%x2;
// print('$sum');
// }
// void main(){
//   numbers();
// }

//Q(iv)with argument and with return type

// // default constructor
//
// class Students{
//   Students();
//   writeName(){
//     print("Sonu is buzurg");
//   }
// }
//
// // Named Constructor
//
// class Human{
//   Human.admi();
//
//   writeHuman(){
//     print("this is Arun");
//   }
// }
//
// // parameterized constructor
//
// class Car{
//   Car(this.name);
//   String? name;
//
//   writeName(){
//     print(name);
//   }
// }
//
// void main(){
//   var std = Students();
//   std.writeName();
//   var hum = Human.admi();
//   hum.writeHuman();
//   var car = Car("Gola");
//   car.writeName();
// }
//

// void main(){
//   var number=[20,30,40,50,100,200];
//   var maxnumber=number[0];
//   for(int i=0;i<number.length;i++){
//     if(number[i]>maxnumber){
//       maxnumber=number[i];
//     }
//   }
// print(maxnumber);
//
// }


