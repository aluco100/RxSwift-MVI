//
//  Category.swift
//  TheMealDB
//
//  Created by Alfredo Luco Gordon on 02-08-21.
//

import Foundation

class Category: Decodable, Identifiable {
    
    // MARK: - Properties
    
    var id: String
    var name: String
    var thumb: String
    var description: String
    
    // MARK: - Coding Keys
        
    enum CodingKeys: String, CodingKey {
        case idCategory
        case strCategory
        case strCategoryDescription
        case strCategoryThumb
    }
    
    // MARK: - Decoding
    
    required init(from decoder: Decoder) throws {
        // Mapping
                
        // Get The Container
            
        let container = try decoder.container(keyedBy: CodingKeys.self)

        // Mapping Some Properties
                
        self.id = try container.decodeIfPresent(String.self, forKey: .idCategory) ?? ""
        self.name = try container.decodeIfPresent(String.self, forKey: .strCategory) ?? ""
        self.description = try container.decodeIfPresent(String.self, forKey: .strCategoryDescription) ?? ""
        self.thumb = try container.decodeIfPresent(String.self, forKey: .strCategoryThumb) ?? ""
    }
    
}
