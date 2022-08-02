//
//  PersonViewModel.swift
//  Figma
//
//  Created by Yash Patil on 27/07/22.
//

import Foundation
import SwiftUI

struct PersonStruct : Hashable,Codable
{
    let station_code: Int
    let name: String
    let url: String
}


class PersonViewModel : ObservableObject
{
    
    @Published var UserData: PersonStruct? = nil
    
    init()
    {
       guard let url = URL(string: "https://assessment.api.vweb.app/user")else
        {return}
        
        URLSession.shared.dataTask(with: url)
        {
            userData, _, error in
            
            guard let Userdata = userData,error == nil else {return}
            
            do{
                
                let userdata = try JSONDecoder().decode(PersonStruct.self, from: Userdata)
                
                DispatchQueue.main.async
                {
                self.UserData = userdata
                }
                
            }
            catch{
                print("Error occured during URL Session cant bring the user data , error: \(error)")
            }
            
        }.resume()
        
        
        
        
       
    }
}
