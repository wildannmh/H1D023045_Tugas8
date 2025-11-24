import 'package:http/http.dart' as http;

class ProdukService {
  static Future<bool> deleteProduk(int id) async {
    final response = await http.delete(
      Uri.parse("http://localhost/tokokita/api/produk/delete/$id"),
    );

    return response.statusCode == 200;
  }
}
