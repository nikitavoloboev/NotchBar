import SwiftUI

struct AppView: View {
    private struct Constants {
        static let shadowRadius: CGFloat = 20
        static let shadowOpacity: CGFloat = 0.67
        static let menuBarFrameWidth: CGFloat = 458
        static let menuBarFrameHeight: CGFloat = 36
    }

    @State private var size: CGSize = .zero

    var body: some View {
        VStack(spacing: 0) {
            notchView
            mainContent
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }

    @ViewBuilder
    private var notchView: some View {
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

    @ViewBuilder
    private var mainContent: some View {
        Group {
            if NSScreen.builtIn.notch == nil {
                noNotchView
            } else if !SystemState.shared.isMenuBarHidden {
                menuBarHiddenView
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

    @ViewBuilder
    private var noNotchView: some View {
        HStack {
            Text("NotchBar")
                .bold() + Text(" requires a screen with a notch.")

            Button("Quit App", role: .destructive) {
                NSApp.terminate(self)
            }
        }
        .padding()
    }

    @ViewBuilder
    private var menuBarHiddenView: some View {
        VStack {
            HStack {
                HStack(spacing: 0) {
                    Text("NotchBar")
                        .bold()
                    Text(" is hidden under the macOS menu bar.")
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                Button("Change Setting", role: .destructive) {
                    openSystemPreferences()
                }
            }
            .frame(maxWidth: size.width)

            menuBarSettingsView
        }
        .padding()
    }

    @ViewBuilder
    private var menuBarSettingsView: some View {
        HStack {
            Text("Automatically hide and show the menu bar")
                .frame(maxWidth: .infinity, alignment: .leading)

            HStack(spacing: 4) {
                Text(SystemState.shared.menuBarAutoHide.rawValue)
                Image(systemSymbol: .chevronUpChevronDown)
                    .padding(2)
                    .background(.quaternary.opacity(0.6))
                    .roundedCorners(4)
            }
        }
        .padding(.horizontal, 10)
        .frame(
            width: Constants.menuBarFrameWidth,
            height: Constants.menuBarFrameHeight
        )
        .background(.quinary)
        .roundedCorners()
        .onSizeChange(sync: $size)
    }

    @Environment(\.colorScheme) private var colorScheme

    private func openSystemPreferences() {
        if let url = URL(
            string:
                "x-apple.systempreferences:com.apple.ControlCenter-Settings.extension"
        ) {
            NSWorkspace.shared.open(url)
        }
    }
}

#Preview {
    AppView()
}
