import 'dart:wasm';

class Comment {
    String id="";
    String authorName="";
    String authorImageUrl="";
    String message="";
    String timeComment="";
    String postId="";
    int urut = 0;

    Comment(
        this.id,
        this.authorName,
        this.authorImageUrl,
        this.message,
        this.timeComment,
        this.postId,
        this.urut
    );

     Comment.fromJson(Map jsonMap) :
        id = jsonMap['id'],
        authorName = jsonMap['authorName'],
        authorImageUrl = jsonMap['authorImageURL'],
        message = jsonMap['message'],
        timeComment = jsonMap['timeComment'],
        postId = jsonMap['postID'],
        urut = jsonMap['urut'];

}


class CommentResut {
    String rc="";
    String message="";
    String data="";

    CommentResut(
        this.rc,
        this.message,
        this.data
    );

     CommentResut.fromJson(Map jsonMap) :
        rc = jsonMap['rc'],
        message = jsonMap['message'],
        data = jsonMap['data'];

}
