
import Foundation

struct ApiResponse:Codable{
    let dogs: [Dog]
    
    enum CodingKeys: String,CodingKey {
        case dogs = "dog"
}
}

struct Dog: Codable {
    let dogName:String
    let dogBreed:String
    let dogImage:String
    
    enum CodingKeys: String,CodingKey {
        case dogName = "dog_name"
        case dogBreed = "dog_breeds"
        case dogImage = "dog_image"
    }
}
