import SwiftUI
import PhotosUI

struct ProfileView: View {
    @ObservedObject var viewModel = ProfileViewModel()
    let person: Person
    var body: some View {
        VStack {
            header
            sections
        }
    }
    
    var sections: some View {
        List {
            Section {
                ForEach(SettingsOptionsViewModel.allCases) { option in
                    HStack {
                        Image(systemName: option.image)
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(.white, option.color)
                        Text(option.title)
                            .font(.subheadline)
                    }
                }
            }
            Section {
                Button("Log Out", role: .destructive){}
                Button("Delte Account", role: .destructive){}
            }
        }
    }
    
    var header: some View {
        VStack {
            PhotosPicker(selection: $viewModel.selectedItem) {
                Group {
                    if let image = viewModel.profileImage {
                        image.resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                    } else {
                        CircularProfileImageView(person: person, width: 80)
                    }
                }
                
            }
            Text(person.username)
                .font(.title2)
                .fontWeight(.semibold)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(person: Person.MOCK_PERSON)
    }
}
