import './helper.dart' as helper;
import './urls.dart' as urls;

Future getDiscoveredList( Map<String,String> data ){
  return helper.makePostRequest(urls.DISCOVERY_URL, data);
}