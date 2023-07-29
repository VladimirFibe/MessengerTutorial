import SwiftUI

struct NewMessageView: View {
    @State private var searchText = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            List {
                Text("CONTACTS")
                    .listRowSeparator(.hidden)
                ForEach(0..<10) { _ in
                    HStack {
                        CircularProfileImageView(person: Person.MOCK_PERSON, size: .xSmall)
                        Text("Chandwick Bozeman")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("New Message")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss()}
                }
            }
        }
        .searchable(text: $searchText)
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
            NewMessageView()
    }
}
