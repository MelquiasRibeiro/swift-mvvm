import Foundation


struct ListDogsServices {
    static let shared = ListDogsServices()
    
    func getDogs(completion: @escaping(Result<[Dog],Error>)->Void){
        guard let api = URL(string: API_URL) else {
            return
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: api){(data,reponse,error)in
            guard let jsonData = data else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode(ApiResponse.self, from: jsonData)
                
                completion(.success(decoded.dogs))
            }catch let error {
                completion(.failure(error))
            }
            
        }
        
        task.resume()
    }
    
}
