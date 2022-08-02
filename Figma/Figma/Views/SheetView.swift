//
//  SheetView.swift
//  Figma
//
//  Created by Yash Patil on 27/07/22.
//

import Foundation

import SwiftUI


struct SheetView: View
{
    
    var items : Items
    
    @EnvironmentObject  var viewModel: ViewModel
    
    @EnvironmentObject var personvm : PersonViewModel
    
    var body: some View
    {
        VStack(spacing:30)
        {
            URLImage(urlstring: items.map_url)
                .cornerRadius(10)
                .shadow(radius: 10)
               
            
            
            VStack(spacing:20) // Ride Details View
            {
                
                HStack
                {
                    VStack(alignment:.leading)
                    {
                    Text("Ride ID").font(.subheadline)
                    Text("\(items.id)").fontWeight(.semibold)
                    }
                    Spacer(minLength: 20)
                    VStack(alignment:.trailing)
                    {
                        Text("Origin Station").font(.subheadline)
                        Text("\(items.origin_station_code)").fontWeight(.semibold)
                    }
                }//First row
                
                Divider()
                
                HStack
                {
                    VStack(alignment:.leading)
                    {
                        Text("Date").font(.subheadline)
                        ClippedDate(Object:items)
                            
                            
                            
                    }
                    Spacer()
                    VStack(alignment:.trailing)
                    {
                        Text("Distance").font(.subheadline)
                        Text("100Km").fontWeight(.semibold)
                        
                         }
                }//Second row
                
                Divider()
                
                HStack
                {
                    VStack(alignment:.leading)
                    {
                        Text("State").font(.subheadline)
                        Text(items.state).fontWeight(.semibold)
                    }
                    Spacer()
                    VStack(alignment:.trailing)
                    {
                        Text("Distance").font(.subheadline)
                        Text(items.city).fontWeight(.semibold)
                    }
                }//third row
                
                Divider()
                
                LazyVStack(alignment:.leading)
                {
                    Text("Station Path").font(.subheadline)
                    Text("\(items.station_path)" as String).fontWeight(.semibold)
                }
                
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white))
            .shadow(radius: 10)
            .padding(.horizontal)
            
            
            
            
        }
    
    }
    
    
    
    func ClippedDate(Object:Items) -> some View
    {
        VStack
        {
        let Object = Object
        let StartIndex = Object.date.startIndex
        let finalIndex = Object.date.index(StartIndex, offsetBy: 9)
        Text("\(String(Object.date[StartIndex...finalIndex]))")
                .fontWeight(.semibold)
            
        }
    }
    
            
    
}
    
    


struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView(items: Items(id: 0, origin_station_code: 0, destination_station_code: 0, station_path: [0,9,8], date: "", state: "", city: "", map_url: ""))
            .environmentObject(ViewModel())
            .environmentObject(PersonViewModel())
    }
}
