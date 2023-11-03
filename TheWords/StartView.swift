//
//  ContentView.swift
//  TheWords
//
//  Created by Louise on 03/11/23.
//

import SwiftUI

struct StartView: View {
    
    @State var longWord = ""
    @State var player1 = ""
    @State var player2 = ""
    
    var body: some View {
        
        VStack {
            Text("The Words")
                .foregroundColor( Color.orange)
                .padding()
                .font(.custom("AvenirNext-bold", size: 42))
                .frame(maxWidth: .infinity)
                .background(Color("FirstPlayer"))
                .cornerRadius(18)
            Spacer()
            
            TextField("Введите длинное слово", text: $longWord)
                .font(.title2)
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .padding(.top, 20)
            
            TextField("Игрок 1", text: $player1)
                .font(.title2)
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .padding(.top, 20)

            
            TextField("Игрок 2", text: $player2)
                .font(.title2)
                .padding()
                .background(Color.white)
                .cornerRadius(12)
            
            
            Button("Start") {
                print("Start")
            }.font(.custom("AvenirNext-bold", size: 30))  
                .padding()
                .foregroundColor(Color.white)
                .padding(.horizontal, 64)
                .background(Color("FirstPlayer"))
                .cornerRadius(18)
                .padding(.top, 20)
            Spacer()
            Spacer()
            
        } .padding()
            .background(Color.purple)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
