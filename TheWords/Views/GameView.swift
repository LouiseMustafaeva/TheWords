//
//  GameView.swift
//  TheWords
//
//  Created by Louise on 03/11/23.
//

import SwiftUI

struct GameView: View {
    
    @State var word = ""
    @State private var confirmPresent = false
    @Environment(\.dismiss) var dismiss
    
    var viewModel: GameViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Button("Exit") {
                    confirmPresent.toggle()
                    print(("Exit"))
                }.padding(16)
                    .padding(.horizontal)
                    .background(Color("Pink"))
                    .cornerRadius(12)
                    .padding()
                    .foregroundColor(Color.white)
                .font(.custom("AvenirNext-Bold", size: 18))
                Spacer( ) 
            }
            
    
            Text(viewModel.word)
                .font(.custom("AvenirNext-Bold", size: 36 ))
                .foregroundColor(.white)
            
            HStack(spacing: 12) {
                VStack {
                    Text("\(viewModel.player1.score)")
                        .font(.custom("AvenirNext-Bold", size: 60))
                        .foregroundColor(.white)
                    Text(viewModel.player1.name)
                        .font(.custom("AvenirNext-Bold", size: 24))
                        .foregroundColor(.white)
                }.padding(20)
                    .frame(width: screen.width / 2.2, height: screen.width / 2.2)
                    .background(Color("FirstPlayer"))
                    .cornerRadius(12)
                    .shadow(color: .purple, radius: 4)
                
                
                VStack {
                    Text("\(viewModel.player2.score)")
                        .font(.custom("AvenirNext-Bold", size: 60))
                        .foregroundColor(.white)
                    Text(viewModel.player2.name)
                        .font(.custom("AvenirNext-Bold", size: 24))
                        .foregroundColor(.white)
                }.padding(20)
                    .frame(width: screen.width / 2.2, height: screen.width / 2.2)
                    .background(Color("SecondPlayer"))
                    .cornerRadius(12)
                    .shadow(color: .blue, radius: 4)
            }
            
            WordsTextField(word: $word, placeholder: "Your word...")
            
            Button("Done") {
                let score = viewModel.check(word: word)
                if score > 1 {
                    self.word = ""
                }
                print(("Done"))
            }.padding()
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                .background(Color("Pink"))
                .cornerRadius(12)
                .padding(.vertical)
                .foregroundColor(Color.white)
            .font(.custom("AvenirNext-Bold", size: 26))
            
            List {
                
            }.listStyle(.plain)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                            
        }.padding()
            .background(Color.purple)
            .confirmationDialog("Are you sure you want to end the game?",
                                isPresented: $confirmPresent,
                                titleVisibility: .visible) {
                Button("Yes", role: .destructive, action: {
                    self.dismiss()
                })
                Button("Cancel", role: .cancel, action: {})
            }
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: GameViewModel(player1: Player(name: "Вася"), player2: Player(name: "Федя"), word: " "))
    }
}
