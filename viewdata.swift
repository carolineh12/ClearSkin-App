import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // First Row
            HStack {
                GridItemView(label: "Open Comedones")
                GridItemView(label: "Closed Comedones")
            }

            // Second Row
            HStack {
                GridItemView(label: "Pustules")
                GridItemView(label: "Papules")
            }

            // Third Row
            HStack {
                GridItemView(label: "Cysts")
                GridItemView(label: "Scars")
            }
        }
        .padding()
      
    }
}

struct GridItemView: View {
    let label: String
    let number = Int.random(in: 1...10) // need to change to scoring system

    var body: some View {
        VStack {
            Text(label)
            Text("\(number)")
                .font(.headline)
                .fontWeight(.bold)
                .padding()
                .background(Color.blue, .purple)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(8)
    }
}

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
