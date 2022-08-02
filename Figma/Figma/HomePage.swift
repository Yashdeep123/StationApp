//
//  HomePage.swift
//  Figma
//
//  Created by Yash Patil on 27/07/22.
//

import Foundation
import SwiftUI

struct HomePage: View
{
    @Environment(\.verticalSizeClass) var sizeClass
    
    @EnvironmentObject var viewModel : ViewModel
    
    @EnvironmentObject var personvm : PersonViewModel
    
    
    var body: some View
    {
       
    
        VStack(spacing:0)
            {
                LoginHorizontalView
                   
                    
                ZStack(alignment: .top)
                {
                    
                    CustomTabBarView()
                    FilterButtonView
                        
                }
  
            }
            .sheet(item: $viewModel.SheetStations, onDismiss: nil) { Stations in
                SheetView(items: Stations)
            }
            
    }
    
            
}


    
extension HomePage
{

private var LoginHorizontalView : some View
{
    HStack
    {
        
     Text("Edvora")
            .fontWeight(.bold)
            .font(.largeTitle)
        
        Spacer()
        PersonImage()
        
    }
    .padding()
    .padding(.vertical,20)
    .offset(x: 0, y: 10)
        
}


private var FilterButtonView : some View
{
    VStack
    {
    Button
    {
        viewModel.FilterButton()
    }
    label:
    {
        
        Text("Filter")
            .foregroundColor(.black.opacity(1.0))
            .frame(width: 100, height: 40)
            .background(
            Capsule().padding(.horizontal,3)
            .shadow(radius: 5))
            .frame(width: 100, height: 45)
            .foregroundColor(Color.white.opacity(0.9))
            .overlay(alignment: .leading, content:
                       
            {
                Image(systemName:"line.3.horizontal.decrease.circle").padding(.horizontal,7)
            })
    }
        
        if viewModel.ShowFilterOptions {
                FilterView()
        }
        
    }
    }
    
}



struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
            .environmentObject(PersonViewModel())
            .environmentObject(ViewModel())
            .preferredColorScheme(.dark)
            .edgesIgnoringSafeArea(.top)
    }
}

