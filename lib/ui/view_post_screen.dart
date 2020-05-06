import 'package:flutter/material.dart';
import 'package:sosmed_emenu/model/comment_model.dart';
import 'package:sosmed_emenu/model/posting.model.dart';
import 'package:sosmed_emenu/repository/comment-api.dart';

class ViewPostScreen extends StatefulWidget {
  final Post post;

  ViewPostScreen({this.post});

  @override
  _ViewPostScreenState createState() => _ViewPostScreenState(post);
}

class _ViewPostScreenState extends State<ViewPostScreen> {

    List<Comment> comments = [];
    Post curPosting ;
    CommentApiClient commetApi = new CommentApiClient();

    _ViewPostScreenState(this.curPosting);

    @override
    void initState() {
        super.initState();
        getDataAllComment();
    }

    sendComment(String txtComment) async {
        Comment comment = new Comment(null, "tes", "https://picsum.photos/200/300", txtComment, "", curPosting.id, 0);
        CommentResut result  = await commetApi.addCommentByPostId(curPosting.id, comment);
        setState(() {
            comment.id = result.data;
            comments.add(comment);
        });
        
    }


    getDataAllComment() async{ 
        comments = await commetApi.getAllCommentByPostId(curPosting.id);

        print('total comments  ' + comments.length.toString());
        setState(() {
            
        });
    }


