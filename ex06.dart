import 'dart:io';

void main() {
  // Nhập số nguyên từ người dùng
  int number = -1; // Khởi tạo với giá trị âm để đảm bảo vào vòng lặp
  while (number < 0) {
    stdout.write('Nhập một số nguyên dương (n >= 0): ');
    String? input = stdin.readLineSync(); // Đọc đầu vào từ người dùng
    number = int.tryParse(input ?? '') ?? -1; // Chuyển chuỗi nhập vào thành số nguyên
    if (number < 0) {
      print('Vui lòng nhập một số nguyên không âm.');
    }
  }

  // Chuyển đổi số nguyên thành số nhị phân
  String binary = '';
  int temp = number; // Tạo biến tạm để không thay đổi giá trị ban đầu của số
  if (temp == 0) {
    binary = '0'; // Nếu số nhập là 0, kết quả là 0
  } else {
    while (temp > 0) {
      binary = (temp % 2).toString() + binary; // Lấy phần dư khi chia 2 và ghép vào chuỗi
      temp = temp ~/ 2; // Chia lấy phần nguyên
    }
  }

  // Hiển thị kết quả
  print('Số nhị phân của $number là: $binary');
}
