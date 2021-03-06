import 'dart:convert';
import 'dart:ffi';

import 'package:sosmed_emenu/model/posting.model.dart';
import 'package:sosmed_emenu/share/globals.dart' as globals;
import 'package:http/http.dart' as http;


class PostingApiClient  {
    String serverPath = globals.serverPath;

    Future<List<Post>> getAllPost(int page) async {

        List<Post> posts = [];
        String apiUrl = serverPath + '/sosmed/post/page/$page/count/10';
        Map data = {
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

    Future<String> likePosting(String postId, int like) async {

        String apiUrl =serverPath + '/sosmed';
        
        if (like == 1) {
            apiUrl = apiUrl + '/like/$postId';
        } else {
            apiUrl = apiUrl + '/dislike/$postId';
        }
        print('url => $apiUrl ');
        var apiResult = await http.post(apiUrl, body: {});
        var jsonObj = json.decode(apiResult.body);

        if (jsonObj['rc']=='00'){
            return "ok";
        } else {
            return jsonObj['data'];
        }
    }

}