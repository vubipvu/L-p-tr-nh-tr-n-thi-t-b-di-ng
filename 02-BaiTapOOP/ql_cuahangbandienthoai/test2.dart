import 'DienThoai.dart';
import 'HoaDon.dart';
void main() {
  // Tạo đối tượng điện thoại
  DienThoai dt = DienThoai('DT001', 'Galaxy A14', 'Samsung', 10000, 15000, 10, true);

  // Tạo hóa đơn
  HoaDon hd = HoaDon(
    'HD-001', // Mã hóa đơn
    DateTime.now(), // Ngày bán
    dt, // Điện thoại
    2, // Số lượng mua
    16000, // Giá bán thực tế
    'Nguyen Van A', // Tên khách hàng
    '0987654321', // Số điện thoại khách
  );

  // Hiển thị thông tin hóa đơn
  hd.hienThiThongTin();
}
