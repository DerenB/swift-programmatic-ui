# Swift Programmatic UI

Following Sean Allen's course on Webkit

- [Sean Allen Home Page](https://seanallen.teachable.com/courses/)
- [Course Link](https://seanallen.teachable.com/courses/enrolled/681906)

# Project Creation / Remove Storyboard

- Delete: `Main.storyboard`
- Remove references in Info.plis:
  - In file: `Info.plist`, search for Main. Delete line `Storyboard Name`
- Remove reference in Target
  - Main File > Targets > ProjectName > Info > Delete line `Main storyboard file base name`  
