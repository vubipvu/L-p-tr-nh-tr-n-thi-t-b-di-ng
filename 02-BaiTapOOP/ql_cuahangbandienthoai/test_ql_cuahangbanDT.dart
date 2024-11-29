import 'DienThoai.dart';
import 'HoaDon.dart';

class CuaHang {
  // Thuộc tính private
  String _tenCuaHang;
  String _diaChi;
  List<DienThoai> _danhSachDienThoai = [];
  List<HoaDon> _danhSachHoaDon = [];

  // Constructor với tên và địa chỉ
  CuaHang(this._tenCuaHang, this._diaChi);

  // Getter
  String get tenCuaHang => _tenCuaHang;
  String get diaChi => _diaChi;

  // Setter
  set tenCuaHang(String value) {
    if (value.isNotEmpty) _tenCuaHang = value;
  }

  set diaChi(String value) {
    if (value.isNotEmpty) _diaChi = value;
  }

  // --- Phương thức quản lý điện thoại ---
  void themDienThoai(DienThoai dt) {
    _danhSachDienThoai.add(dt);
    print('Đã thêm điện thoại: ${dt.tenDT}');
  }

  void capNhatDienThoai(String maDT, DienThoai updatedDT) {
    var dt = _danhSachDienThoai.firstWhere(
      (d) => d.maDT == maDT,
      orElse: () => throw Exception('Không tìm thấy điện thoại với mã: $maDT'),
    );
    dt.tenDT = updatedDT.tenDT;
    dt.hangSX = updatedDT.hangSX;
    dt.giaNhap = updatedDT.giaNhap;
    dt.giaBan = updatedDT.giaBan;
    dt.soLuongTonKho = updatedDT.soLuongTonKho;
    print('Đã cập nhật điện thoại: $maDT');
  }

  void ngungKinhDoanh(String maDT) {
    var dt = _danhSachDienThoai.firstWhere(
      (d) => d.maDT == maDT,
      orElse: () => throw Exception('Không tìm thấy điện thoại với mã: $maDT'),
    );
    dt.trangThai = false;
    print('Đã ngừng kinh doanh điện thoại: $maDT');
  }

  List<DienThoai> timKiemDienThoai({String? maDT, String? tenDT, String? hangSX}) {
    return _danhSachDienThoai.where((dt) {
      return (maDT != null && dt.maDT.contains(maDT)) ||
          (tenDT != null && dt.tenDT.toLowerCase().contains(tenDT.toLowerCase())) ||
          (hangSX != null && dt.hangSX.toLowerCase().contains(hangSX.toLowerCase()));
    }).toList();
  }

  void hienThiDanhSachDienThoai() {
    print('--- Danh sách điện thoại ---');
    for (var dt in _danhSachDienThoai) {
      print('Mã: ${dt.maDT}, Tên: ${dt.tenDT}, Hãng: ${dt.hangSX}, Giá: ${dt.giaBan}, Tồn kho: ${dt.soLuongTonKho}, Trạng thái: ${dt.trangThai ? "Kinh doanh" : "Ngừng KD"}');
    }
  }

  // --- Phương thức quản lý hóa đơn ---
  void taoHoaDon(HoaDon hd) {
    // Giảm số lượng tồn kho của điện thoại
    var dt = _danhSachDienThoai.firstWhere(
      (d) => d.maDT == hd._dienThoai.maDT,
      orElse: () => throw Exception('Không tìm thấy điện thoại với mã: ${hd._dienThoai.maDT}'),
    );
    if (dt.soLuongTonKho >= hd.soLuongMua) {
      dt.soLuongTonKho -= hd.soLuongMua;
      _danhSachHoaDon.add(hd);
      print('Đã tạo hóa đơn: ${hd.maHoaDon}');
    } else {
      throw Exception('Không đủ tồn kho để tạo hóa đơn!');
    }
  }

  List<HoaDon> timKiemHoaDon({String? maHD, DateTime? ngayBan, String? tenKhachHang}) {
    return _danhSachHoaDon.where((hd) {
      return (maHD != null && hd.maHoaDon.contains(maHD)) ||
          (ngayBan != null && hd.ngayBan.isAtSameMomentAs(ngayBan)) ||
          (tenKhachHang != null && hd.tenKhachHang.toLowerCase().contains(tenKhachHang.toLowerCase()));
    }).toList();
  }

  void hienThiDanhSachHoaDon() {
    print('--- Danh sách hóa đơn ---');
    for (var hd in _danhSachHoaDon) {
      hd.hienThiThongTin();
    }
  }

  // --- Phương thức thống kê ---
  double tinhTongDoanhThu(DateTime tuNgay, DateTime denNgay) {
    return _danhSachHoaDon.where((hd) {
      return hd.ngayBan.isAfter(tuNgay) && hd.ngayBan.isBefore(denNgay);
    }).fold(0, (tong, hd) => tong + hd.tinhTongTien());
  }

  double tinhTongLoiNhuan(DateTime tuNgay, DateTime denNgay) {
    return _danhSachHoaDon.where((hd) {
      return hd.ngayBan.isAfter(tuNgay) && hd.ngayBan.isBefore(denNgay);
    }).fold(0, (tong, hd) => tong + hd.tinhLoiNhuanThucTe());
  }

  List<DienThoai> thongKeTopBanChay(int soLuongTop) {
    var thongKe = <DienThoai, int>{};
    for (var hd in _danhSachHoaDon) {
      thongKe.update(hd._dienThoai, (value) => value + hd.soLuongMua, ifAbsent: () => hd.soLuongMua);
    }
    return thongKe.entries
        .toList()
        .sorted((a, b) => b.value.compareTo(a.value))
        .take(soLuongTop)
        .map((e) => e.key)
        .toList();
  }

  void thongKeTonKho() {
    print('--- Thống kê tồn kho ---');
    for (var dt in _danhSachDienThoai) {
      print('Mã: ${dt.maDT}, Tên: ${dt.tenDT}, Tồn kho: ${dt.soLuongTonKho}');
    }
  }
}
