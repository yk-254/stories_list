This Flutter application is designed to display a list of stories and provide detailed information about each story, including audio recordings related to different sections of the story.

## Features
## Story List Page:
This page displays a list of stories retrieved from an API.
Each story item in the list shows the title and relevant information about the story.

## Story Details Page:
Users are navigated to the Story Details page when they tap on a story on the list.
On this page, the following functionality is implemented:
The story title is displayed, and the corresponding audio recording is automatically played.
After the title audio finishes playing, the story's first paragraph is displayed, and the associated audio recording is automatically played.
This process continues for all paragraphs in the story, where the paragraph is displayed, and the corresponding audio is played.
The page includes the following controls:
## Pause/Play button: 
The user can pause and resume the audio playback.
## Reload button:
When clicked, the audio playback starts from the story's beginning (title audio) without hiding previously displayed paragraphs.
The page automatically scrolls to the currently displayed paragraph as the audio playback progresses.
Technical Details
## State Management:
The application uses the GetX and StateMixin packages for state management, ensuring a clean and organized codebase.

![sc1](https://github.com/user-attachments/assets/05eb64c3-04e7-4ace-87e8-cbb1765c80f9)

![sc2](https://github.com/user-attachments/assets/6450134d-a812-4c93-96ee-57f6113bf1ba)

