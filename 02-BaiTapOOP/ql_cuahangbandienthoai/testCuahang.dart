import 'DienThoai.dart';
import 'HoaDon.dart';
import 'CuaHang.dart';
void main() {
  var cuaHang = CuaHang('Cửa Hàng ABC', '123 Đường XYZ');

  // Thêm điện thoại
  var dt1 = DienThoai('DT001', 'Galaxy A14', 'Samsung', 10000, 15000, 10, true);
  var dt2 = DienThoai('DT002', 'iPhone 14', 'Apple', 20000, 30000, 5, true);
  cuaHang.themDienThoai(dt1);
  cuaHang.themDienThoai(dt2);

  // Tạo hóa đơn
  var hoaDon = HoaDon('HD-001', DateTime.now(), dt1, 2, 16000, 'Nguyen Van A', '0987654321');
  cuaHang.taoHoaDon(hoaDon);

  // Hiển thị danh sách điện thoại và hóa đơn
  cuaHang.hienThiDanhSachDienThoai();
  cuaHang.hienThiDanhSachHoaDon();

  // Thống kê doanh thu
  print('Doanh thu: ${cuaHang.tinhTongDoanhThu(DateTime(2024, 11, 1), DateTime(2024, 11, 30))}');
}
