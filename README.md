# :red_square: Swift Programmatic UI

Following Sean Allen's course on Webkit

- [Sean Allen Home Page](https://seanallen.teachable.com/courses/)
- [Course Link](https://seanallen.teachable.com/courses/enrolled/681906)

# Table of Contents

1. [Project Setup]()
2. [View Notes]()
3. [Custom Components]()
4. [Keyboard Functions](#keyboardFunctions)

# :red_square: Project Setup

### :small_orange_diamond: Remove Storyboard & References

- Delete: `Main.storyboard`
- Remove references in Info.plis:
  - In file: `Info.plist`, search for Main. Delete line `Storyboard Name`
- Remove reference in Target
  - Main File > Targets > ProjectName > Info > Delete line `Main storyboard file base name`  

### :small_orange_diamond: Add Window View

- Setup in file: `SceneDelegate.swift`
```
func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
  guard let windowScene = (scene as? UIWindowScene) else { return }
        
  window = UIWindow(frame: windowScene.coordinateSpace.bounds)      
  window?.windowScene = windowScene
  window?.rootViewController = ViewController()
  window?.makeKeyAndVisible()
}
```

# :red_square: View Notes

- View Debugger Tool: While App is running, click the stack of cards icon
- Called: "Debug View Hierarchy"

### :small_orange_diamond: Create View

- Created with Cocoa Touch Class
- Subclass of UIViewController

### :small_orange_diamond: Navigation Controller

- Can't show by itself
- Has to show an Array of View Controllers
- The View Controller is where you configure the tab bar titles and icons

# :red_square: Custom Components

### :small_orange_diamond: Buttons

- Created with Cocoa Touch Class
- Subclass of UIButton

### :small_orange_diamond: Text Field

- Created with Cocoa Touch Class
- Subclass of UITextField

# :red_square: Keyboard Functions <a name="keyboardFunctions"></a>

### :small_orange_diamond: Dismiss Keyboard with tap

- When keyboard is open, tap somewhere else on thee screen to close the keyboard
- Call function in `viewDidLoad()` function
```
func createDismissKeyboardTapGesture() {
  let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))      
  view.addGestureRecognizer(tap)
}
```

### :small_orange_diamond: Keyboard Return button

- Can customize what the return button says
- Changed in the UITextField
- Each UITextField can have a different return button label
- Make return say "Go": `returnKeyType = .go`
