//
//  Covid.swift
//  FetchNestedJsonDataCovid19
//
//  Created by User on 20/01/24.
//

import Foundation
import SwiftUI

struct Total : Codable, Identifiable {
    let id = UUID()
    let jumlah_positif : Int
    let jumlah_meninggal : Int
    let jumlah_sembuh : Int
    let jumlah_dirawah : Int
}

struct Update : Codable {
    let total : Total
}

struct CovidReponse : Codable {
    var update : Update
}
