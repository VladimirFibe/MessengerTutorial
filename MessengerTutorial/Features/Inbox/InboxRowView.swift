import SwiftUI

struct InboxRowView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 12.0) {
            CircularProfileImageView(person: Person.MOCK_PERSON, size: .large)
            VStack(alignment: .leading) {
                Text("Heath Ledger")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text("Some test message for now that spans more than one line")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .lineLimit(2)
            }
            HStack {
                Text("Yesterday")
                Image(systemName: "chevron.right")
            }
            .font(.footnote)
            .foregroundStyle(.gray)
        }
        .frame(height: 72)
    }
}

struct InboxRowView_Previews: PreviewProvider {
    static var previews: some View {
        InboxRowView()
    }
}
