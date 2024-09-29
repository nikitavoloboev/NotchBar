import SwiftUI

extension View {
	func animatedNumbers(value: Double) -> some View {
		self
			.monospacedDigit()
			.contentTransition(.numericText(value: value))
			.animation(.default, value: value)
	}
}
