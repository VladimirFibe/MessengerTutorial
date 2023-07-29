import SwiftUI

struct InboxView: View {
    @State private var showNewMessage = false
    @State private var person = Person.MOCK_PERSON
    var body: some View {
        NavigationStack {
            List {
                ActiveNowView()
                    ForEach(0..<10) { _ in
                        InboxRowView()
                    }
            }
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    HStack {
                        avatar
                        Text("Chats")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        showNewMessage.toggle()
                    } label: {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundStyle(.black, Color(.systemGray5))
                    }

                }
                
            }
            .fullScreenCover(isPresented: $showNewMessage) {
                NewMessageView()
            }
            .navigationDestination(for: Person.self) { person in
                ProfileView(person: person)
            }
        }
    }
    var avatar: some View {
        NavigationLink(value: person) {
            CircularProfileImageView(person: person)
        }

    }
}

struct InboxView_Previews: PreviewProvider {
    static var previews: some View {
        InboxView()
    }
}
