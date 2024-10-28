This Flutter application is designed to display a list of stories and provide detailed information about each story, including audio recordings related to different sections of the story.

## Features
## Story List Page:
This page displays a list of stories retrieved from an API.
Each story item in the list shows the title and relevant information about the story.

## Story Details Page:
When a user taps on a story in the list, they are navigated to the Story Details page.
On this page, the following functionality is implemented:
The story title is displayed, and the corresponding audio recording is automatically played.
After the title audio finishes playing, the story's first paragraph is displayed, and the associated audio recording is automatically played.
This process continues for all paragraphs in the story, where the paragraph is displayed, and the corresponding audio is played.
The page includes the following controls:
## Pause/Play button: 
The user can pause and resume the audio playback.
## Reload button:
When clicked, the audio playback starts from the beginning of the story (title audio) without hiding previously displayed paragraphs.
The page automatically scrolls to the currently displayed paragraph as the audio playback progresses.
Technical Details
## State Management:
The application uses the GetX and StateMixin packages for state management, ensuring a clean and organized codebase.

<Image src="![Screenshot 2024-10-28 221011](https://github.com/user-attachments/assets/3acef8f8-a180-4c5a-9c33-d87b4cdec28f)" width ="300" height="480">   <Image src="![Screenshot 2024-10-28 221117](https://github.com/user-attachments/assets/c9c6ea31-5aae-43f5-b794-037b224d71ad)
" width ="300" height="480"> 
