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
    @State var isShowedGameScreen = false
    @State var isAlertPresented = false
    
    var body: some View {
        
        VStack {
            MainScreenTitleText(text: "The Words")
            Spacer()
            
            WordsTextField(word: $longWord, placeholder: L10n.Authorization.word)
                .padding(.top, 20)
            
            WordsTextField(word: $player1, placeholder: L10n.Authorization.player1)
                .padding(.top, 20)

            WordsTextField(word: $player2, placeholder: L10n.Authorization.player2)
            
            
            Button(L10n.Authorization.start) {
                
                if longWord.count > 7 {
                    isShowedGameScreen.toggle()
                } else {
                    self.isAlertPresented.toggle()
                }
        
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
            .alert(isPresented: $isAlertPresented) { () -> Alert in
                        let button = Alert.Button.default(Text("Ok")) {
                            print("OK Button Pressed")
                        }
                return Alert(title: Text(L10n.Error.shortWord), message: Text(""), dismissButton: button)
             }
        
            .fullScreenCover(isPresented: $isShowedGameScreen ) {
                
                let name1 = player1 == "" ? L10n.Authorization.player1 : player1
                let name2 = player2 == "" ? L10n.Authorization.player2 : player2
                
                let player1 = Player(name: name1)
                let player2 = Player(name: name2 )
                
                let viewModel = GameViewModel(player1: player1, player2: player2, word: longWord)
                
                GameView( viewModel: viewModel)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
