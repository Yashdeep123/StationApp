//
//  ViewModel.swift
//  Figma
//
//  Created by Yash Patil on 27/07/22.
//

import Foundation

import SwiftUI




struct Items : Identifiable,Hashable,Codable
{
    var id,origin_station_code,destination_station_code : Int
    var station_path : [Int]
    var date,state,city,map_url : String
}
 

struct URLImage : View
{
    @EnvironmentObject var viewModel : ViewModel
    
    var urlstring: String
    
    @State var data : Data?
    
    var body : some View
    {
        if let data = data, let uiimage = UIImage(data:data)
        {
            
            Image(uiImage: uiimage)
                .resizable()
                .frame(width:350,height:250)
                
            
        }
        else
        {
            Image(systemName:"video")
                .resizable()
                .aspectRatio(contentMode:.fit)
                .frame(width: 300, height: 250)
                .tint(.black)
                .task{
                   await fetchDataImage()
                    
                }
        }
    }
    
    fileprivate func fetchDataImage() async
    {
        guard let url = URL(string: urlstring) else {return}
        
        URLSession.shared.dataTask(with: url)
                {
                (data,_,error) in
                    DispatchQueue.main.async
                {
                    self.data = data
                }
                
            }
            .resume()
            
        }
    
    
}


class ViewModel: ObservableObject
{
    
    
    
    @Published var SheetStations : Items? = nil
    
    @Published var filterCity : String = ""
    @Published var filterState  = ""
    @Published var Itemobjects : [Items] = []
    
    @Published var DiffUpwards : [Int] = []
    @Published var DiffDownwards : [Int] = []
    @Published var ShowFilterOptions : Bool = false

    
    
     func fetchData() async
    {
       
            
        
        await downloadData(fromURl: URL(string: "https://assessment.api.vweb.app/rides")!)
        {
            (returnedData) in
            
                guard let Items =  try? JSONDecoder().decode([Items].self, from: returnedData) else{return}
            DispatchQueue.main.async
                {
                self.Itemobjects = Items
                }
            
                    }
        }
            

       
    
    func FilterButton()
    {
        withAnimation(.easeInOut)
        {
            ShowFilterOptions.toggle()
            filterCity = ""
            filterState = ""
        }
        
    }
    
    func downloadData(fromURl url : URL, completionHandler : @escaping (_ data : Data) -> Void) async
    {
        URLSession.shared.dataTask(with:url)
        {
            (data, _, error) in
            guard let data = data,error == nil else{return}
            completionHandler(data)
            
        }.resume()
    
    }
    
    func AssignSheet(Object:Items)
    {
        SheetStations = Object
        ShowFilterOptions = false
    }
    
   /* func FilteredView() -> [Items]
    {
        return filterCity == "" && filterState == "" ? Itemobjects :
    }
    */
    func StateAndCityPressed() -> [Items]?
    {
      withAnimation(.easeInOut){
        if filterState == "" {
            if filterCity != ""
            {
                return Itemobjects.filter { Items in
                    Items.city.localizedCaseInsensitiveContains(filterCity)
                }
            }
        }
        else
        {
            if filterCity == ""
            {
                return Itemobjects.filter { Items in
                    Items.state.localizedCaseInsensitiveContains(filterState)
                }
            }
            else{
                return Itemobjects.filter { Items in
                    Items.state.localizedCaseInsensitiveContains(filterState) &&
                    Items.city.localizedCaseInsensitiveContains(filterCity)
                }
            }
        }
        return Itemobjects
    }
    }
   
   
    }
