//
//  ContentView.swift
//  SimpleShimmer
//
//  Created by Ganesh on 01/01/26.
//

import SwiftUI

struct ContentView: View {
    @State private var isShimmering: Bool = true
    
    var body: some View {
        NavigationStack {
            VStack {
                List(0..<10) { index in
                    HStack {
                        Image(systemName: "person.fill")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                            .frame(width: 60, height: 60)
                        VStack(alignment: .leading) {
                            Text("Sample Item \(index)")
                                .font(.headline)
                            Text("Description")
                                .font(.caption)
                        }
                    }
                }
                .listStyle(.inset)
                .shimmer(isShimmering)
                Button("Shimmer Toggle") {
                    isShimmering.toggle()
                    toggleShimmer()
                }
            }
            .navigationBarTitle("Shimmer")
        }
        .onAppear {
            toggleShimmer()
        }
    }
    
    func toggleShimmer() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            isShimmering.toggle()
        }
    }
}

#Preview {
    ContentView()
}
