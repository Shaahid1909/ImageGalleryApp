
ImageGalleryApp

How to Run the Project

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/Shaahid1909/ImageGalleryApp.git
   ```
2. Open the project in Xcode.
3. Ensure you have the necessary dependencies installed. If using CocoaPods, run:
   ```bash
   pod install
   ```
4. Build and run the app on a simulator or physical device.

Challenges Faced and Solutions

1. Asynchronous Data Fetching
Challenge: Handling network requests and updating the UI without blocking the main thread was a challenge.
Solution: Utilized `async/await` for cleaner, non-blocking code and ensured the UI updates were performed on the main thread.

2. Dynamic and Responsive Layouts
Challenge: Making the grid layout responsive to different screen sizes and orientations.
Solution: Used `UICollectionViewFlowLayout` and Auto Layout to ensure the app was responsive across devices.

3. Image Caching
Challenge: Fetching images from the network could be slow, leading to performance issues.
Solution: Used the `SDWebImage` library for efficient image downloading and caching.

4. Handling Dark Mode and Accessibility
Challenge: Ensuring the app supports dark mode and is accessible to all users.
Solution: Implemented dynamic color support, VoiceOver accessibility, and ensured components adhered to accessibility best practices.

Libraries Used and Reasons

1. SDWebImage: For efficient image downloading and caching. It provides a smooth and responsive user experience by reducing load times.
2. UIKit: Used the native `UIKit` components to build the user interface.

Architecture Choices

The project follows the MVVM (Model-View-ViewModel) architecture:

- Model: Represents the data and network responses (e.g., `ImageModel`).
- View: Represents the user interface components (e.g., `ImageCollectionViewCell`, `ImageGalleryViewController`).
- ViewModel: Handles data manipulation, business logic, and communicates between the view and model (e.g., `ImageGalleryViewModel`).

The choice of MVVM helps to keep the UI layer decoupled from business logic, making the codebase more modular, testable, and scalable.
