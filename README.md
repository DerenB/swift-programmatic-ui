# Swift Programmatic UI

Following Sean Allen's course on Webkit

- [Sean Allen Home Page](https://seanallen.teachable.com/courses/)
- [Course Link](https://seanallen.teachable.com/courses/enrolled/681906)

# Project Setup

### Remove Storyboard & References

- Delete: `Main.storyboard`
- Remove references in Info.plis:
  - In file: `Info.plist`, search for Main. Delete line `Storyboard Name`
- Remove reference in Target
  - Main File > Targets > ProjectName > Info > Delete line `Main storyboard file base name`  

### Add Window View

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

# View Notes

- View Debugger Tool: While App is running, click the stack of cards icon
- Called: "Debug View Hierarchy"

### Create View

- Created with Cocoa Touch Class
- Subclass of UIViewController

### Navigation Controller

- Can't show by itself
- Has to show an Array of View Controllers
- The View Controller is where you configure the tab bar titles and icons

# Custom Components

### Buttons

- Created with Cocoa Touch Class
- Subclass of UIButton

### Text Field

- Created with Cocoa Touch Class
- Subclass of UITextField

# Keyboard Functions

### Dismiss Keyboard with tap

- When keyboard is open, tap somewhere else on thee screen to close the keyboard
- Call function in `viewDidLoad()` function
```
func createDismissKeyboardTapGesture() {
  let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))      
  view.addGestureRecognizer(tap)
}
```

### Keyboard Return button

- Can customize what the return button says
- Changed in the UITextField
- Each UITextField can have a different return button label
- Make return say "Go": `returnKeyType = .go`
