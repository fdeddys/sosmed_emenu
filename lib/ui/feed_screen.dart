import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sosmed_emenu/model/posting.model.dart';
import 'package:sosmed_emenu/repository/posting-api.dart';
import 'package:sosmed_emenu/ui/view_post_screen.dart';

class FeedScreen extends StatefulWidget {
    @override
    _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
    List<Post> posts =[] ;

    PostingApiClient postingApiClient = new PostingApiClient();

    int curPage = 1 ;
    @override
    void initState() {
        super.initState();
        getDataAllPost();
    }

    getDataAllPost() async{ 

        posts = await postingApiClient.getAllPost(curPage);

        // for (var i = 0; i < 10; i++) {
        //     Post pos = new Post(
        //         i,
        //         "posting " + i.toString(),
        //         i * 2,
        //         i,
        //         '2020-27-04',
        //         72,
        //         "https://picsum.photos/200/300",
        //         "restno no " + i.toString(),
        //         "https://picsum.photos/200/300");
        //     posts.add(pos);
        // }
        print('total ' + posts.length.toString());
        setState(() {
          
        });
    }


    likePost(int index, int like) async   {
        String postId = posts[index].id;
        String likeOk = await postingApiClient.likePosting(postId, like);
        print('status like' + likeOk);
        if (likeOk == "ok") {
            setState(() {
                if (like ==1) {
                    posts[index].like +=1;
                } else {
                    posts[index].dislike +=1;
                }
            });

        } else {

        }
    }



    Widget _buildPost(int index) {
        return Padding(
        // padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
        padding: EdgeInsets.all(2),
        child: Container(
            width: double.infinity,
            height: 560.0,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
            children: <Widget>[
                Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                    children: <Widget>[
                    ListTile(
                        leading: Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                    BoxShadow(
                                        color: Colors.black45,
                                        offset: Offset(0, 2),
                                        blurRadius: 3.0,
                                    ),
                                ],
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.grey.shade200,
                                child: 
                                    ClipOval(
                                        child: 
                                        posts[index].restoImageUrl == '' ? Image(image :  AssetImage('images/no-image.png')) 
                                    :
                                        Image.network(
                                            '${posts[index].restoImageUrl}',
                                            height: 50,
                                            width: 50,
                                        ),
                                ),
                            ),
                        ),
                        title: Text(
                            posts[index].restoName?? "",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                            ),
                        ),
                        subtitle: Text(posts[index].timePost?? ""),
                        trailing: IconButton(
                        icon: Icon(Icons.more_horiz),
                            color: Colors.black,
                            onPressed: () => print('More'),
                        ),
                    ),
                    InkWell(
                        onDoubleTap: () => {
                            print('Like post'),
                        },
                        onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ViewPostScreen(
                                        post: posts[index],
                                        ),
                                ),
                            );
                        },
                        child: Column(
                          children: <Widget>[
                              Container(
                                  margin: EdgeInsets.all(10.0),
                                  width: double.infinity,
                                  height: 350.0,
                                  child: 
                                      posts[index].imgUrl == '' ?
                                          Image(image :  AssetImage('images/no-image.png'))
                                      :
                                          Image.network(
                                                  '${posts[index].imgUrl}',
                                                  height: 50,
                                                  width: 50,
                                                  fit: BoxFit.fitWidth,
                                      ),
                                  
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    '${posts[index].posting} ajldjaldsjaljdlajldjadja aljdlajdljal j ldjadjaljdaljdaljd dkajdlajldjaldjalsd dlkadljka', 
                                    maxLines: 2,
                                    textAlign: TextAlign.start, 
                                    overflow: TextOverflow.ellipsis, 
                                    softWrap: true, 
                                    style: TextStyle(fontSize: 15), ),
                                ),
                              )
                          ],
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
                                            onPressed: () => {
                                                print('Like post'),
                                                likePost(index,1),
                                            }
                                        ),
                                        Text('${posts[index].like}',
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w600,
                                            ),
                                        ),
                                        IconButton(
                                            icon: Icon(Icons.thumb_down),
                                            iconSize: 30.0,
                                            onPressed: () => {
                                                print('DISLike post'),
                                                likePost(index,0),
                                            }
                                        ),
                                        Text('${posts[index].dislike}',
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w600,
                                            ),
                                        ),
                                    ],
                                ),
                                SizedBox(width: 15.0),
                                Row(
                                    children: <Widget>[
                                        IconButton(
                                            icon: Icon(Icons.chat),
                                            iconSize: 30.0,
                                            onPressed: () {
                                                print('isi send '+ posts[index].restoImageUrl);
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (_) => ViewPostScreen(post: posts[index]),)
                                                );
                                            },
                                        ),
                                        Text("${posts[index].totalComment}",
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
                ),
                ),
            ],
            ),
        ),
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Color(0xFFEDF0F6),
            body:
                Padding(
                    padding: const EdgeInsets.only(top: 25, left: 5),
                    child: Column(
                        children: <Widget>[
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                    Text('Insta menu',
                                        style: TextStyle(
                                            fontFamily: 'Billabong',
                                            fontSize: 30.0,
                                        ),
                                    ),
                                ]
                            ),
                            // listView(),
                            posts.length > 0 ? listView() : CircularProgressIndicator(backgroundColor: Colors.red,),
                        ],
                    ),
                )
        );
    }

    Widget listView() {
        return Expanded(
            child: ListView.separated(
                itemCount: posts.length ,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder:(context, idx) {
                    return GestureDetector(
                        child: 
                            // Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     mainAxisAlignment: MainAxisAlignment.start,
                            //     children: <Widget>[
                            //         Text(
                            //             '${posts[idx].posting}'
                            //         )
                            //     ],
                            // ),
                        _buildPost(idx),
                        onTap: () {
                        //    gotoPaymentPage(pesanans[idx]);
                        },
                      );
                },
                separatorBuilder: (context, index) {
                    return Divider();
                },
            )
        );
    }


}











                          // Row(
                          //     children: <Widget>[
                          //         IconButton(
                          //             icon: Icon(Icons.live_tv),
                          //             iconSize: 30.0,
                          //             onPressed: () => print('IGTV')),
                          //         SizedBox(width: 16.0),
                          //         Container(
                          //             width: 35.0,
                          //             child: IconButton(
                          //                 icon: Icon(Icons.send),
                          //                 iconSize: 30.0,
                          //                 onPressed: () => print('Direct Messages'),
                          //             ),
                          //         )
                          //     ],
                          // ),
                          
                      

