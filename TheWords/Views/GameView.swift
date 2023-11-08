//
//  GameView.swift
//  TheWords
//
//  Created by Louise on 03/11/23.
//

import SwiftUI

struct GameView: View {
    
    @State var word = ""
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Button("Exit") {
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
            
    
            Text("Терапия")
                .font(.custom("AvenirNext-Bold", size: 40))
                .foregroundColor(.white)
            
            HStack(spacing: 12) {
                VStack {
                    Text("0")
                        .font(.custom("AvenirNext-Bold", size: 60))
                        .foregroundColor(.white)
                    Text("Вася")
                        .font(.custom("AvenirNext-Bold", size: 24))
                        .foregroundColor(.white)
                }.padding(20)
                    .frame(width: screen.width / 2.2, height: screen.width / 2.2)
                    .background(Color("FirstPlayer"))
                    .cornerRadius(12)
                    .shadow(color: .purple, radius: 4)
                
                
                VStack {
                    Text("0")
                        .font(.custom("AvenirNext-Bold", size: 60))
                        .foregroundColor(.white)
                    Text("Вася")
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
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
