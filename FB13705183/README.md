# Sheet content doesn't stay centered when programmatically changing detent

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
- Drag the sheet up and down, and notice the button always stays centered.
- Now toggle the selected detent, and notice the button jumps and is no longer always centered.
- I would expect the behavior whether dragging or programmatically setting the selected detent to be the same.

## Evidence
### Visual
| Demo | Workaround |
|:-:|:-:|
| ![Demo GIF](demo.gif) | Unknown |

### Code
https://github.com/GeorgeElsham/AppleFeedback/blob/965cefefdcab8010218c2ffa8dd1f0f219083bc0/FB13705183/demo.swift#L1-L26
