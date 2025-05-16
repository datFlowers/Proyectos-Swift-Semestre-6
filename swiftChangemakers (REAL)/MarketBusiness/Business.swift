//
//  Business.swift
//  swiftChangemakers
//
//  Created by Alumno on 28/03/25.
//
import CoreLocation
import UIKit

struct Business {
    var name: String
    var description: String
    var contact: String
    var section: MarketSection
    var coordinate: CLLocationCoordinate2D
    var backgroundUIImage: UIImage? = nil
    var logoUIImage: UIImage? = nil
}
