//
//  LandmarkList.swift
//  Landmarks
//
//  Created by MBP on 2022/4/29.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    
    @State private var showFavoritesOnly = false//false
    
    //过滤出值组合值为TRUE的数据模型
    var filteredLandmarks:[Landmark]{
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    var body: some View {
        NavigationView {//NavigationView为列表及其子列表设置导航层次结构，但您需要另一种NavigationLink类型才能使行充当导航到另一个视图的按钮。
            
            
            /*创建一个嵌套的For组，将地标转换为行。
             要在列表中组合静态和动态视图，或组合两组或多组不同的动态视图，请使用For类型，而不是将您的数据收集传递给List。*/
            
            List{
                
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks){landmark in
                    NavigationLink{
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            
            /*
             //创建一组动态视图
            List(filteredLandmarks) { landmark in
                NavigationLink{
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }*/
        }
        .navigationTitle("Landmarks")
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
//        ForEach(["iPhone SE (2nd generation)","iPhone SE (3nd generation)","iPhone XS Max"],id: \.self){deviceName in
//        LandmarkList()
//            .previewDevice(PreviewDevice(rawValue: deviceName))
//            .previewDisplayName(deviceName)
//        }
    }
}
