import 'package:foodloop/Entities/purchase_entity.dart';
import 'package:foodloop/ServiceAdapters/Firebase/fb_purchase_service.dart';
import 'package:foodloop/ServiceAdapters/Interface/char_service.dart';
class FbCharService implements CharServiceAdapter{
    FbPurchaseServiceAdapter fbPurchaseServiceAdapter = FbPurchaseServiceAdapter();
List<Purchase> purchases=[];
String userId="4hGdoRo0AORn9Q4o3TP9";
      Future<double> SumaTotal()async {
      purchases=await fbPurchaseServiceAdapter.getPurchasesByUserId(userId);
      double total = purchases.fold(0, (sum, item) => sum + item.totalPrice);
      return total;
    }
    
      @override
      Future<double> SumaTotalPorMes(String Mes) {
    // TODO: implement SumaTotalPorMes
    throw UnimplementedError();
      }
}