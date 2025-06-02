//
//  PlacingToolbarButtonsInExactLocations.swift
//  Navigation
//
//  Created by Marko Zivanovic on 2. 6. 2025..
//

import SwiftUI

struct PlacingToolbarButtonsInExactLocations: View {
    var body: some View {
        NavigationStack {
            Text("NavButton")
                .toolbar {
                    ToolbarItemGroup(placement: .confirmationAction) {
                        Button("Tap me") {
                            //MARK: - Button Action Code
                        }
                        Button("Second tap") {
                            //MARK: - Second Button Action Code 
                        }
                    }
                }
                //.navigationBarBackButtonHidden()
            //MARK: - Two buttons on the same side
//                .toolbar {
//                    ToolbarItem(placement: .confirmationAction) {
//                        Button("Tap me") {
//                            //MARK: - Button Action Code
//                        }
//                        
//                    }
//                }
            
        }
        
    }
}

#Preview {
    PlacingToolbarButtonsInExactLocations()
}
