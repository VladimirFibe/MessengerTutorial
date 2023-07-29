import SwiftUI
import PhotosUI

@MainActor
final class ProfileViewModel: ObservableObject {
    @Published var selectedItem: PhotosPickerItem? {
        didSet { Task {  try await loadImage() }}
    }
    @Published var profileImage: Image?
    
    func loadImage() async throws {
        guard let item = selectedItem,
              let data = try await item.loadTransferable(type: Data.self),
              let uiImage = UIImage(data: data) else { return }
        self.profileImage = Image(uiImage: uiImage)
    }
}
