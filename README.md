# 🛍 iExpense 💵
Yet another simple app. This app tracks your personal and business expenses and presents them using a simple user interface.

## 📺 Demo 📺
![peKPYgArFl](https://user-images.githubusercontent.com/64978825/88048001-750c9a00-cb4a-11ea-9cc0-e97bede66ea6.gif)

## Project plan and journey
The goal of this small project was to gain a new understanding of using lists that remove rows, present a second UI screen and save and load user data. Making the first UI page and second UI page was not difficult however I stumbled across an issue, "How do I save user input so that when the user reloads the app at a later date, their data is still present". Enter `UserDefaults`, `UserDefaults` is an interface to the user's default database which stores key-value pairs persistently across launches of your app ( [Apple documentation](https://developer.apple.com/documentation/foundation/userdefaults)).

Essential this interface attaches any type such as `Strings`, `Int`, `Arrays`  to a string name, usually referred to as a key. Use the same key to read data back out of `UserDefaults`
For example, the sample code demonstrated here shows all this comes together 
```Swift
// Storing tapCount data into key called "Tap"
UserDefaults.standard.set(self.tapCount, forKey: "Tap")

// Reading data back
@State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
```
