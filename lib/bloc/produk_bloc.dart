import 'package:tokokita/model/produk.dart';
import 'package:tokokita/service/produk_service.dart';

class ProdukBloc {
  static Future<bool> deleteProduk({required int id}) async {
    return await ProdukService.deleteProduk(id);
  }
}
