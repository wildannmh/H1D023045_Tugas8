class ApiUrl {
  // static const String baseUrl = 'http://10.99.4.182/tokokita/public';
  // static const String baseUrl = 'http://toko-api.test/index.php';
  static const String baseUrl = 'http://192.168.56.1:8080';
  // static const String baseUrl = 'http://localhost:8080';
  static const String registrasi = baseUrl + '/registrasi';
  static const String login = baseUrl + '/login';
  static const String listProduk = baseUrl + '/produk';
  static const String createProduk = baseUrl + '/produk';
  static String updateProduk(int id) {
    return baseUrl + '/produk/' + id.toString();
  }

  static String showProduk(int id) {
    return baseUrl + '/produk/' + id.toString();
  }

  static String deleteProduk(int id) {
    return baseUrl + '/produk/' + id.toString();
  }
}
