//
//  CircleImage.swift
//  Landmarks
//
//  Created by MBP on 2022/4/29.
//

import SwiftUI

struct CircleImage: View {
    
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white,lineWidth: 4)
            }
            .shadow(radius: 7.0)
    }
}

struct Circle_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
