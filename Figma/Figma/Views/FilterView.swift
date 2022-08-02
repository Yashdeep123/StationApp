//
//  FilterView.swift
//  Figma
//
//  Created by Yash Patil on 27/07/22.
//

import Foundation
import SwiftUI


struct FilterView: View
{
    @EnvironmentObject var viewModel : ViewModel
    
    
    
    var body: some View
    {
        VStack(alignment:.center,spacing:20)
        {
            HStack(alignment:.center) {
                 Text("State:")
                
                TextField("",text: $viewModel.filterState)
                    .padding()
                    .frame(width: 200, height: 35, alignment:.center)
                .background(Color.white).cornerRadius(20)
                .foregroundColor(.black)
                .disableAutocorrection(true)
               
                
            }
                
                
            HStack(spacing:10) {
                Text("City:")
                TextField("",text: $viewModel.filterCity)
                    .padding()
                    .frame(width: 200, height: 35, alignment:.center)
                .background(Color.white).cornerRadius(20)
                .foregroundColor(.black)
                .disableAutocorrection(true)
            }
                
        }
        .padding()
        .background(Color.gray.opacity(0.8).cornerRadius(9))
        .cornerRadius(20)
        
    }
    
  
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView().environmentObject(ViewModel())
    }
}
