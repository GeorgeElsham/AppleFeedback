# Crash when projecting Binding to an unwrapped value

## Basic Information
### Which platform is most relevant for your report?
iOS

### Which technology does your report involve?
SwiftUI

### What type of feedback are you reporting?
Incorrect/Unexpected Behavior

### What build does the issue occur on?
iOS 17.4 Seed 3 (21E5200d)

### Where does the issue occur?
On device

## Description
- Run the given code.
- Try out the picker to change the selection.
- Press "Remove selection" to cause the crash.
- I wouldn't expect this code to crash.

## Evidence
### Visual
| Demo | Workaround |
|:-:|:-:|
| ![Demo GIF](demo.gif) | ![Workaround GIF](workaround.gif) |

### Code
https://github.com/GeorgeElsham/AppleFeedback/blob/de5d7b80b94ccd671eed4c9700f4316bad4471aa/FB13705289/demo.swift#L1-L37

https://github.com/GeorgeElsham/AppleFeedback/blob/de5d7b80b94ccd671eed4c9700f4316bad4471aa/FB13705289/workaround.swift#L1-L47
