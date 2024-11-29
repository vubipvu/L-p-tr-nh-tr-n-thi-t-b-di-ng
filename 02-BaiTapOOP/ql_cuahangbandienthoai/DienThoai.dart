class Dienthoai {
  String _maDT;
  String _tenDT;
  String _hangSX;
  double _giaNhap;
  double _giaBan;
  int _soLuongTonKho;
  bool _trangThai;

  //Constructor
  Dienthoai(this._giaBan,
            this._giaNhap,
            this._hangSX,
            this._maDT,
            this._soLuongTonKho,
            this._tenDT,
            this._trangThai);


  //getter
  String get maDT => _maDT;
  String get tenDT => _tenDT;
  String get hangSX => _hangSX;
  double get giaNhap => _giaNhap;
  double get giaBan => _giaBan;
  int get soLuongTonKho => _soLuongTonKho;
  bool get trangThai => _trangThai;

  //setter
   set maDT(String maDT){
    _maDT = (maDT.isNotEmpty)?maDT:_maDT;
  }

  set hangSX(String hangSX){
    _hangSX = (hangSX.isNotEmpty)?hangSX:_hangSX;
  }
  
  set giaNhap(double giaNhap){  
      if ( giaNhap >0 )  {
        _giaNhap = giaNhap;
      } 
    }
     set giaBan(double giaBan){  
      if ( giaBan > giaNhap )  {
        _giaBan = giaBan;
      } 
    }
     set soLuongTonKho(int soLuongTonKho){  
      if ( soLuongTonKho >=0 )  {
        _soLuongTonKho = soLuongTonKho;
      } 
    }
    set trangThai(bool trangThai){  
      if ( trangThai=true )  {
        _trangThai = trangThai;
      } 
    }
  double loinhuandukien(){
    return giaBan-giaNhap;
  }

  void kiemtraibanhang(){
   if (_soLuongTonKho > 0 && _trangThai) {
      print('Điện thoại có thể bán.');
    } else {
      print('Điện thoại không thể bán.');
      if (_soLuongTonKho <= 0) {
        print('Lý do: Hết hàng trong kho.');
      }
      if (!_trangThai) {
        print('Lý do: Sản phẩm không được phép kinh doanh.');
      }
    } 

  }


  void hienthithongtin(){
  print('Ma DT: $maDT');
  print('Ten DT: $tenDT');
  print('Hang SX: $hangSX');
  print('Gia Nhap: $giaNhap');
  print('Gia Ban: $giaBan');
  print('So luong ton kho: $soLuongTonKho');
    print('Trạng thái: ${_trangThai ? "Đang kinh doanh" : "Ngừng kinh doanh"}');


}

}