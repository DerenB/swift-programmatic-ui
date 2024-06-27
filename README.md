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
