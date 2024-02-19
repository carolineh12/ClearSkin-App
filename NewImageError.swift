//
//  NewImageError.swift
//  ClearSkinProject
//
//  Created by Michelle Li on 2/18/24.
//

import SwiftUI

enum MyImageError: Error, LocalizedError {
    case readError
    case decodingError
    case encodingError
    case saveError
    case readImageError
    
    var errorDescription: String? {
        switch self {
        case .readError:
            return NSLocalizedString("Bad" ,comment: "Oh no")
        case .decodingError:
            return NSLocalizedString("Bad" ,comment: "Oh no")
        case .encodingError:
            return NSLocalizedString("Bad" ,comment: "Oh no")
        case .saveError:
            return NSLocalizedString("Bad" ,comment: "Oh no")
        case .readImageError:
            return NSLocalizedString("Bad" ,comment: "Oh no")
        }
    }
    
    struct ErrorType: Identifiable {
        let id = UUID()
        let error: MyImageError
        var message: String {
            error.localizedDescription
        }
        let button = Button("OK", role: .cancel) {
        }
    }
}
