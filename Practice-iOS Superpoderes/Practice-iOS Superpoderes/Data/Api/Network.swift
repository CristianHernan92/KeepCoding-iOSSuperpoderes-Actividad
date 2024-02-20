import Foundation
import Combine

final class Network{
    
    static var suscriptors = Set<AnyCancellable>()
    
    static func getHeros(completion: @escaping ([Result])->Void){
        
        let url = URL(string: "http://gateway.marvel.com/v1/public/characters?ts=1&apikey=0379354b345a4e6387c1bc9cd0eed38b&hash=a93d511ccf1321b047fa43424fdd8d40")
        var request : URLRequest = URLRequest(url: url!)
        request.httpMethod  = "GET"
    
        URLSession.shared.dataTaskPublisher(for: request)
        .tryMap { (data: Data, response: URLResponse) in
            if let responseStatus = (response as? HTTPURLResponse)?.statusCode, responseStatus == 200 {
                data
            } else {
                throw URLError(URLError.badServerResponse)
            }
        }
        .decode(type: Characters.self, decoder: JSONDecoder())
        .receive(on: DispatchQueue.main)
        .sink { completion in
            switch completion {
            case .finished:
                print("finaliza ok")
            case .failure(let errorString):
                print("Error red \(errorString)")
            }
        } receiveValue: { data in
            completion(data.data.results)
        }
        .store(in: &suscriptors)
    }
}
