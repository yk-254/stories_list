import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/dot_loading_widget.dart';
import '../controllers/story_list_page_controller.dart';

class StoryListPageView extends GetView<StoryListPageController> {
  const StoryListPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Of Stories',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 9, 43, 103))),
      ),
      body: controller.obx(
        (stories) => GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: Get.width / 2.3, mainAxisExtent: 230, crossAxisSpacing: 20, mainAxisSpacing: 15),
          padding: EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 20,
          ),
          itemCount: stories?.stories.data.length ?? 0,
          itemBuilder: (context, index) {
            final story = stories?.stories.data[index];
            return InkWell(
              onTap: () {
                Get.toNamed(
                  '/story-details-page',
                  arguments:  story?.storyId ?? 0,
                );
              },
              child: Container(
                  // margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)), color: const Color.fromARGB(255, 222, 225, 226)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Image.asset(
                          'assets/images/${story?.image}',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 15,
                          ),
                          SizedBox(width: 2),
                          Text(
                            story?.starsAverage,
                            style: TextStyle(fontSize: 12, color: const Color.fromARGB(255, 9, 43, 103)),
                          ),
                        ],
                      ),
                      Text(
                        style: TextStyle(fontSize: 12, color: const Color.fromARGB(255, 9, 43, 103)),
                        story?.title ?? '',
                        // style: TextStyle(fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )),
            );
            // return Container(color: Colors.amber,);
          },
        ),
        onLoading: LoadingWidget(),
        onError: (error) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
