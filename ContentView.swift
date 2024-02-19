//
//  ContentView.swift
//  LoginScreen
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername: Float = 0
    @State private var wrongPassword: Float  = 0
    @State private var showingLoginScreen = false
    @State private var stackPath : [String] = []

    var body: some View {
        NavigationView {
            ZStack {
                /*
                Color.blue
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                 */
                Image("SplashScreen")
                    .resizable()
                    //.scaledToFit()
                    .frame(width:280, height:280)
                    .position(x:185,y:200)

                VStack {

                    Text("Email")
                        .padding()
                        .foregroundColor(Color.black)
                        .font(.system(size: 14))
                        .position(x:65,y:300)
                    
                    TextField("Email", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(20)
                        .border(.red, width: CGFloat(wrongUsername))
                        .position(x:195,y:235)
                    
                    Text("Password")
                        .padding()
                        .foregroundColor(Color.black)
                        .font(.system(size: 14))
                        .position(x:80,y:180)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(20)
                        .border(.red, width: CGFloat(wrongPassword))
                        .position(x:195,y:115)
                    
                    Text("Forgot Password?")
                        .padding()
                        .foregroundColor(Color("lightblue"))
                        .font(.system(size: 12))
                        .position(x:285,y:60)

                    NavigationLink(destination: Anayltics())
                    {
                        Button("Sign In") {
                                authenticateUser(username: username, password: password)
                                
                                }
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background(Color("lightblue"))
                            .cornerRadius(30)
                            .position(x:195,y:5)
                    }
                    
                    //.navigationBarTitle("Home screen")
                    
                    Text("Don't have an account?")
                        .padding()
                        .foregroundColor(Color.black)
                        .font(.system(size: 12))

                    Button("Sign Up"){
                        authenticateUser(username: username, password: password)
                        if (showingLoginScreen == true) {
                            
                        }
                        
                        }
                        .padding()
                        .foregroundColor(Color("lightblue"))
                        .font(.system(size: 12))

                        .position(x:195,y:5)
                    
                    
                    
                     /*
                    NavigationStack{
                        
                    }
                    .navigationTitle("Home Page")
                    .navigationDestination(for: Int.self) {
                        MySecondScreen()
                    }
                      */
                    
                }
                //.navigate(to: HomeView, when: $showingLoginScreen = true)
            }.navigationBarHidden(true)
        }
    }

    func authenticateUser(username: String, password: String) {
        if username == "Admin" {
            wrongUsername = 0
            if password == "Pass" {
                wrongPassword = 0
                showingLoginScreen = true
                } else {
                wrongPassword = 2
            }
        } else {
            wrongUsername = 2
        }
    }
}

/*
struct MySecondScreen: View {
    var body: some View {
        let value : Int
        
        init(value : Int) {
            self.value = value
            print("Home page is here")
        }
        
    }
}
 */
struct HomeView : View {
    let data: String
    
    var body : some View {
    
    Text(data)
    }
    //.navigationBarTitle("Second Screen")
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


