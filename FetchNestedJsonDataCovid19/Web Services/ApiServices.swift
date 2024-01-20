import Foundation
import SwiftUI
import Combine

class ApiServices: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    
    @Published var datatotal = [Total]() {
        willSet {
            objectWillChange.send()
        }
    }
    
    @Published var isLoading = true
    
    init() {
        guard let url = URL(string: "https://data.covid19.go.id/public/api/update.json") else {
            fatalError("Invalid URL")
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            
            let result = try? JSONDecoder().decode(CovidReponse.self, from: data)
            if let result = result {
                
                self.isLoading = false
                
                DispatchQueue.main.async {
                    self.datatotal = [result.update.total]
                    
                    print(self.datatotal)
                }
            }
        }.resume()
    }
}
