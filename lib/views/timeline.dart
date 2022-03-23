import 'package:flutter/material.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import 'package:SisKa/models/penelitian.dart';
import 'package:SisKa/models/timelineModel.dart';
import 'package:SisKa/models/api/api_service.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


class TimelinePage extends StatefulWidget {
  final String nim;
  const TimelinePage({Key key, this.nim}) : super(key: key);
  _TimelinePageState createState() => _TimelinePageState();
}


 

class _TimelinePageState extends State<TimelinePage> {
  final PageController pageController =
      PageController(initialPage: 1, keepPage: true);
       final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
      ApiService apiService = new ApiService();
   List<TimelineModelData> listData = new List<TimelineModelData>();
    List<Penelitian> listPenelitian = new List<Penelitian>();
  int pageIx = 1;

void initState() {
    super.initState();
      BackButtonInterceptor.add(myInterceptor);
   loadData() ;
   fetchNews();
}
  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }
  bool myInterceptor(bool stopDefaultButtonEvent) {
    return true;
  }

  void loadData() async{
  final listDataget = await apiService.getTimeline(widget.nim);
      setState(() {
         listData = listDataget;
      });
  }
   void fetchNews() async{
        _firebaseMessaging.getToken().then((token){
          apiService.updateToken(token);
          });

       // _firebaseMessaging.configure(
       //   onMessage: (Map<String, dynamic> message) async {
       //     print("onMessage: $message");
       // },
       //       
       // onResume: (Map<String, dynamic> message) async {
       //   print("onResume: $message");
       //   //_navigateToItemDetail(message);
       // },
       // );
  }



  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
        appBar: AppBar(
          title: Text('Timeline Penelitian'),
        ),
        body: timelineModel(TimelinePosition.Center)
        );
  }

  timelineModel(TimelinePosition position) => Timeline.builder(
      itemBuilder: centerTimelineBuilder,
      itemCount: listData.length,
      physics: position == TimelinePosition.Left
          ? ClampingScrollPhysics()
          : BouncingScrollPhysics(),
      position: position);

  TimelineModel centerTimelineBuilder(BuildContext context, int i) {
    final doodle = listData[i];
    final textTheme = Theme.of(context).textTheme;
    return TimelineModel(
        Card(
          margin: EdgeInsets.only(top: 16.0, bottom: 16, left: 7, right: 7),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: const EdgeInsets.only(left:20.0,right:20.0, bottom: 15),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Column( // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    doodle.backicon ,
                  ],
                ),

                const SizedBox(
                  height: 8.0,
                  width: 20,
                ),
                Text(doodle.time, style: textTheme.caption),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  doodle.name,
                  style: textTheme.headline1,
                  // style: textTheme.headline6,
                  textAlign: TextAlign.center,
                 ),
                const SizedBox(
                  height: 8.0,
                ),
               doodle.status !=null? Text(doodle.status, style: textTheme.caption):null,
              ],
            ),
          ),
        ),
        position:
            i % 2 == 0 ? TimelineItemPosition.right : TimelineItemPosition.left,
        isFirst: i == 0,
        isLast: i == listData.length,
        iconBackground: doodle.iconBackground,
        icon: doodle.icon
        );
  }
}