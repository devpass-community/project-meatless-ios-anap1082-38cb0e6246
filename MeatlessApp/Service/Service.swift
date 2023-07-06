import Foundation

struct Service {
    
    func fetchRestaurantList(completion: @escaping ([Restaurant]?)->Void) {
        guard let baseUrl = URL(string: "https://raw.githubusercontent.com/devpass-tech/meatless-api/main/restaurant_list.json") else { return }
        let task = URLSession.shared.dataTask(with: baseUrl) { (data, response, error) in
            guard let responseData = data else { return }
            do {
                let restauratList = try JSONDecoder().decode([Restaurant].self, from: responseData)
                completion(restauratList)
            } catch let error {
                print("Error: \(error)")
            }
        }
        task.resume()
    }
}
