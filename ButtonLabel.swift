//
//  ButtonLabel.swift
//  ClearSkinProject
//
//  Created by Michelle Li on 2/18/24.
//

import SwiftUI

struct ButtonLabel: View {
    let symbolName: String
    let label: String
    var body: some View {
        let lightBlue = Color(red: 0.75, green: 0.88, blue: 1.0)
        HStack {
            Image(systemName: symbolName)
            Text(label)
                .bold()
        }
        .font(.headline)
        .padding()
        .frame(height: 40)
        .background(lightBlue)
        .foregroundColor(.white)
        .cornerRadius(15)
    }
    
}

struct ButtonLabel_Preview: PreviewProvider {
    static var previews: some View {
        ButtonLabel(symbolName: "camera", label: "Camera")
    }
}
