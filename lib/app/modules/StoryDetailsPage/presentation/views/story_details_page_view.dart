import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../../../../common/dot_loading_widget.dart';
import '../controllers/story_details_page_controller.dart';

class StoryDetailsPageView extends GetView<StoryDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Of Story', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 9, 43, 103))),
      ),
      body: controller.obx(
        (state) => Column(
          children: [
            Expanded(child: Image.asset('assets/images/${state.image}')),
            Expanded(
              child: Obx(() => ListView.builder(
                    shrinkWrap: true,
                    controller: controller.autoScrollController,
                    itemCount: controller.paragraphList.length,
                    itemBuilder: (context, index) {
                      print('assets/images/${state.image}');
                      return AutoScrollTag(
                        key: ValueKey(index),
                        controller: controller.autoScrollController,
                        index: index,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Center(
                            child: Text(
                              controller.paragraphList[index],
                              style: TextStyle(fontSize: index == 0 ? 20 : 15, fontWeight: index == 0 ? FontWeight.bold : FontWeight.normal, color: const Color.fromARGB(255, 9, 43, 103)),
                            ),
                          ),
                        ),
                      );
                    },
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: controller.pauseAudio,
                    child: const Icon(
                      Icons.pause,
                      color: Color.fromARGB(255, 9, 43, 103),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: controller.resumeAudio,
                    child: const Icon(
                      Icons.play_arrow,
                      color: Color.fromARGB(255, 9, 43, 103),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: controller.reloadAudio,
                    child: const Icon(
                      Icons.refresh,
                      color: Color.fromARGB(255, 9, 43, 103),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        onLoading: LoadingWidget(),
        onError: (error) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
