//
//  MyImage.swift
//  ClearSkinProject
//
//  Created by Michelle Li on 2/19/24.
//

import SwiftUI

struct MyImage1: Identifiable, Codable {
    var id = UUID()
    var name: String
    
    var image: UIImage {
        do {
            return try FileManager().readImage(with: id)
        } catch {
            return UIImage(systemName: "photo.fill")!
        }
    }
}
