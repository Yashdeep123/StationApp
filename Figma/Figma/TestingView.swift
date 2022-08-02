//
//  TestingView.swift
//  Figma
//
//  Created by Yash Patil on 29/07/22.
//

import SwiftUI

struct TestingView: View {
    var array = [1,4,3,6,2,3,67]
    
    var body: some View
    {
        Text("\(array)" as String)
    }
}

struct TestingView_Previews: PreviewProvider {
    static var previews: some View {
        TestingView()
    }
}