    Widget _buildComment(int index) {
        return Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              child: ListTile(
                  leading: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                              BoxShadow(
                                  color: Colors.black45,
                                  offset: Offset(0, 2),
                                  blurRadius: 6.0,
                              ),
                          ],
                      ),
                      child: CircleAvatar(
                          child: ClipOval(
                              child: 
                                  comments[index].authorImageUrl == '' ? Image(image :  AssetImage('images/no-image.png')) 
                                      :
                                      Image.network(
                                          '${comments[index].authorImageUrl}',
                                          height: 50,
                                          width: 50,
                                      ),

                          ),
                      ),
                  ),
                  title: Text(
                      comments[index].authorName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                      ),
                  ),
                  subtitle: Text(comments[index].message),
                  trailing: IconButton(
                      icon: Icon(
                          Icons.favorite_border,
                      ),
                      color: Colors.grey,
                      onPressed: () => print('Like comment'),
                  ),
              ),
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
        print('isi posting '+ this.curPosting.restoImageUrl);

        return Scaffold(
            backgroundColor: Color(0xFFEDF0F6),
            body: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: 
                    ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                            postDetail(),
                            listComment2(),
                        ],
                    )
                
                
                // Column(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: <Widget>[
                //         postDetail(),
                        
                //         // SizedBox(height: 10.0),

                //         listComment2(),
                //         // Expanded(child: Text('total ${comments.length}'))

                //     ],
                // ),
            ),
            bottomNavigationBar: input(),
        );
    }
    

    Widget postDetail() {
        return
            Column(
            children: <Widget>[
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.arrow_back),
                        iconSize: 30.0,
                        color: Colors.black,
                        onPressed: () => Navigator.pop(context),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ListTile(
                            leading: Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                        BoxShadow(
                                            color: Colors.black,
                                            offset: Offset(0, 2),
                                            blurRadius: 6.0,
                                        ),
                                    ],
                                ),
                                child: CircleAvatar(
                                    backgroundColor: Colors.grey.shade200,
                                    child: ClipOval(
                                            child:
                                                curPosting.restoImageUrl == null ? Image(image :  AssetImage('images/no-image.png')) 
                                                :
                                                Image.network(
                                                    '${curPosting.restoImageUrl}',
                                                    height: 50,
                                                    width: 50,
                                                ),
                                    ),
                                                    ),
                            ),
                            title: Text(
                                widget.post.restoName,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                ),
                            ),
                            subtitle: Text(widget.post.timePost),
                            trailing: IconButton(
                                icon: Icon(Icons.more_horiz),
                                color: Colors.black,
                                onPressed: () => print('More'),
                            ),
                        ),
                    ),
                ],
                ),
                InkWell(
                onDoubleTap: () => print('Like post'),
                child: Container(
                    child: 
                        curPosting.imgUrl == '' ?
                            Image(image :  AssetImage('images/no-image.png'))
                            :
                            Image.network(
                                    '${curPosting.imgUrl}',
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.fitWidth,
                        ),
                    margin: EdgeInsets.all(10.0),
                    width: double.infinity,
                    height: 400.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        boxShadow: [
                            BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0, 5),
                            blurRadius: 8.0,
                            ),
                        ],
                    ),
                ),
                ),

                Container(
                    child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                        '${curPosting.posting} ajldjaldsjaljdlajldjadja aljdlajdljal j ldjadjaljdaljdaljd dkajdlajldjaldjalsd dlkadljka', 
            
                        textAlign: TextAlign.start, 
                        softWrap: true, 
                        style: TextStyle(fontSize: 15), ),
                    ),
                ),
                Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                        Row(
                            children: <Widget>[
                                Row(
                                    children: <Widget>[
                                        IconButton(
                                            icon: Icon(Icons.thumb_up),
                                            iconSize: 30.0,
                                            onPressed: () => print('Like post'),
                                        ),
                                        Text(
                                            '${curPosting.like}',
                                            style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w600,
                                            ),
                                        ),
                                        IconButton(
                                            icon: Icon(Icons.thumb_down),
                                            iconSize: 30.0,
                                            onPressed: () => print('DISLike post'),
                                        ),
                                        Text(
                                            '${curPosting.dislike}',
                                            style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w600,
                                            ),
                                        ),
                                    ],
                                ),
                                SizedBox(width: 20.0),
                                Row(
                                    children: <Widget>[
                                    IconButton(
                                        icon: Icon(Icons.chat),
                                        iconSize: 30.0,
                                        onPressed: () {
                                        print('Chat');
                                        },
                                    ),
                                    Text(
                                        '${curPosting.totalComment}',
                                        style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                        ),
                                    ),
                                    ],
                                ),
                            ],
                        ),

                        IconButton(
                            icon: Icon(Icons.bookmark_border),
                            iconSize: 30.0,
                            onPressed: () => print('Save post'),
                        ),
                    ],
                ),
                ),
            ],
            );
    }

    Widget listComment2() {
        return ListView.builder(
            itemCount: comments.length ,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder:(context, idx) {
                return GestureDetector(
                    child: 
                        // Text('$comments[idx].authorName'),
                        _buildComment(idx),
                    onTap: () {
                    //    gotoPaymentPage(pesanans[idx]);
                    },
                );
            },
            // separatorBuilder: (context, index) {
            //     return Divider();
            // },
        );

    }

    Widget listComment(){
        return
            Container(
                    width: double.infinity,
                    // height: 600.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                        ),
                    ),
                    child: Column(
                        children: <Widget>[
                        // _buildComment(0),
                        // _buildComment(1),
                        // _buildComment(2),
                        // _buildComment(3),
                        // _buildComment(4),
                        ],
                    ),
                );
    }

    Widget input() {

        TextEditingController txtComment = TextEditingController();

        return
            Transform.translate(
            offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
            child: Container(
            height: 80.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                ),
                boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, -2),
                        blurRadius: 6.0,
                    ),
                ],
                color: Colors.white,
            ),
            child: Padding(
                padding: EdgeInsets.all(12.0),
                child: TextField(
                    controller: txtComment,
                    autocorrect: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(color: Colors.grey),
                        ),
                        contentPadding: EdgeInsets.all(20.0),
                        hintText: 'Add a comment',
                        prefixIcon: Container(
                            margin: EdgeInsets.all(8.0),
                            width: 48.0,
                            height: 48.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                    BoxShadow(
                                        color: Colors.black45,
                                        offset: Offset(0, 2),
                                        blurRadius: 6.0,
                                    ),
                                ],
                            ),
                            child: CircleAvatar(
                                backgroundColor: Colors.grey.shade200,
                                child: ClipOval(
                                    child: Image(
                                        height: 35.0,
                                        width: 35.0,
                                        image:  AssetImage('images/no-image.png'),
                                        fit: BoxFit.cover,
                                        
                                    ),
                                ),
                            ),
                        ),
                        suffixIcon: Container(
                            margin: EdgeInsets.only(right: 8.0),
                            width: 50.0,
                            decoration:  BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                    BoxShadow(
                                        color: Colors.black45,
                                        offset: Offset(0, 2),
                                        blurRadius: 6.0,
                                    ),
                                ],
                            ),
                            child: FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                ),
                                // color: Color(0xFF23B66F),
                                color: Colors.lightBlue,
                                onPressed: () => {
                                    print('Post comment'),
                                    sendComment(txtComment.text),
                                },
                                child: Icon(
                                    Icons.send,
                                    size: 25.0,
                                    color: Colors.white,
                                ),
                            ),
                        ),
                    ),
                ),
            ),
            ),
        );
    }


}

