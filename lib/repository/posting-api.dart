import 'dart:convert';

import 'package:sosmed_emenu/model/posting.model.dart';
import 'package:sosmed_emenu/share/globals.dart' as globals;
import 'package:http/http.dart' as http;


class PostingApiClient  {
    String serverPath = globals.serverPath;

    Future<List<Post>> getAllPost(String restoCode) async {

        List<Post> posts = [];
        String apiUrl = serverPath + '/menu-item/filter';
        Map data = {
            'restoCode' : restoCode
        };

        var bodyJson = jsonEncode(data);
        var apiResult = await http.post(apiUrl, body:  bodyJson);
        var jsonObj = json.decode(apiResult.body);

         if (jsonObj['rc']=='00'){
            if (jsonObj['data'] != []) {
                posts = ( jsonObj['data'] as List ).map((i)=> Post.fromJson(i)).toList();
            }
            return posts;
        }
        return posts;
    }
}