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
    @State private var isAlertPresent = false
    @State var alertText = ""
    
    @State private var show = false
    
    @Environment(\.dismiss) var dismiss
    
    var viewModel: GameViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Button("Game.exit".localized) {
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
                    .shadow(color: viewModel.isFirst ? .red : .clear , radius: 4)
                
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
                    .shadow(color: viewModel.isFirst ? .clear :  .blue, radius: 4)
            }
            
            WordsTextField(word: $word, placeholder: "Game.yourWord".localized)
            
            Button("Game.done".localized) {
                var score = 0
                
                do {
                    try score = viewModel.check(word: word)
                } catch WordError.beforeWord {
                    alertText = "Error.beforeWord".localized
                    isAlertPresent.toggle()
                    
                } catch WordError.shortWord {
                    alertText = "Error.shortWord".localized
                    isAlertPresent.toggle()
                    
                } catch WordError.theSameWord {
                    alertText = "Error.theSameWord".localized
                    isAlertPresent.toggle()
                    
                } catch WordError.wrongWord {
                    alertText = "Error.wrongWord".localized
                    isAlertPresent.toggle()
                    
                } catch {
                    alertText = "Error.undefined".localized
                    isAlertPresent.toggle()
                }
                
                if self.viewModel.words.count == 0 {
                    self.show = false
                } else {
                    self.show = true
                }
                
                if score > 1 {
                    self.word = ""
                }
                
            }.padding()
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                .background(Color("Pink"))
                .cornerRadius(12)
                .padding(.vertical)
                .foregroundColor(Color.white)
                .font(.custom("AvenirNext-Bold", size: 26))
            
            
            if show {
                List {
                    ForEach(0..<self.viewModel.words.count, id: \.description) { item in
                        WordCell(word: self.viewModel.words[item])
                            .background(item % 2 == 0 ? Color("FirstPlayer") : Color("SecondPlayer"))
                            .listRowInsets(EdgeInsets())
                    }
                }
                .listStyle(.plain)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .scrollContentBackground(.hidden)
            }
            Spacer()
        }.padding()
            .background(Color.purple)
            .confirmationDialog("Game.exitConfirmation".localized,
                                isPresented: $confirmPresent,
                                titleVisibility: .visible) {
                Button("Game.exitConfirmationYes".localized, role: .destructive, action: {
                    self.dismiss()
                })
                Button("Game.exitConfirmationCancel".localized, role: .cancel, action: {})
            }.alert(isPresented: $isAlertPresent) { () -> Alert in
                let button = Alert.Button.default(Text("Ok")) {
                    
                }
                return Alert(title: Text(alertText ), message: Text(""), dismissButton: button)
            }
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: GameViewModel(player1: Player(name: "Вася"), player2: Player(name: "Федя"), word: " "))
    }
}
