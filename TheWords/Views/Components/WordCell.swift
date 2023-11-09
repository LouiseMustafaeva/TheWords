//
//  WordCell.swift
//  TheWords
//
//  Created by Louise on 09/11/23.
//

import SwiftUI

struct WordCell: View {
    
    let word: String
    
    var body: some View {
        HStack {
            Text(word)
                .foregroundColor(.white)
                .listRowSeparator(.hidden)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .font(.custom("AvenirNext-bold", size: 22))
            Text("\(word.count)")
                .font(.custom("AvenirNext-bold", size: 22))
                .foregroundColor(.white)
        }.padding(.horizontal)
    }
}

struct WordCell_Previews: PreviewProvider {
    static var previews: some View {
        WordCell(word: "")
    }
}
