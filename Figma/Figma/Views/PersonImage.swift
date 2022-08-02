//
//  PersonImage.swift
//  Figma
//
//  Created by Yash Patil on 27/07/22.
//

import Foundation

import SwiftUI


struct PersonImage: View
{
    
    
    
    @EnvironmentObject  var personvm : PersonViewModel
    
    var body: some View
    {
        try!
        Image("")
            .data(url: personvm.UserData?.url ?? "Nothing")
            .resizable()
            .scaledToFit()
            .frame(width: 45, height: 45)
            .clipShape(Capsule())
            .shadow(radius: 15)
    }
    

    
    
}



struct NearestDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PersonImage()
            .environmentObject(PersonViewModel())
    }
}



extension Image
{
    

    enum Errors:Error
    {
        case error
    }
    func data(url:String) throws -> Self
    {
        guard let url = URL(string:url) else{throw Errors.error}
        
        
        if let data = try? Data(contentsOf: url) {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        return self
            .resizable()
    }
}
