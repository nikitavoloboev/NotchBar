import AppKit

func QuitWithLog(_ message: String, sender: Any? = nil) {
	
	// Log Message
	print(message)
	
	// Quit App
	NSApplication.shared.terminate(sender)
}
