import SwiftUI

struct ChatView: View {
    let person: Person
    @State private var messageText = ""
    var body: some View {
        VStack {
            List {
                VStack {
                    CircularProfileImageView(person: person, size: .xLarge)
                    Text(person.username)
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                .frame(maxWidth: .infinity)
                
            }
            .listStyle(.plain)
            HStack(alignment: .top) {
                TextField("Message...", text: $messageText, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                Button {
                    
                } label: {
                    Text("Send").bold()
                }

            }
            .padding()
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(person: Person.MOCK_PERSON)
    }
}
