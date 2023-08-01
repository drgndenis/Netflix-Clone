# Netflix-Clone
This project is a "Netflix Clone" mobile application developed with Swift and UIKit. The app integrates with the The Movie Database (TMDb) API and the YouTube API to provide images, information, and trailers for popular movies and TV shows. It follows the MVVM (Model-View-ViewModel) design pattern, which enhances modularity, testability, and maintainability.

## Features

1. Discover popular movies and TV shows
2. Detailed information pages for movies and TV shows
3. Watch trailers of movies and TV shows
4. Download and view favorite movies and TV shows
6. See upcoming movies and TV shows
7. Search functionality to find content

## Screenshots

<img width="250" alt="homePage" src="https://github.com/drgndenis/Netflix-Clone/assets/101059619/c33ff3e0-810e-41a9-9908-90ec5d553327">
<img width="250" alt="homePage2" src="https://github.com/drgndenis/Netflix-Clone/assets/101059619/1fa331e8-e34d-4e06-b3e4-e6aacd05f7f2">
<img width="250" alt="upcoming" src="https://github.com/drgndenis/Netflix-Clone/assets/101059619/81f87b18-b924-42e6-b573-bd47d87a4639">
<img width="250" alt="search" src="https://github.com/drgndenis/Netflix-Clone/assets/101059619/3aad42b7-eef0-4739-867c-58422617e7d9">
<img width="250" alt="searching" src="https://github.com/drgndenis/Netflix-Clone/assets/101059619/6f5972d3-9f39-49cd-bc2d-a48f736751f3">
<img width="250" alt="download" src="https://github.com/drgndenis/Netflix-Clone/assets/101059619/23387063-5fdd-48f8-b79c-6fc9617e0a61">
<img width="250" alt="downloads" src="https://github.com/drgndenis/Netflix-Clone/assets/101059619/8bc37900-dff4-4492-9de8-6d603bdbfd2f">
<img width="250" alt="YoutubeApiInDownloads" src="https://github.com/drgndenis/Netflix-Clone/assets/101059619/c5041f87-27c7-49aa-9888-5964d9e74f2f">
<img width="250" alt="YoutubeApiInSearch" src="https://github.com/drgndenis/Netflix-Clone/assets/101059619/6e32b5a1-944e-48b5-86d7-208faa56c156">

## Requirements
iOS 13.0 or later
<br>
Xcode 14.0 or later

## Used Libraries
SDWebImage - Used for image downloading and caching.

## Data Persistence
CoreData - Used for local data storage and management.


## Installation

1. Clone this repository or download it as a zip.
2. Install the required dependencies by running pod install in the project directory via the terminal.
3. Go to The Movie Database (TMDb) API, create an account, and obtain your API key.
4. Go to the YouTube API and create a project to get your YouTube API key.
5. Open the Contents.swift file inside the Services folder and replace the empty strings with your actual API keys:

```swift 
    struct Constants {
    static let API_KEY = "YOUR_TMDB_API_KEY"
    static let baseURL = "https://api.themoviedb.org"
    static let youtubeAPI_KEY = "YOUR_YOUTUBE_API_KEY"
    static let youtubeBaseURL = "https://youtube.googleapis.com/youtube/v3/search?"
    }
```

1. Open Xcode, open NetflixClone.xcworkspace, and run the app on a simulator or a real device.
