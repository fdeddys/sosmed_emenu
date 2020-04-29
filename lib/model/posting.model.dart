
class Post {
    int id;
    String posting;
    int like;
    int dislike;
    String timePost;
    int restoId;
    String imgUrl;
    String restoName;
    String restoImageUrl;


    Post(this.id, this.posting, this.like, this.dislike, this.timePost, this.restoId, this.imgUrl, this.restoName, this.restoImageUrl);

    Post.fromJson(Map jsonMap) :
        id = jsonMap['id'],
        posting = jsonMap['posting'],
        like = jsonMap['like'],
        dislike = jsonMap['dislike'],
        timePost = jsonMap['timePost'],
        restoId = jsonMap['restoId'],
        imgUrl = jsonMap['imgUrl'],
        restoName = jsonMap['restoName'],
        restoImageUrl = jsonMap['restoImgUrl'];
  
  
}