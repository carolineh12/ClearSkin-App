// Settings.swift

import SwiftUI

struct Settings: View {
  let skinType = [""]
  var body: some View {
    TabView {
      SettingsView()
          .tabItem {
              Label("Name", systemImage: "circle.fill(.blue)")
          }
    NavigationView {
        List {
          Section
          {
            Text("Skin Goals")
            Text("Plan 1")
            .multilineTextAlignment(.right).italic()
          }
          Section
          {
            Text("Age")
            Text("22")
            .multilineTextAlignment(.right).italic()
          }
          Section
          {
            Text("Gender")
            Text("Female")
            .multilineTextAlignment(.right).italic()
          }
          Section
          {
            Text("Race")
            Text("Enter Race")
            .multilineTextAlignment(.right).italic()
          }
          Section
          {
            Text("Skin Type")
            Text("Dry")
            .multilineTextAlignment(.right).italic()
          }
          Section
          {
            Text("Notifications")
            Toggle("Enable Notifications", isOn: $notificationsEnabled)
          }
          Button(action: signOut)
          {
            Label("Sign Out").foregroundColor(.red)
            UserDefaults.standard.removeObject(forKey: "userLoggedIn")
          }
        }
        .listStyle(.insetGrouped)
        .navigationTitle("ClearSkin")
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
