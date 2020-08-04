//
//  Model.swift
//  IP Locator
//
//  Created by addjn on 04/08/20.
//  Copyright © 2020 pstw._. All rights reserved.
//

import UIKit

// MARK: - PurpleData
struct PurpleData: Codable {
    let status, dataDescription: String?
    let data: DataClass?

    enum CodingKeys: String, CodingKey {
        case status
        case dataDescription = "description"
        case data
    }
}

// MARK: - DataClass
struct DataClass: Codable {
    let geo: Geo?
}

// MARK: - Geo
struct Geo: Codable {
    let host, ip, rdns: String?
    let asn: Int?
    let isp, countryName, countryCode, regionName: String?
    let regionCode, city: String?
    let postalCode: Int?
    let continentName, continentCode: String?
    let latitude, longitude: Double?
    let metroCode: Int?
    let timezone, datetime: String?

    enum CodingKeys: String, CodingKey {
        case host, ip, rdns, asn, isp
        case countryName = "country_name"
        case countryCode = "country_code"
        case regionName = "region_name"
        case regionCode = "region_code"
        case city
        case postalCode = "postal_code"
        case continentName = "continent_name"
        case continentCode = "continent_code"
        case latitude, longitude
        case metroCode = "metro_code"
        case timezone, datetime
    }
}

