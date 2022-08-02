//
//  TabBarViews.swift
//  Figma
//
//  Created by Yash Patil on 27/07/22.
//

import Foundation

import SwiftUI


struct TabBarViews:Identifiable,Equatable
{
    static func == (lhs: Self, rhs: Self) -> Bool
    {
        return lhs.id == rhs.id
    }
    
    
    let id = UUID()
    var title: String
    var padding : CGFloat?
}


let TabViews : [TabBarViews] = [
                             TabBarViews(title:"All",padding: 1),
                             TabBarViews(title: "Nearest()",padding: 10),
                             TabBarViews(title: "Upcoming()",padding: 10),
                             TabBarViews(title: "Past()",padding: 5)
]
