import SwiftUI

@main
struct MessengerTutorialApp: App {
    var body: some Scene {
        WindowGroup {
            ChatView(person: Person.MOCK_PERSON)
        }
    }
}
