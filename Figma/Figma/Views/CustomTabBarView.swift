//
//  CustomTabBarView.swift
//  Figma
//
//  Created by Yash Patil on 27/07/22.
//

import Foundation

import SwiftUI



struct CustomTabBarView: View
{
    
    
    @EnvironmentObject var viewModel : ViewModel
    
    @State var selection : TabBarViews = TabBarViews(title: "All",padding: 1)
    
    @State var selectedindex = 0
    
    
    var body: some View
    {
        
        VStack
        {
       
        switch selectedindex
        {
        case 0:
            RideItemView()
        case 1 :
            NearestTabView()
            
        case 2: Text("Yet to be appeared for Upcoming")
                .foregroundColor(.secondary)
                .frame(maxHeight: .infinity)
        case 3: Text("Past Stations is yet to be discovered")
                .foregroundColor(.secondary)
                .frame(maxHeight: .infinity)
        default: Text("Nothing to appear for tab bar views")
                .foregroundColor(.secondary)
                .frame(height:582.5)

        }
            
    
            ScrollView(.horizontal,showsIndicators: false)
            {
            HStack
                {
                    
                    ForEach(TabViews, id:\.id )
                        {
                            Tab in
                            
                            Button
                            {
                            SwitchSelections(Tab: Tab)
                                
                            } label:
                            {
                            ForEachButtonView(Tab: Tab)
                                    
                                    
                            }// label
                                        
                        }
                    
                 }.fixedSize()
            }
            //ScrollView
        }
        //VStack
}//body View
            
    private func SwitchSelections(Tab: TabBarViews)
       {
           withAnimation(.easeInOut)
           {
               selection = Tab
           
           
           guard let index = TabViews.firstIndex(where: {$0 == Tab}) else {return}
           selectedindex = index
            viewModel.ShowFilterOptions = false
           }
           
           
           
       }
    
    
    private func ForEachButtonView(Tab:TabBarViews) ->some View
    {
        HStack {
                  VStack(spacing:10)
                  {
                     Text(Tab.title)
                      .fontWeight(.semibold)
                     .frame(width: 95, height: 10)
                    .foregroundColor(.black)
                    .padding(.vertical,1)
                      
                  RoundedRectangle(cornerSize: CGSize(width: 1, height: 1))
                         .frame(width: 50, height: 4)
                         .foregroundColor(selection == Tab ? .blue : .clear)
                      .cornerRadius(10)
                                  
                              
                  }
                .padding(.vertical,10)
                .padding(.horizontal,Tab.padding)
                .background(Capsule()
                  .foregroundColor(Color.white.opacity(0.8))
                  .shadow(radius: 3))
                
                  
               }//HStack
        .padding(.vertical,5)
        .background(Color.clear)
      .edgesIgnoringSafeArea(.bottom)
      
      
    }
}
      

struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarView()
            .environmentObject(ViewModel())
            .environmentObject(PersonViewModel())
            .preferredColorScheme(.dark)
            
    }
}
