//
//  APIHandler.swift
//  JustApp_Search
//
//  Created by Hashone 21 on 03/08/23.
//

import Foundation

struct Search : Codable {
    let data : [Data]?

    enum CodingKeys: String, CodingKey {

        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent([Data].self, forKey: .data)
    }

}

struct Data : Codable {
    
    let name : String?
    let sticker_image : Sticker_image?
    enum CodingKeys: String, CodingKey {

       
        case name = "name"
        case sticker_image = "sticker_image"
        
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
      
        name = try values.decodeIfPresent(String.self, forKey: .name)
        sticker_image = try values.decodeIfPresent(Sticker_image.self, forKey: .sticker_image)
    
    }

}

struct Sticker_image : Codable {
    let name : String?
    let folder_path : String?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case folder_path = "folder_path"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        folder_path = try values.decodeIfPresent(String.self, forKey: .folder_path)
    }

}
