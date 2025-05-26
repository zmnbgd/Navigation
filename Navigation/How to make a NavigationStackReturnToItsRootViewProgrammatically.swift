//
//  How to make a NavigationStackReturnToItsRootViewProgrammatically.swift
//  Navigation
//
//  Created by Marko Zivanovic on 19. 5. 2025..
//

import SwiftUI

@Observable
class PathStore {
    var path: [Int] {
        didSet {
            save()
        }
    }
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
}

struct DetailView1: View {
    var number: Int
//    @Binding var path: [Int]
    @Binding var path: NavigationPath
    
    var body: some View {
        NavigationLink("Go to Random NUmber", value: Int.random(in: 0...1000))
            .navigationTitle("Number \(number)")
            .toolbar {
                Button("Home") {
                    //path.removeAll()
                    path = NavigationPath()
                }
            }
    }
}

struct How_to_make_a_NavigationStackReturnToItsRootViewProgrammatically: View {
    
//    @State private var path = [Int]()
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            DetailView1(number: 0, path: $path)
                .navigationDestination(for: Int.self) { i in
                    DetailView1(number: i, path: $path)
                }
        }
    }
}

#Preview {
    How_to_make_a_NavigationStackReturnToItsRootViewProgrammatically()
}
