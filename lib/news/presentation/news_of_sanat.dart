


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/constants.dart';
import '../../drawer/drawer.dart';
import '../controller/news_controller.dart';
import '../widgets/news_list.dart';
import '../widgets/news_search.dart';
import '../widgets/tab_bar_news.dart';

class NewsOfSanat extends StatelessWidget {

   NewsOfSanat({Key? key}) : super(key: key);

  NewsController _newsController = Get.put(NewsController());





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        centerTitle: true,
        title: const Text('اخبار',style: TextStyle(fontWeight:FontWeight.w500)),
        backgroundColor: primaryColor,
      ),
      endDrawer:  EndDrawer(),
      body: RefreshIndicator(
        onRefresh: ()=>_newsController.fetchNews(),
        child: Column(
          children: [

            const SizedBox(height: 15,),
            Expanded(child: GetBuilder<NewsController>(builder: (_)=> NewsList(newsList: _newsController.News,),),),
          ],

        ),
      ),
    );
  }
}
