import SwiftUI

private enum Constants {
    static let shadowRadius: CGFloat = 20
    static let shadowOpacity: CGFloat = 0.67
    static let menuBarFrameWidth: CGFloat = 458
    static let menuBarFrameHeight: CGFloat = 36
}

struct AppView: View {
    var body: some View {
        VStack(spacing: 0) {
            NotchView()
            MainContentView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

private struct NotchView: View {
    var body: some View {
        if SystemState.shared.isMenuBarHidden,
            let notch = NSScreen.builtIn.notch
        {
            HStack {
                Spacer()
                if !AppState.shared.todo.isEmpty {
                    Text(AppState.shared.todo)
                        .lineLimit(1)
                        .foregroundStyle(.gray)
                }
            }
            .frame(height: notch.height)
            .padding(.horizontal)
            .background(.black)
            .environment(\.colorScheme, .dark)
        }
    }
}

private struct MainContentView: View {
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        Group {
            if NSScreen.builtIn.notch == nil {
                NoNotchView()
            } else if !SystemState.shared.isMenuBarHidden {
                MenuBarHiddenView()
            } else {
                AppState.shared.card?.view
            }
        }
        .background(.background)
        .roundedCorners(color: .gray.opacity(0.4))
        .shadow(
            color: colorScheme == .dark
                ? .black.opacity(Constants.shadowOpacity) : .gray,
            radius: Constants.shadowRadius
        )
        .padding([.horizontal, .bottom], 10)
        .padding()
    }
}

private struct NoNotchView: View {
    var body: some View {
        HStack {
            HStack(spacing: 0) {
                Text("NotchBar").bold()
                Text(" requires a screen with a notch.")
            }
            Button("Quit App", role: .destructive) {
                NSApp.terminate(self)
            }
        }
        .padding()
    }
}

private struct MenuBarHiddenView: View {
    @State private var size: CGSize = .zero

    var body: some View {
        VStack {
            titleRow
            MenuBarSettingsView(size: size)
        }
        .padding()
    }

    private var titleRow: some View {
        HStack {
            Text("NotchBar").bold()
                + Text(" is hidden under the macOS menu bar.")
            Spacer()
            Button("Change Setting", role: .destructive) {
                openSystemPreferences()
            }
        }
        .frame(maxWidth: size.width)
    }

    private func openSystemPreferences() {
        if let url = URL(
            string:
                "x-apple.systempreferences:com.apple.ControlCenter-Settings.extension"
        ) {
            NSWorkspace.shared.open(url)
        }
    }
}

private struct MenuBarSettingsView: View {
    let size: CGSize

    var body: some View {
        HStack {
            Text("Automatically hide and show the menu bar")
                .frame(maxWidth: .infinity, alignment: .leading)
            settingsIndicator
        }
        .padding(.horizontal, 10)
        .frame(
            width: Constants.menuBarFrameWidth,
            height: Constants.menuBarFrameHeight
        )
        .background(.quinary)
        .roundedCorners()
        .onSizeChange(sync: .constant(size))
    }

    private var settingsIndicator: some View {
        HStack(spacing: 4) {
            Text(SystemState.shared.menuBarAutoHide.rawValue)
            Image(systemSymbol: .chevronUpChevronDown)
                .padding(2)
                .background(.quaternary.opacity(0.6))
                .roundedCorners(4)
        }
    }
}

#Preview {
    AppView()
}
