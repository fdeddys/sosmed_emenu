
class Post {
    String id = "";
    String posting ="";
    int like =0;
    int dislike =0;
    String timePost ="";
    int restoId =0;
    String imgUrl = "";
    String restoName ="";
    String restoImageUrl = "";
    int totalComment =0;

    Post(
        this.id , 
        this.posting , 
        this.like , 
        this.dislike, 
        this.timePost , 
        this.restoId , 
        this.imgUrl , 
        this.restoName , 
        this.restoImageUrl,
        this.totalComment,
    );
    
    // Post({
    //     this.id = 0, 
    //     this.posting = "", 
    //     this.like = 0, 
    //     this.dislike = 0, 
    //     this.timePost = "", 
    //     this.restoId = 0, 
    //     this.imgUrl = "", 
    //     this.restoName = "", 
    //     this.restoImageUrl = ""
    // });

    Post.fromJson(Map jsonMap) :
        id = jsonMap['id'],
        posting = jsonMap['posting'],
        like = jsonMap['like'],
        dislike = jsonMap['dislike'],
        timePost = jsonMap['timePost'],
        restoId = jsonMap['restoId'],
        imgUrl = jsonMap['imgUrl'],
        restoName = jsonMap['restoName'],
        restoImageUrl = jsonMap['restoImageUrl'],
        totalComment = jsonMap['totalComment'];
  
  
}