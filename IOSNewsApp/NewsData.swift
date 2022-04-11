//
//  NewsData.swift
//  IOSProject2
//
//  Created by MacBook on 10.04.2022.
//

import Foundation


struct NewsData: Decodable {
    let title: String
    let p_date: String
    let author: String

}

struct DetailedNewsData: Decodable{
    let title: String
    let p_date: String
    let author: String
    let image: String
    let description: String
    let link: String
}
