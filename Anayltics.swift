//
//  Anayltics .swift
//  ClearSkin
//
//  Created by Disha Patel on 2/12/24.
//

import Foundation
import SwiftUI
import Charts

struct Bar:Identifiable{
    let id = UUID()
    var name : String
    var day : String
    var value : Double
    var color : Color
    
    static var sampleBars: [Bar]{
        var tempBars = [Bar]()
        var color: Color = .green
        let days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
        
        for i in 1...7{
            let rand = Double.random(in: 0...15)
            
            if rand >= 12{
                color = Color("periwinkle")
            }
            else if rand > 5{
                color = Color("lightblue")
            }
            else{
                color = Color("babyblue")
            }
            
            let bar = Bar(name: "\(i)", day: days[i-1], value: rand, color: color)
            tempBars.append(bar)
        }
        return tempBars
    }
}


struct Anayltics : View {
    @State private var bars = Bar.sampleBars
    @State private var selectedID: UUID = UUID()
    @State private var text = "ACNE-NALYTICS"
    
        
    var body: some View{
        VStack{
            Button("Alert \nYou need to update your progress image. \nTell me more >"){
                
            }
                .frame(width: 320)
                .foregroundColor(.black)
                .font(.system(size: 14))
                .padding()
                .background(Color("lightblue"))
                .cornerRadius(15)
            Button("Skin Score \nBased on your overview skin \ntracking, your score is 78 and \nconsider good... \nTell me more >"){
                
            }
                .frame(width: 320)
                .foregroundColor(.black)
                .font(.system(size: 14))
                .padding()
                .background(Color("periwinkle"))
                .cornerRadius(15)

            Text(text)
                .bold()
                .font(.system(size: 12))
                .padding()
            HStack(alignment: .bottom){
                ForEach(bars) { bar in
                    VStack{
                        ZStack{
                            Rectangle()
                                .foregroundColor(bar.color)
                                .frame(width: 35, height: (10*bar.value), alignment:
                                        .bottom)
                                .cornerRadius(40)
                                .opacity(selectedID == bar.id ? 0.8 : 1.0)
                                .onTapGesture{
                                    self.selectedID = bar.id
                                    self.text = "Value: \(Int(bar.value))"
                                        
                                }
                            Text("\(Int(bar.value))")
                                .foregroundColor(.white)
                        }
                        Text(bar.day)
                    }
                }
            }.frame(width: 320, height: 200, alignment: .bottom)
                .padding(20)
                .background(.thinMaterial)
                .cornerRadius(20)
                
            Button("Refresh"){
                    withAnimation{
                        self.bars = Bar.sampleBars
                    }
                }
                .padding()
                //Spacer()
            
                Text("TRE-ACNE-MENTS")
                    .bold()
                    .font(.system(size: 12))
            
                Button("Edit"){
                    
                }
                .foregroundColor(Color("midblue"))
                .font(.system(size: 12))
                .frame(width: 70, height: 50)
                .background(.white)
                .cornerRadius(30)
            
                Button("Benzoyl Peroxide"){
                    
                }
                .foregroundColor(.white)
                .frame(width: 350, height: 50)
                .background(Color("periwinkle"))
                .cornerRadius(15)
            
                Button("Retinol"){
                    
                }
                .foregroundColor(.white)
                .frame(width: 350, height: 50)
                .background(Color("periwinkle"))
                .cornerRadius(15)
                
            
        }
    }
        
}

struct Anayltics_Previews : PreviewProvider {
    static var previews : some View {
        Anayltics()
    }
}

