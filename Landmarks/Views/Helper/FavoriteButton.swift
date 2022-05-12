//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by MBP on 2022/5/12.
//

import SwiftUI

struct FavoriteButton: View {
    //添加一个isSet绑定，它指示按钮的当前状态，并为预览提供一个常量值
    @Binding var isSet:Bool
    
    var body: some View {
        Button{
            isSet.toggle()
        } label: {
            Label("Toggle Favorite",systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
