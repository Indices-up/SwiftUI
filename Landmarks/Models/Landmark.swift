//
//  Landmark.swift
//  Landmarks
//
//  Created by MBP on 2022/4/29.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable,Codable,Identifiable{
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates:Coordinates
    
    /*计算一个locationCoordinate属性，
     该属性对于与MapKit框架交互非常有用
     */
    var locationCoordinate:CLLocationCoordinate2D{
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable,Codable {
        var longitude: Double
        var latitude : Double
    }
    
}
