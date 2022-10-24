import 'package:country_picker/country_picker.dart';
import 'package:get/get.dart';


class LoginController extends GetxController {

  var countryCode = "1".obs;
  var emoji="🇦🇮".obs;
  var isObscure=true.obs;
  var empty="".obs;


  setCountries(Country country){
    emoji.value=(country.flagEmoji);
    countryCode.value=country.e164Key.split("-")[0];
  }
  setObsecure(){
    isObscure.value=!isObscure.value;

  }


}
