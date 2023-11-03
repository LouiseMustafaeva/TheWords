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
            MainScreenTitleText(text: "The Words")
            Spacer()
            
            WordsTextField(word: $longWord, placeholder: "Enter a long word")
                .padding(.top, 20)
            
            WordsTextField(word: $player1, placeholder: "Player 1")
                .padding(.top, 20)

            WordsTextField(word: $player2, placeholder: "Player 2")
            
            
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
        } .padding()
            .background(Color.purple)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
