//
//  TheProblemWithASimpleNavigationLink.swift
//  Navigation
//
//  Created by Marko Zivanovic on 14. 5. 2025..
//

import SwiftUI


struct DetailView: View {
    var number: Int
    
    var body: some View {
        Text("Detail \(number)")
    }
    
    init(number: Int) {
        self.number = number
        print("Create DetailView \(number)")
    }
}

struct TheProblemWithASimpleNavigationLink: View {
    var body: some View {
        NavigationStack {
            List(0..<1000) { i in
                NavigationLink("Tap me") {
                    //Text("Detail View")
                    //DetailView(number:556)
                    DetailView(number: i)
                }
            }
        }
    }
}

#Preview {
    TheProblemWithASimpleNavigationLink()
}
