//
//  MakingYourNavigationTitleEditable.swift
//  Navigation
//
//  Created by Marko Zivanovic on 3. 6. 2025..
//

import SwiftUI

struct MakingYourNavigationTitleEditable: View {
    
    @State private var title = "SwiftUI"
    
    var body: some View {
        NavigationStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

#Preview {
    MakingYourNavigationTitleEditable()
}
