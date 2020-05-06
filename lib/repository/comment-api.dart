import 'dart:convert';

import 'package:sosmed_emenu/model/comment_model.dart';
import 'package:sosmed_emenu/model/posting.model.dart';
import 'package:sosmed_emenu/share/globals.dart' as globals;
import 'package:http/http.dart' as http;


class CommentApiClient  {
    String serverPath = globals.serverPath;

    Future<List<Comment>> getAllCommentByPostId(String postId) async {

        List<Comment> comments = [];
        String apiUrl = serverPath + '/sosmed/comment/$postId';
        Map data = {};

        var bodyJson = jsonEncode(data);
        var apiResult = await http.post(apiUrl, body:  bodyJson);
        var jsonObj = json.decode(apiResult.body);

        if (jsonObj['rc']=='00'){
          print('isi get data ' + jsonObj['data'].toString());

            if (jsonObj['data'] != null) {
                comments = ( jsonObj['data'] as List ).map((i)=> Comment.fromJson(i)).toList();
            }
            return comments;
        }
        return comments;
    }

    Future<CommentResut> addCommentByPostId(String postId, Comment comment) async {

        CommentResut result;
        String apiUrl = serverPath + '/sosmed/comment';
        Map data = {
            'postId' : postId,
            'authorName' : comment.authorName, 
            'authorImageUrl': comment.authorImageUrl, 
            'message': comment.message, 
        };
        print('url comment : ' + apiUrl);
        print('data : ' + data.toString());
        
        var bodyJson = jsonEncode(data);
        var apiResult = await http.post(apiUrl, body:  bodyJson);
        var jsonObj = json.decode(apiResult.body);

        print('rc comment'+jsonObj['rc']);
        print('msg comment '+jsonObj['message']);
        if (jsonObj['rc']=='00'){
            if (jsonObj['data'] != null) {
                result = CommentResut.fromJson(jsonObj);
            }
            return result;
        } 
        return result;
    }

    


}