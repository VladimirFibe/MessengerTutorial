import SwiftUI

enum ProfileImageSize {
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xLarge
    
    var width: CGFloat {
        switch self {
        case .xxSmall: return 28
        case .xSmall: return 32
        case .small: return 40
        case .medium: return 56
        case .large: return 64
        case .xLarge: return 80
        }
    }
}
struct CircularProfileImageView: View {
    let person: Person
    var size: ProfileImageSize = .xSmall
    var body: some View {
        if let avatar = person.avatar {
            AsyncImage(url: URL(string: avatar)) { image in
                image.resizable()
                    .scaledToFill()
                    .frame(width: size.width, height: size.width)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
            }
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: size.width, height: size.width)
                .clipShape(Circle())
        }
    }
}

struct CircularProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImageView(person: Person.MOCK_PERSON)
    }
}
