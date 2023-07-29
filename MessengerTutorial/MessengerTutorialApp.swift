import SwiftUI

@main
struct MessengerTutorialApp: App {
    var body: some Scene {
        WindowGroup {
            ProfileView(person: Person.MOCK_PERSON)
        }
    }
}
