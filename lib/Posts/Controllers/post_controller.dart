import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:nipekazi/Service/api.dart';

class PostController extends GetxController{

var isloading = false.obs;

@override
void onInit() {
    // TODO: implement onInit
    super.onInit();
  }


getPosts (apiUrl) async{
isloading.value = true;
try{
 var res = await CallApi().getData(apiUrl);
}catch(e){
  print(e);

}
}



}