import 'DienThoai.dart';
import 'HoaDon.dart';
void main() {
  var dienThoai = DienThoai('DT001', 'iPhone 14', 'Apple', 1500, 2000, 10, true);
  var hoaDon = HoaDon('HD-001', DateTime.now(), dienThoai, 2, 1800, 'Nguyen Van A', '0987654321');


  hoaDon.hienThiThongTin();
}
