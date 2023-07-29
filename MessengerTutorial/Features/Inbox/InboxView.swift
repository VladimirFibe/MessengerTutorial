import SwiftUI

struct InboxView: View {
    @State private var showNewMessage = false
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
                        Image(systemName: "person.circle.fill")
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
        }
    }
}

struct InboxView_Previews: PreviewProvider {
    static var previews: some View {
        InboxView()
    }
}
