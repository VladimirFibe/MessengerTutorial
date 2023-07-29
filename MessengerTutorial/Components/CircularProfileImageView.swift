import SwiftUI

struct CircularProfileImageView: View {
    let person: Person
    var width = 32.0
    var body: some View {
        if let avatar = person.avatar {
            AsyncImage(url: URL(string: avatar)) { image in
                image.resizable()
                    .scaledToFill()
                    .frame(width: width, height: width)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
            }
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: width, height: width)
                .clipShape(Circle())
        }
    }
}

struct CircularProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImageView(person: Person.MOCK_PERSON)
    }
}
