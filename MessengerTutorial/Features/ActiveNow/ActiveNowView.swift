import SwiftUI

struct ActiveNowView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 32) {
                ForEach(0..<11) { _ in
                    VStack {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 64, height: 64)
                            .foregroundStyle(Color(.systemGray4))
                            
                            .overlay(
                                greenCircle.padding(4)
                                , alignment: .bottomTrailing)
                        Text("Bruce")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                }
            }
            .padding()
        }
        .frame(height: 106)
    }
    var greenCircle: some View {
        ZStack {
            Circle()
                .fill(.white)
                .frame(width: 18)
            Circle()
                .fill(.green)
                .frame(width: 12)
        }
    }
}

struct ActiveNowView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveNowView()
    }
}
