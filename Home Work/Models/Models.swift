//
//  Models.swift
//  Home Work
//
//  Created by Gag Mkrtchyan on 7/10/20.
//  Copyright © 2020 Gag Mkrtchyan. All rights reserved.
//

import Foundation


struct MessageModel: Codable {
    let key: Int
    let value: String
}



struct DataModel: Codable {
    let addresses: [AddressModel]
}



struct AddressModel: Codable {
    let id: Int
    let appartment: Int?
    let buliding: String?
    let city: String?
    let entrance, floor: Int?
    let phoneNumber, street: String?
    let isDefault: Bool?
}



struct AddressReqModel: Codable {
    let title: String
    let description: String
}




struct ResponseModel: Codable {
    let success: Bool
    let data: DataModel
}



struct BaseResponseModel<T: Codable>: Codable {
    let success: Bool
    let data: T
}



struct PagingModels<T: Codable>: Codable {
    let list : [T]
    let pageCount: Int
    let itemCount: Int
}



struct InterestedModel: Codable {
    let id: Int
    let name: String
    let photo: String
    let price, discountedPrice, unitOfMeasure, unitOfMeasureValue: Int
    let isFavorite, isKilogram: Bool
    let minimumWeight, weightStep: Int?
}




struct  ProdModel: Codable {
    let id: Int
    let name: String?
    let category: String?
    let categoryID: Int?
    let description: String?
    let weight: Double?
    let price: Int?
    let photo: String?
    let countInBlock: Int?
    let volume: Double?
    let height, length, width: Int?
}





