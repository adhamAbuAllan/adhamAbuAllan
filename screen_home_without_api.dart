import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ween_blaqe/styles/button.dart';
import 'package:ween_blaqe/styles/show_more_widget/about_apartment_style.dart';
import 'package:ween_blaqe/widgets/toast_widget.dart';
import '../../../widgets/user/studnet/show_more.dart';
class AdPost extends StatefulWidget {
   AdPost({Key? key,
    required this.image,
     required this.title,
     required this.price,
     required this.city,
     this.clicked
  }) : super(key: key,);
  String image;
  String title;
  int price;
  String city;
  bool ? clicked;

  @override
  State<AdPost> createState() => _AdPostState();
}

class _AdPostState extends State<AdPost> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      margin: EdgeInsets.fromLTRB(10, 23, 10, 0),
      // width: 373,
      height: 395,
      //decoration of show apartment style
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.white70,
      ),


      child:Column(
        // this children have (bookmark IconImage  , image of apartment , title of post , price , and location.
        children: [
          // bookmark iconImage
          Row(
            children: [
              Expanded(child: Text("")),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: widget.clicked == false ?  IconButton(
                  onPressed: () {
                    setState(() {
                      widget.clicked = true;
                      toast("تم حفظ الإعلان");

                    });
                  },
                  icon:  const Icon(
                    Icons.bookmark_outline,
                    size: 28,
                  )
                ): IconButton(
                    onPressed: () {
                      setState(() {
                        widget.clicked = false;
                        toast("تم إلغاء حفظ الإعلان");


                      });

                    },
                    icon:  const Icon(
                      Icons.bookmark,
                      size: 28,
                    )
                ),
              ),
            ],
          ),
          // image/s of apartment
          ClipRRect(
              borderRadius: BorderRadius.circular(7/2),
              child: Image(
                image: AssetImage(widget.image)
                // child: Image(image: Image.network("src")),
                ,
                height: 240,
                // width:368,
              )),
          // title and price
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(widget.title,
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontFamily: 'IBM',
                      fontSize: 15,

                    )),
              ),
              const Expanded(child: Text("")),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 3, 0),
                child: Text(widget.price.toString(),
                    style: const TextStyle(color: Colors.orange,
                      fontSize: 16,
                      fontFamily: 'IBM',)),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 3, 0),
                child: Text("ش/ش",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontFamily: 'IBM',
                    )),
              ),
            ],
          ),

          // see more and location
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: OutlinedButton(
                  onPressed: () {
                    Get.to(ShowMore());
                    },
                  style: outlineButton,
                  child: const Text(
                    " عرض المزيد ",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'IBM',
                    ),
                  ),
                ),
              ),
              Expanded(child: Text("")),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text("الموقع:",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontFamily: 'IBM',
                    )),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text(widget.city,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontFamily: 'IBM',
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
