//
//  CameraView.swift
//  ClearSkinProject
//
//  Created by Michelle Li on 2/18/24.
//

import SwiftUI

struct CameraView: View {
    @EnvironmentObject var vm: ViewModel1
    @FocusState var nameField: Bool
    var body: some View {
        NavigationView {
            VStack {
                if !vm.isEditing {
                    imageScroll
                }
                selectedImage
                VStack {
                    if vm.image != nil {
                        editGroup
                    }
                    if !vm.isEditing {
                        pickerButton
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
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    HStack {
                        Spacer()
                        Button {
                            nameField = false
                        } label: {
                            Image(systemName: "keyboard.chevron.compact.down")
                        }
                    }
                }
            }
        }
        }
    }
    
    struct CameraView_Preview: PreviewProvider {
        static var previews: some View {
            CameraView()
                .environmentObject(ViewModel1())
        }
    }
    
