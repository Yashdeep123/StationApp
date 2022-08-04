//
//  NearestTabView.swift
//  Figma
//
//  Created by Yash Patil on 27/07/22.
//

import SwiftUI

struct NearestTabView: View
{
    
    @EnvironmentObject var viewModel : ViewModel
    
    @EnvironmentObject var personvm : PersonViewModel
    
    var body: some View
    {
        ScrollView(.vertical,showsIndicators: true)
        {
        LazyVStack
            {
                ForEach(StateAndCityPressedInNearest()!,id:\.id)
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
                    RideItemView().BottomImageView(Object: Object)
                    
                    
                }
            }
            
        }
        }
            
        }.task {
            await viewModel.fetchData()
        }
        
    }
    
    func StateAndCityPressedInNearest() -> [Items]?
    {
        return viewModel.filterCity == "" && viewModel.filterState == "" ? FilteredNearestObjects() : viewModel.StateAndCityPressed()!
    }
    
    
    func FilteredNearestObjects() -> [Items]?
    {
     
        return viewModel.Itemobjects.filter(
            { Items in
                ExactFiltered(Items: Items) && NearestItems(Items: Items)
            })
        
    }
    
    
    func ExactFiltered(Items:Items) -> Bool
    {
        
        return Items.station_path.contains(personvm.UserData?.station_code ?? 0)
    }
    
    func NearestItems(Items: Items) -> Bool
    {
        if (personvm.UserData?.station_code ?? 0) > Items.destination_station_code && (personvm.UserData?.station_code ?? 0) < Items.origin_station_code
        {
            return false
        }
        else
        {
        let closest = Items.station_path.enumerated().min{ abs($0.1 - (personvm.UserData?.station_code ?? 0)) < abs($1.1 - (personvm.UserData?.station_code ?? 0))}!
        
        return Items.station_path.contains(closest.element)
        }
        
    }

    
    
    
}

struct NearestTabView_Previews: PreviewProvider {
    static var previews: some View {
        NearestTabView()
            .environmentObject(ViewModel())
            .environmentObject(PersonViewModel())
    }
}


