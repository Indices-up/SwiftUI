//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by MBP on 2022/4/29.
//

import SwiftUI
import MapKit

struct LandmarkDetail: View {

    @EnvironmentObject var modelData: ModelData
    
    var landmark: Landmark
    
    var landmarkIndex: Int{
        modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
            
                .ignoresSafeArea(edges: .top)//要允许地图内容扩展到屏幕的顶部边缘，请将ignoresSafeArea(edges: .top)修饰符添加到地图视图中。
            
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
                .offset(x: 0, y: -130)
                .padding(.bottom, -130.0)
            
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    //    添加收藏按钮到详细视图，将按钮的isSet属性绑定到给定地标的isFavorite属性。
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                
                HStack {
                    Text(landmark.park)
                    Spacer()//间隔展开，使其包含视图使用其父视图的所有空间，而不是仅由其内容定义其大小。
                    Text(landmark.state)
                }
                
                /*将子标题字体修饰符从每个Text视图移动到包含它们的HStack，并将次要颜色应用于子标题文本。
                当您将修饰符应用于布局视图（如堆栈）时，SwiftUI会将修饰符应用于组中包含的所有元素。*/
                .font(.subheadline)
                .foregroundColor(.secondary)
        
                
                //为地标添加分隔符和一些额外的描述性文本。
                Divider()
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            
            .padding()//使用padding()修饰符方法为地标的名称和细节提供更多的空间。
            
//            Spacer()//在外部VStack底部添加一个垫片，将内容推送到屏幕顶部。
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.automatic)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: ModelData().landmarks[0])
    }
}
