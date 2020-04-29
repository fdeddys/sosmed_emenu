import 'package:flutter/material.dart';
import 'package:sosmed_emenu/model/posting.model.dart';

class MainPage extends StatefulWidget {
    @override
    _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

    List<Post> posts = [];

    @override
    void initState() {
        super.initState();
        getDataAllPost();
    }

    getDataAllPost() {
        for (var i = 0; i < 10; i++) {
            Post pos = new Post(i, "posting " + i.toString() , i*2, i, '2020-27-04', 72, "https://picsum.photos/200/300","","");
            posts.add(pos);
        }
        print('total ' + posts.length.toString());
    }

    @override
    Widget build(BuildContext context) {
        return
            Scaffold(
                resizeToAvoidBottomPadding: false,
                body: listItem()
            );
    }

      Widget listItem() {
        return Container(
            color: Colors.grey.shade200,
            padding: EdgeInsets.all(3),
            child: GridView.count(
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              crossAxisCount: 4,
              children: new List<Widget>.generate(posts.length, (idx){
                  return 
                      Container(
                          padding: EdgeInsets.all(3),
                          color: Colors.white,
                        child: Column(
                            children: <Widget>[
                                Flexible(
                                      flex: 6, 
                                      child: InkWell(
                                          
                                          onTap: (){
                                              // addItem(menuItems[idx]);
                                          },
                                          child: posts[idx].imgUrl =='' ?  Image(image :  AssetImage('images/no-image.png'))
                                                // Image.network('https://via.placeholder.com/100')
                                                // FadeInImage.assetNetwork(
                                                //     placeholder: 'images/blue_loading.gif',
                                                //     image: 'https://via.placeholder.com/100',
                                                   
                                                // )
                                              : Image.network('${posts[idx].imgUrl}')
                                      )
                                  ),
                                Flexible(
                                    flex: 2,  
                                    child: 
                                        Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: Text('${posts[idx].posting}',
                                                overflow: TextOverflow.ellipsis,
                                                softWrap: true,
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                                style: TextStyle(
                                                        color: Colors.grey.shade800,
                                                        fontSize: 8,
                                                        fontWeight: FontWeight.bold,
                                                )
                                            ),
                                        )
                                ),
                            ],
                        ),
                      );
              }),
          ),
        );
    }

}