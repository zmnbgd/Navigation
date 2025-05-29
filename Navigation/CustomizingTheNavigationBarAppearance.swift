//
//  CustomizingTheNavigationBarAppearance.swift
//  Navigation
//
//  Created by Marko Zivanovic on 29. 5. 2025..
//

import SwiftUI

struct CustomizingTheNavigationBarAppearance: View {
    var body: some View {
        NavigationStack {
            List(1..<100) { i in
                Text("Row \(i)")
            }
            .navigationTitle("Title goes here")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.blue)
            .toolbarColorScheme(.dark)
            //MARK: - Navbar hidden overlap content system information clock, wifi etc. 
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
    CustomizingTheNavigationBarAppearance()
}
