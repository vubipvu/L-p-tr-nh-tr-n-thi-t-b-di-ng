import 'dart:io';

void main() {
  // Nhập số nguyên từ bàn phím
  int n = -1; // Khởi tạo với giá trị âm để đảm bảo vào vòng lặp
  while (n < 0) {
    stdout.write('Nhập một số nguyên dương (n >= 0): ');
    String? input = stdin.readLineSync(); // Đọc đầu vào từ người dùng
    n = int.tryParse(input ?? '') ?? -1; // Chuyển chuỗi nhập vào thành số nguyên
    if (n < 0) {
      print('Vui lòng nhập một số nguyên không âm.');
    }
  }

  print("Các ước số của $n là:");
  // Tìm các ước số của n
  for (int i = 1; i <= n; i++) {
    if (n % i == 0) {
      stdout.write("$i ");
    }
  }
}
