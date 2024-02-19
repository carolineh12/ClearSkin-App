//
//  CameraView + Extension.swift
//  ClearSkinProject
//
//  Created by Michelle Li on 2/19/24.
//

import SwiftUI

extension CameraView {
    var imageScroll: some View {
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
                    .onTapGesture {
                        vm.display(MyImage1)
                    }
                }
            }
        } .padding(.leading)
    }
    
    var selectedImage: some View {
        Group {
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
        }
    }
    
    var editGroup: some View {
        Group {
            TextField("Image Name", text: $vm.imageName)
            { isEditing in vm.isEditing = isEditing
            }
            .focused($nameField, equals: true)
            .textFieldStyle(.roundedBorder)
            HStack {
                Button {
                    if vm.selectedImage == nil {
                        vm.addMyImage(vm.imageName, image: vm.image!)
                    } else {
                        vm.updateSelected()
                        nameField = false
                    }
                } label: {
                    ButtonLabel(symbolName: vm.selectedImage == nil ? "square.and.arrow.down.fill" : "square.and.arrow.down.fill", label: vm.selectedImage == nil ? "Save" : "Update")
                }
                .disabled(vm.buttonDisabled)
                .opacity(vm.buttonDisabled ? 0.6: 1)
                if !vm.deleteButtonIsHidden {
                    Button {
                        vm.deleteSelected()
                    } label: {
                        ButtonLabel(symbolName: "trash", label: "Delete")
                    }
                }
            }
        }
    }
    
    var pickerButton: some View {
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
    }
}