// bottomNavigationBar: ClipRRect(
//             borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(5.0),
//             topRight: Radius.circular(5.0),
//             ),
//             child: BottomNavigationBar(
//             type: BottomNavigationBarType.fixed,
//             items: [
//                 BottomNavigationBarItem(
//                 icon: Icon(
//                     Icons.dashboard,
//                     size: 30.0,
//                     color: Colors.black,
//                 ),
//                 title: Text(''),
//                 ),
//                 BottomNavigationBarItem(
//                 icon: Icon(
//                     Icons.search,
//                     size: 30.0,
//                     color: Colors.grey,
//                 ),
//                 title: Text(''),
//                 ),
//                 BottomNavigationBarItem(
//                 icon: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
//                     child: FlatButton(
//                     padding: EdgeInsets.symmetric(vertical: 10.0),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30.0),
//                     ),
//                     color: Color(0xFF23B66F),
//                     onPressed: () => print('Upload photo'),
//                     child: Icon(
//                         Icons.add,
//                         size: 35.0,
//                         color: Colors.white,
//                     ),
//                     ),
//                 ),
//                 title: Text(''),
//                 ),
//                 BottomNavigationBarItem(
//                 icon: Icon(
//                     Icons.favorite_border,
//                     size: 30.0,
//                     color: Colors.grey,
//                 ),
//                 title: Text(''),
//                 ),
//                 BottomNavigationBarItem(
//                 icon: Icon(
//                     Icons.person_outline,
//                     size: 30.0,
//                     color: Colors.grey,
//                 ),
//                 title: Text(''),
//                 ),
//             ],
//             ),
//         ),
