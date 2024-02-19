// Settings.swift

import SwiftUI

struct Setting: View {
  @State private var skinGoals = ""
  @State private var age = ""
  @State private var gender = ""
  @State private var race = ""
  @State private var skinType = ""
  @State private var notifications = ""
  var body: some View {
    TabView {
    NavigationView {
        List {
          Section
          {
            Text("Skin Goals")
            TextField("Skin Goals", text: $skinGoals)
                .padding().bold()
            Spacer()
          }
          Section
          {
            Label("Age")
            TextField("Age", text: $age)
                .padding().bold()
            Spacer()
          }
          Section
          {
            Text("Gender")
            TextField("Gender", text: $gender)
                .padding().bold()
            Spacer()
          }
          Section
          {
            Text("Race")
            TextField("Race", text: $race)
                .padding().bold()
            Spacer()
          }
          Section
          {
            Text("Skin Type")
            TextField("Skin Type", text: $skinType)
                .padding().bold()
            Spacer()
          }
          Section
          {
            Text("Notifications")
            TextField("Notifications", text: $notifications)
                .padding().bold()
            Spacer()
          }
          Button(action: {
            // idk sign out
          }) {
            Text("Sign Out")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
          }
          .padding()
        }
        .listStyle(.insetGrouped)
        .navigationTitle("ClearSkin")
      }
    }
  }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        Setting()
    }
}
