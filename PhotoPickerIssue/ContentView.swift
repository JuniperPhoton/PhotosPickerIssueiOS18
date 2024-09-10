//
//  ContentView.swift
//  PhotoPickerIssue
//
//  Created by Photon Juniper on 2024/9/10.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    @State private var selection: PhotosPickerItem? = nil
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            PhotosPicker("Pick photo", selection: $selection)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
