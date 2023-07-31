# Netflix-Clone
This project is a "Netflix Clone" mobile application developed with Swift and UIKit. The app integrates with the The Movie Database (TMDb) API and the YouTube API to provide images, information, and trailers for popular movies and TV shows. It follows the MVVM (Model-View-ViewModel) design pattern, which enhances modularity, testability, and maintainability.

## Features

Discover popular movies and TV shows
Detailed information pages for movies and TV shows
Watch trailers of movies and TV shows
Save and view favorite movies and TV shows
Search functionality to find content

## Requirements
iOS 13.0 or later

## Installation

1. Clone this repository or download it as a zip.
2. Install the required dependencies by running pod install in the project directory via the terminal.
3. Go to The Movie Database (TMDb) API, create an account, and obtain your API key.
4. Go to the YouTube API and create a project to get your YouTube API key.
5. Create a file named Keys.plist in the project's root directory and add your API keys as follows:

```html 
    <key>TMDB_API_KEY</key>
    <string>YOUR_TMDB_API_KEY</string>
    <key>YOUTUBE_API_KEY</key>
    <string>YOUR_YOUTUBE_API_KEY</string>
```

6. Open Xcode, open NetflixClone.xcworkspace, and run the app on a simulator or a real device.

## Used Libraries
SDWebImage - Used for image downloading and caching.
