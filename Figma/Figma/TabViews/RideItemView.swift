//
//  RideItemView.swift
//  Figma
//
//  Created by Yash Patil on 27/07/22.
//

import Foundation

import SwiftUI

struct RideItemView: View {
    
    @EnvironmentObject var viewModel : ViewModel
    
    @EnvironmentObject var personvm : PersonViewModel
    
    
    var body: some View
    {
         
            ScrollView(.vertical, showsIndicators: true)
            {
            LazyVStack
                {
                
            ForEach(viewModel.StateAndCityPressed()!,id:\.id)
            {
                Object in
                Button
                {
                    viewModel.AssignSheet(Object: Object)
                } label:
                {
                    ZStack(alignment:.bottom)
                    {
                    URLImage(urlstring: Object.map_url)
                            .cornerRadius(10)
                            .padding(.vertical)
                            BottomImageView(Object: Object)
                        
                        
                    }
                }
                
            }
                }.task{
                    await viewModel.fetchData()
                }
                
            }
        
       
        
    }
    func ClippedDate(Object : Items) -> some View
   {
       VStack
       {
       let Object = Object
       let StartIndex = Object.date.startIndex
       let finalIndex = Object.date.index(StartIndex, offsetBy: 9)
       Text("\(String(Object.date[StartIndex...finalIndex]))")
           
       }
   }
    
    func BottomImageView(Object:Items) -> some View
   {
       HStack(spacing:100)
       {
           Text("# \(Object.id)")
               .padding(.leading)
               .tint(.black)
           
           
           HStack(spacing:10)
           {
               Image(systemName: "calendar")
               ClippedDate(Object: Object)
                   .padding(.trailing)
                   .tint(.black)
           }
       }
       .frame(width: 350, height: 45)
       .background(Color.white.opacity(0.7))
       .cornerRadius(10)
       .offset(x: 0, y: -15)
       
   }
    
    
    
     

}

struct RideItemView_Previews: PreviewProvider {
    static var previews: some View {
        RideItemView()
            .environmentObject(ViewModel())
            .environmentObject(PersonViewModel())
        
    }
}



