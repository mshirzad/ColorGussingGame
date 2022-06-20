//
//  ContentView.swift
//  GuessTheColor
//
//  Created by Mati Shirzad on 2/28/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var rTarget = Double.random(in: 0..<1)
    @State var gTarget = Double.random(in: 0..<1)
    @State var bTarget = Double.random(in: 0..<1)
    
    @State var rGuess: Double
    @State var gGuess: Double
    @State var bGuess: Double
    
    @State var showScore:Bool = false
    
    var body: some View {
        VStack{
            Text("Guess The Color")
                .font(.title)
                .bold()
            HStack{
                VStack{
                    Color(red: rTarget, green: gTarget, blue: bTarget)
                        .frame(width: 180, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Text("Match this")
                }
                VStack{
                    Color(red: rGuess, green: gGuess, blue: bGuess)
                        .frame(width: 180, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Text("R: \(Int(rGuess * 255.0))"
                      + "  G: \(Int(gGuess * 255.0))"
                      + "  B: \(Int(bGuess * 255.0))")

                }
                
            }
            Button("I'm Done!"){
                showScore = true
            }.alert(isPresented: $showScore, content: {
                Alert(title: Text("GOOD GUESS"), message: Text("Color \(String(computeScore())) % Matched."), dismissButton: .default(Text("OK"), action:{
                    changeColor()
                }))
            })
            .padding()
            
            ColorSlider(value: $rGuess, textColor: .red)
            ColorSlider(value: $gGuess, textColor: .green)
            ColorSlider(value: $bGuess, textColor: .blue)
        }
    }
    
    func computeScore() -> Int {
      let rDiff = rGuess - rTarget
      let gDiff = gGuess - gTarget
      let bDiff = bGuess - bTarget
      let diff = sqrt(rDiff * rDiff + gDiff * gDiff + bDiff * bDiff)
      return Int((1.0 - diff) * 100.0 + 0.5)
    }
    
    func changeColor(){
        rTarget = Double.random(in: 0..<1)
        gTarget = Double.random(in: 0..<1)
        bTarget = Double.random(in: 0..<1)
        
        rGuess = 0.5
        gGuess = 0.5
        bGuess = 0.5
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(rGuess: 0.5, gGuess: 0.5, bGuess: 0.5)
    }
}

struct ColorSlider: View {
    @Binding var value: Double
    var textColor: Color
    var body: some View {
        HStack{
            Text("0").foregroundColor(textColor)
                .padding()
            Slider(value: $value)
            Text("255").foregroundColor(textColor)
                .padding()
        }
    }
}
