//
//  structure.swift
//  JSON_MVCApplication
//
//  Created by mr.jb on 01/04/23.
//

import Foundation


struct apidata:Codable
{
    var name:String?
    var capital:String?
    var flags = Flags()
    
}
struct Flags:Codable
{
    var png: String?
}
