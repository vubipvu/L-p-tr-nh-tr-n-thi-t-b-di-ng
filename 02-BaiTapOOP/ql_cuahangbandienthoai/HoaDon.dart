import 'dart:core';
import 'DienThoai.dart';

class DienThoai {
  // Các thuộc tính của điện thoại
  String maDT;
  String tenDT;
  String hangSX;
  double giaNhap;
  double giaBan;
  int soLuongTonKho;
  bool trangThai;

  // Constructor
  DienThoai(
    this.maDT,
    this.tenDT,
    this.hangSX,
    this.giaNhap,
    this.giaBan,
    this.soLuongTonKho,
    this.trangThai,
  );
}

class HoaDon {
  // Thuộc tính private
  String _maHoaDon;
  DateTime _ngayBan;
  DienThoai _dienThoai; // Điện thoại trong hóa đơn
  int _soLuongMua;
  double _giaBanThucTe;
  String _tenKhachHang;
  String _soDienThoaiKhach;

  // Constructor đầy đủ tham số
  HoaDon(
    this._maHoaDon,
    this._ngayBan,
    this._dienThoai,
    this._soLuongMua,
    this._giaBanThucTe,
    this._tenKhachHang,
    this._soDienThoaiKhach,
  );

  // Getter và Setter
  String get maHoaDon => _maHoaDon;
  set maHoaDon(String value) {
    if (value.isNotEmpty && RegExp(r'^HD-\d{3}$').hasMatch(value)) {
      _maHoaDon = value;
    } else {
      throw Exception('Mã hóa đơn không hợp lệ! Định dạng: "HD-XXX".');
    }
  }

  DateTime get ngayBan => _ngayBan;
  set ngayBan(DateTime value) {
    if (value.isBefore(DateTime.now()) || value.isAtSameMomentAs(DateTime.now())) {
      _ngayBan = value;
    } else {
      throw Exception('Ngày bán không thể sau ngày hiện tại.');
    }
  }

  DienThoai get dienThoai => _dienThoai;

  int get soLuongMua => _soLuongMua;
  set soLuongMua(int value) {
    if (value > 0 && value <= _dienThoai.soLuongTonKho) {
      _soLuongMua = value;
    } else {
      throw Exception('Số lượng mua không hợp lệ! Phải > 0 và <= tồn kho.');
    }
  }

  double get giaBanThucTe => _giaBanThucTe;
  set giaBanThucTe(double value) {
    if (value > 0) {
      _giaBanThucTe = value;
    } else {
      throw Exception('Giá bán thực tế phải > 0.');
    }
  }

  String get tenKhachHang => _tenKhachHang;
  set tenKhachHang(String value) {
    if (value.isNotEmpty) {
      _tenKhachHang = value;
    } else {
      throw Exception('Tên khách hàng không được rỗng.');
    }
  }

  String get soDienThoaiKhach => _soDienThoaiKhach;
  set soDienThoaiKhach(String value) {
    if (RegExp(r'^\d{10,11}$').hasMatch(value)) {
      _soDienThoaiKhach = value;
    } else {
      throw Exception('Số điện thoại khách không hợp lệ! Định dạng: 10-11 chữ số.');
    }
  }

  // Phương thức tính tổng tiền
  double tinhTongTien() {
    return _soLuongMua * _giaBanThucTe;
  }

  // Phương thức tính lợi nhuận thực tế
  double tinhLoiNhuanThucTe() {
    double loiNhuanTrenMotSanPham = _giaBanThucTe - _dienThoai.giaNhap;
    return loiNhuanTrenMotSanPham * _soLuongMua;
  }

  // Phương thức hiển thị thông tin hóa đơn
  void hienThiThongTin() {
    print('----------------------- Thông tin hóa đơn -----------------------');
    print('Mã hóa đơn: $_maHoaDon');
    print('Ngày bán: $_ngayBan');
    print('Tên điện thoại: ${_dienThoai.tenDT}');
    print('Hãng sản xuất: ${_dienThoai.hangSX}');
    print('Giá bán thực tế: $_giaBanThucTe');
    print('Số lượng mua: $_soLuongMua');
    print('Tên khách hàng: $_tenKhachHang');
    print('Số điện thoại khách: $_soDienThoaiKhach');
    print('Tổng tiền: ${tinhTongTien()}');
    print('Lợi nhuận thực tế: ${tinhLoiNhuanThucTe()}');
    print('----------------------------------------------------------------');
  }
}
