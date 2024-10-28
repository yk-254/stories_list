import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../../data/repository/story_details_repository.dart';

// StoryDetailsController
class StoryDetailsController extends GetxController with StateMixin<dynamic> {
  final AudioPlayer audioPlayer = AudioPlayer();
  var currentParagraphIndex = 0.obs;
  AutoScrollController autoScrollController = AutoScrollController();
  StoryDetailsRepository storyDetailsRepository = StoryDetailsRepository();
  late ConcatenatingAudioSource playlist;
  var paragraphList = [].obs;
  @override
  void onInit() {
    fetchStoryDetails(Get.arguments);
    super.onInit();
  }

  void fetchStoryDetails(storyId) async {
    try {
      change(null, status: RxStatus.loading());
      final storyDetails = await storyDetailsRepository.fetchStoryDetails(storyId);
      change(storyDetails, status: RxStatus.success());
      makingPlayList();
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void updateParagraphList() {
    if (currentParagraphIndex.value == 0) {
      paragraphList.add(
        state?.storyContent.title ?? '',
      );
    } else {
      paragraphList.add(
        state?.storyContent.paragraphs[currentParagraphIndex.value - 1].text ?? '',
      );
    }
  }

  void makingPlayList() async {
    if (state != null && state?.storyContent.paragraphs.isNotEmpty) {
      playlist = ConcatenatingAudioSource(
        useLazyPreparation: true,
        children: [],
      );
      if (currentParagraphIndex.value == 0) {
        await playlist.add(AudioSource.uri(Uri.parse(state?.storyContent.titleVoiceUrl)));
      }
      for (final paragraph in state!.storyContent.paragraphs) {
        await playlist.add(AudioSource.uri(Uri.parse(paragraph.voiceUrl)));
      }
      playAudio();
    }
  }

  void playAudio() async {
    // if (!isPlaying) {
    try {
      await audioPlayer.setAudioSource(playlist, initialIndex: 0, initialPosition: Duration.zero);
      audioPlayer.play();
      audioPlayer.currentIndexStream.listen((index) {
        if (index! > currentParagraphIndex.value || ((index == currentParagraphIndex.value) && (index == 0))) {
          currentParagraphIndex.value = index;
          updateParagraphList();
        }
        scrollToIndex(index);
      });
    } catch (e) {
      // handle errors here
      print('Error playing audio: $e');
    }
    // }
  }

  void pauseAudio() {
    audioPlayer.pause();
  }

  void resumeAudio() {
    audioPlayer.play();
  }

  void reloadAudio() {
    audioPlayer.seek(Duration.zero);
    playAudio();
  }

  void scrollToIndex(index) {
    autoScrollController.scrollToIndex(index, preferPosition: AutoScrollPosition.begin);
  }

  @override
  void onClose() {
    audioPlayer.dispose();
    autoScrollController.dispose();
    super.onClose();
  }
}
