//
//  Model.swift
//  Landmarks
//
//  Created by MBP on 2022/4/29.
//

/*创建一个load(_:)方法，从应用程序的主捆绑包中获取具有给定名称的JSON数据。
 加载方法依赖于返回类型与Decodable协议的一致性，解码协议是Codable协议的一个组成部分。
 */

import Foundation
import Combine

//从Combin框架中声明符合Observable协议的新模型类型。
//SwiftUI订阅您的可观察对象，并在数据更改时更新任何需要刷新的视图。
final class ModelData:ObservableObject{
    //可观察对象需要发布对其数据的任何更改，以便其订阅者可以接收更改。
    @Published var landmarks:[Landmark] = load("landmarkData.json")
}


func load<T: Decodable>(_ fileName: String) ->T {
    let data: Data
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil)
    else {
        fatalError("Couldn't find \(fileName) in main bundle.")
    }
    do{
        data = try Data(contentsOf: file)
    }catch{
        fatalError("Couldn't load \(fileName) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch{
        fatalError("Couldn't parse \(fileName) as \(T.self):\n\(error)")
    }
}
