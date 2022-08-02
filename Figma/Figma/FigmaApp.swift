//
//  FigmaApp.swift
//  Figma
//
//  Created by Yash Patil on 27/07/22.
//

import SwiftUI

@main

struct FigmaApp: App {
    @StateObject var viewModel = ViewModel()
    @StateObject var personvm = PersonViewModel()
    
    var body: some Scene {
        
        WindowGroup
        {
            HomePage()
                .environmentObject(personvm)
                .environmentObject(viewModel)
                .ignoresSafeArea(edges: .top)
                
                
        }
    }
}
