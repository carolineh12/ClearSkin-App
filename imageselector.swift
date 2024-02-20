import SwiftUI

struct ImageSelectorView: View {
    @State private var selectedImage: String? = nil
    @State private var isImagePickerPresented: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                Spacer()

                if let image = selectedImage {
                    NavigationLink(destination: DetailView(imageName: image), tag: image, selection: $selectedImage) {
                        EmptyView()
                    }
                    .isDetailLink(false)

                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .padding()
                        .onTapGesture {
                            selectedImage = image
                        }
                }

                Button("Select Image") {
                    isImagePickerPresented.toggle()
                }
                .padding()
                .sheet(isPresented: $isImagePickerPresented) {
                    ImagePicker(selectedImage: $selectedImage)
                }
            }
            .navigationBarTitle("Image Selection")
        }
    }
}

struct DetailView: View {
    var imageName: String

    var body: some View {
        VStack {
            Spacer()

            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
                .padding()

            Spacer()
        }
        .navigationBarTitle(imageName)
    }
}

struct ImageSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ImageSelectorView()
    }
}
