//
//  HandlingNavigationTheSmartWayWithNavigationDestination.swift
//  Navigation
//
//  Created by Marko Zivanovic on 15. 5. 2025..
//

import SwiftUI

struct Student: Hashable {
    var id: UUID = UUID()
    var name: String
    var age: Int
}

struct HandlingNavigationTheSmartWayWithNavigationDestination: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                NavigationLink("Select \(i)", value: i)
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }
            .navigationDestination(for: Student.self) { student in
                Text("You selected \(student.name)")
            }
        }
    }
}

#Preview {
    HandlingNavigationTheSmartWayWithNavigationDestination()
}
