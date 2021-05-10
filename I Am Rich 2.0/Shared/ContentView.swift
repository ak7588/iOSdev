//
//  ContentView.swift
//  Shared
//
//  Created by Amina on 5/10/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Color(.systemTeal)
        VStack {
            Text("I am rich!")
                .padding()
                .font(.system(size: 40))
            Image(/*@START_MENU_TOKEN@*/"Image Name"/*@END_MENU_TOKEN@*/).resizable().aspectRatio(contentMode: .fit)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.device)
    }
}
