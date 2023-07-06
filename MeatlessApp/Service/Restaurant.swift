import Foundation

struct Restaurant: Decodable {
    let name: String
    let distance: String
    let status: String
    let openDays: String
    let image: String
    let menu: [MenuItem]
}

struct MenuItem: Decodable {
    let name: String
    let price: Float
    let image: String
}
