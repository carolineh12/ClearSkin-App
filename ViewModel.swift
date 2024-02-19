//
//  ViewModel.swift
//  ClearSkinProject
//
//  Created by Michelle Li on 2/18/24.
//
import SwiftUI

class ViewModel: ObservableObject {
    @Published var image: UIImage?
    @Published var showPicker = false
    @Published var source: Picker.Source = .library
    
}
