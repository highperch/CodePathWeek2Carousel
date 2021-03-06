# CodePathWeek2Carousel
CodePath Week 2 Assignment
Carousel App Demo

This is a walkthrough of the iOS Carousel App for Week 2's assignment.

Time spent: 14.5 hours spent in total

Completed user stories:

 * [x] Static photo tiles on the initial screen
 * [x] Optional: Photo tiles move with scrolling
 * [x] Sign In
  * [x] Tapping on email/password reveals the keyboard and shifts the scrollview and Sign In button up.
 * [x]  Upon tapping the Sign In button.
    * [x] If the username or password fields are empty, user sees an error alert.
    * [x] If credentials are incorrect, user sees a loading indicator for 2 seconds followed by an error alert.
    * [x] If the credentials are correct, user sees a loading indicator for 2 seconds followed by a transition to the Sign In screens.
  *  [x] Optional: When the keyboard is visible, if the user pulls down on the scrollview, it will dismiss the keyboard.
  *  [x] Optional: On appear, scale the form up and fade it in.
 * [x] Optional: Create a Dropbox
 *   [x] Optional: Tapping in the form reveals the keyboard and shifts the scrollview and "Create a Dropbox" button up.
 *   [x] Optional: Tapping the Agree to Terms checkbox selects the checkbox.
 *   [x] Optional: Tapping on Terms shows a webview with the terms.
 *   [x] Optional: User is taken to the tutorial screens upon tapping the "Create a Dropbox" button.
 * [x] Tutorial Screens
 *   [x] User can page between the screens
 *   [x] Optional: User can page between the screens with updated dots
 *   [x] Optional: Upon reaching the 4th page, hide the dots and show the "Take Carousel for a Spin" button.
 * [x] Image Timeline
  * [x] Display a scrollable view of images.
  * [x] User can tap on the conversations button to see the conversations screen (push).
  * [x] User can tap on the profile image to see the settings view (modal from below).
 * [x] Conversations
  * [x] User can dismiss the conversations screen
 * [x] Settings
  * [x] User can dismiss the settings screen.
  * [x] User can log out
  * [x] Optional: Tapping the Sign Out button presents a UIAlertController that gives options to Sign Out or Cancel Using UIAlertController
   * [x] Tapping the Cancel option dismisses the UIAlertController
   * [x] Tapping the Sign Out returns the user to the NavigationController of the Intro screen
 * [x] Optional: Learn more about Carousel
  * [x] Optional: Show the "Learn more about Carousel" button in the photo timeline.
  * [x] Optional: Tap the X to dismiss the banner
  * [x] Optional: Track the 3 events:
    * [x] View a photo full screen
    * [x] Swipe left and right
    * [x] Share a photo
  * [x] Optional: Upon completion of the events, mark them green.
  * [x] Optional: When all events are completed, dismiss the banner.

Notes:
Added a Navigation Controller embed to timeline to make push to conversations work.
When signing out I instantiated a Navigation Controller instead of using a manually triggered modal segue.

Walkthrough of all user stories:

![week 2 walkthrough gif] (https://cloud.githubusercontent.com/assets/3476345/13025268/0c06ba1c-d1b8-11e5-86ba-ca8a451dbb55.gif)

GIF created with LiceCap.
