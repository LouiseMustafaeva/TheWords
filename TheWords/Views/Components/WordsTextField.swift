//
//  WordsTextField.swift
//  TheWords
//
//  Created by Louise on 03/11/23.
//

import SwiftUI

struct WordsTextField: View {
    
    @State var word: Binding<String>
    var placeholder: String
    
    var body: some View {
        TextField(placeholder , text: word)
            .font(.title2)
            .padding()
            .background(Color.white)
            .cornerRadius(12)
    }
}
