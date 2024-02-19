//
//  CameraView.swift
//  ClearSkinProject
//
//  Created by Michelle Li on 2/18/24.
//

import SwiftUI

struct CameraView: View {
    @EnvironmentObject var vm: ViewModel1
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(vm.myImages) { MyImage1 in
                            VStack {
                                Image(uiImage: MyImage1.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                    .shadow(color: .black.opacity(0.6), radius: 2, x: 2, y: 2)
                                Text(MyImage1.name)
                            }
                        }
                    }
                    .padding()
                }
                if let image = vm.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
                }
                else {
                    Image(systemName: "photo.fill")
                        .resizable()
                        .scaledToFit()
                        .opacity(0.6)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding(.horizontal)
                }
                VStack {
                    TextField("Image Name", text: $vm.imageName)
                    { isEditing in vm.isEditing = isEditing
                    }
                    .textFieldStyle(.roundedBorder)
                    HStack {
                        Button {
                            if vm.selectedImage == nil {
                                vm.addMyImage(vm.imageName, image: vm.image!)
                            }
                        } label: {
                            ButtonLabel(symbolName: vm.selectedImage == nil ? "square.and.arrow.down.fill" : "square.and.arrow.down.fill", label: vm.selectedImage == nil ? "Save" : "Update")
                        }
                        .disabled(vm.buttonDisabled)
                        .opacity(vm.buttonDisabled ? 0.6: 1)
                        if !vm.deleteButtonIsHidden {
                            Button {
                                
                            } label: {
                                ButtonLabel(symbolName: "trash", label: "Delete")
                            }
                        }
                    }
                        HStack {
                        
                        Button {
                            vm.source = .camera
                            vm.showPhotoPicker()
                        } label: {
                            ButtonLabel(symbolName: "camera", label: "Camera")
                        }
                        Button {
                            vm.source = .library
                            vm.showPhotoPicker()
                        } label: {
                            ButtonLabel(symbolName: "photo", label: "Photos")
                        }
                    }
                    Spacer()
                    .padding()
                }
                
                .task {
                    if FileManager().docExist(named: fileName) {
                        vm.loadMyImagesJSONFile()
                    }
                }
                
                .sheet(isPresented: $vm.showPicker) {
                    ImagePicker(selectedImage: $vm.image, sourceType: vm.source == .library ? .photoLibrary: .camera)
                        .ignoresSafeArea()
                }
            }
            .navigationTitle("My Images")
        }
        }
    }
    
    struct CameraView_Preview: PreviewProvider {
        static var previews: some View {
            CameraView()
                .environmentObject(ViewModel1())
        }
    }
    
