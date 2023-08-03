//
//  ContentView.swift
//  AwesomeScrollView
//
//  Created by Nao RandD on 2023/08/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Text("IIKANZI NO SCROLLVIEW")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.horizontal)
                    .padding(.leading, 14)
                    .padding(.top, 30)
                Spacer()
            }
            AwesomeScrollView()
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
