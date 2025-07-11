//
//  NavigatingToDifferentDataTypesUsingNavigationPath.swift
//  Navigation
//
//  Created by Marko Zivanovic on 17. 5. 2025..
//

import SwiftUI

struct NavigatingToDifferentDataTypesUsingNavigationPath: View {
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(0..<5) { i in
                    NavigationLink("Select number: \(i)", value: i)
                }
                
                ForEach(0..<5) { i in
                    NavigationLink("Select String: \(i)", value: String(i))
                }
            }
            .toolbar {
                Button("Push 556") {
                    path.append(556)
                }
                Button("Push Hello") {
                    path.append("Hello")
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected the number \(selection)")
            }
            
            .navigationDestination(for: String.self) { selection in
                Text("You selected the string \(selection)")
            }
        }
    }
}

#Preview {
    NavigatingToDifferentDataTypesUsingNavigationPath()
}
