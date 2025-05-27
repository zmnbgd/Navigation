//
//  How to make a NavigationStackReturnToItsRootViewProgrammatically.swift
//  Navigation
//
//  Created by Marko Zivanovic on 19. 5. 2025..
//

import SwiftUI

@Observable
class PathStore {
    //var path: [Int] {
    var path: NavigationPath {
        didSet {
            save()
        }
    }
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
//    init() {
//        if let data = try? Data(contentsOf: savePath) {
//           if let decoded = try? JSONDecoder.decode([Int].self, from: data) {
//            path = decoded
//            return
//            
//           }
//        }
//        
//        path = []
//    }
    
    let decoder = JSONDecoder()
    init() {
        if let data = try? Data(contentsOf: savePath) {
            //if let decode = try? decoder.decode([Int].self, from: data) {
            if let decode = try? decoder.decode(NavigationPath.CodableRepresentation.self, from: data) {
                //path = decode
                path = NavigationPath(decode)
                return
            }
        }
        //path = []
        path = NavigationPath()
    }
    
    func save() {
        
        guard let representation = path.codable else { return }
        
        do {
            //let data = try JSONEncoder().encode(path)
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            print("failed to save navigation data")
        }
    }
    
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
    //@State private var path = NavigationPath()
    @State private var pathStore = PathStore()
    var body: some View {
        //NavigationStack(path: $path) {
        NavigationStack(path: $pathStore.path) {
            //DetailView1(number: 0, path: $path)
            DetailView1(number: 0, path: $pathStore.path)
                .navigationDestination(for: Int.self) { i in
                    //DetailView1(number: i, path: $path)
                    DetailView1(number: i, path: $pathStore.path)
                }
        }
    }
}

#Preview {
    How_to_make_a_NavigationStackReturnToItsRootViewProgrammatically()
}
