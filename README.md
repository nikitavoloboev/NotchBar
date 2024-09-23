<div align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="_assets/icon/dark.png">
    <img alt="The NotchBar app icon." src="_assets/icon/light.png" width=256>
  </picture>
  <h1>NotchBar</h1>
</div>

NotchBar is a macOS app designed to utilize the empty space around the notch.

### Before
<img src="_assets/intro/before.png" />

### After
<img src="_assets/intro/after.png" />

## Installation

> Requirements: macOS 14.5 or later

1. Download the [latest release](https://github.com/navtoj/NotchBar/releases/latest) ([.app](https://github.com/navtoj/NotchBar/releases/latest/download/NotchBar.app.zip) or [.dmg](https://github.com/navtoj/NotchBar/releases/latest/download/NotchBar.dmg)) from the [Releases](https://github.com/navtoj/NotchBar/releases) page.
2. Drag the NotchBar app to your Applications folder.
3. Launch NotchBar from your Applications folder or Spotlight.

<!-- ![Install.dmg](_assets/install/dmg.png) -->

> [!TIP]
> ### Can't open `NotchBar.app`?
> 
> <img width="372" alt="Install Popup" src="_assets/install/popup.png">
> 
> **Right click** the `NotchBar` app and **left click** `Open`.[^1]
> 
> <img width="400" alt="Install Solution" src="_assets/install/solution.png">

## Usage

After launching NotchBar, it will automatically cover the notch area of your MacBook.

A _sparkle_ icon will also be shown in the menu bar for important actions.

<img src="_assets/usage/menuBarItem.png" />

> [!TIP]
> ### Can't see the `NotchBar`?
> Make sure it's not being covered by the macOS menu bar.
> 
> **Option 1 —** Set **`Displays have separate Spaces`** option to **`Off`**
> <img alt="Spaces Setting" src="_assets/usage/settingsSpaces.png">
> <br>**Option 2 —** Set **`Automatically hide and show the menu bar`** option to **`Always`**
> <img alt="Menu Bar Setting" src="_assets/usage/settingsMenuBar.png">

## Widgets

<table>
  <tr></tr>
  <tr><th colspan="5" align="left">📊 System Monitor</th></tr>
  <tr><td colspan="5"><img src="_assets/widgets/systemMonitor.png" /></td></tr>
  <tr>
    <td>CPU</td>
    <td>Memory</td>
    <td>Storage</td>
    <td>Battery</td>
    <td>Network</td>
  </tr>
</table>
<table>
  <tr></tr>
  <tr><th colspan="3" align="left">🎵 Media Playback</th></tr>
  <tr><td colspan="3"><img src="_assets/widgets/mediaPlayback.png" /></td></tr>
  <tr>
    <td>Artwork</td>
    <td>Artist</td>
    <td>Track</td>
  </tr>
</table>
<table>
  <tr></tr>
  <tr><th colspan="2" align="left">📱 Active App</th></tr>
  <tr><td colspan="2"><img src="_assets/widgets/activeApp.png" /></td></tr>
  <tr>
    <td>Name</td>
    <td>Icon</td>
  </tr>
</table>

|✨|more coming soon...|
|-|:-|

## Contributing

Contributions to NotchBar are most welcome! Please feel free to submit a Pull Request.

## Building from Source

To build NotchBar from source:

1. Clone the repository: git clone https://github.com/navtoj/NotchBar.git
2. Open `NotchBar.xcodeproj` in Xcode.
3. Build and run the project.

## License

This project is licensed under the [AGPLv3 License](LICENSE).

## Acknowledgments

- [SystemInfoKit](https://github.com/Kyome22/SystemInfoKit) for live system information.
- [SFSafeSymbols](https://github.com/SFSafeSymbols/SFSafeSymbols) for safe usage of SF Symbols.
- [LaunchAtLogin-Modern](https://github.com/sindresorhus/LaunchAtLogin-Modern) for launch at login functionality.
- [Pow](https://github.com/EmergeTools/Pow) for SwiftUI effects.

[^1]: This popup appears because Apple requires a **CAD $119** yearly subscription to remove it.