//
//  MainScreenTitleText.swift
//  TheWords
//
//  Created by Louise on 03/11/23.
//

import SwiftUI

struct MainScreenTitleText: View {
    
    @State var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor( Color.orange)
            .padding()
            .font(.custom("AvenirNext-bold", size: 42))
            .frame(maxWidth: .infinity)
            .background(Color("FirstPlayer"))
            .cornerRadius(18)
    }
}

struct MainScreenTitleText_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenTitleText(text: "Машина")  
    }
}
