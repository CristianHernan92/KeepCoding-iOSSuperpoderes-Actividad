import Foundation
import Combine

final class Network{
    
    //MARK: -CON "ASYNC AWAIT"-
    
    //getHeros
    func getHeros () async -> [CharactersDataResult]{
        let url = URL(string: "http://gateway.marvel.com/v1/public/characters?ts=1&apikey=0379354b345a4e6387c1bc9cd0eed38b&hash=a93d511ccf1321b047fa43424fdd8d40")
        
        var charactersDataResult:[CharactersDataResult] = Array<CharactersDataResult>()
        
        do{
            let (data,_) = try await URLSession.shared.data(from: url!)
            let characters = try JSONDecoder().decode(Characters.self, from: data)
            charactersDataResult = characters.data.results
        }catch{
            print(error)
        }
        
        return charactersDataResult
    }
    
    //getHeroSeries
    func getHeroSeries (characterId: Int) async -> [CharacterSeriesDataResult]{
        let url = URL(string: "http://gateway.marvel.com/v1/public/series?ts=1&apikey=0379354b345a4e6387c1bc9cd0eed38b&hash=a93d511ccf1321b047fa43424fdd8d40&characters="+String(characterId))
        
        var characterSeriesDataResult:[CharacterSeriesDataResult] = Array<CharacterSeriesDataResult>()
        
        do{
            let (data,_) = try await URLSession.shared.data(from: url!)
            let characterSeries = try JSONDecoder().decode(CharacterSeries.self, from: data)
            characterSeriesDataResult = characterSeries.data.results
        }catch{
            print(error)
        }
        
        return characterSeriesDataResult
    }
    
    //MARK: -CON "COMBINE"-
    
    /*
    private var suscriptors = Set<AnyCancellable>()
     
    //getHeros
    func getHeros (completion: @escaping ([CharactersDataResult])->Void){
        
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
                print("finaliza getHeros ok")
            case .failure(let errorString):
                print("Error red \(errorString)")
            }
        } receiveValue: { data in
            completion(data.data.results)
        }
        .store(in: &suscriptors)
    }
    
    //getHeroSeries
    func getHeroSeries(characterId: Int ,completion: @escaping ([CharacterSeriesDataResult])->Void){
        
        let url = URL(string: "http://gateway.marvel.com/v1/public/series?ts=1&apikey=0379354b345a4e6387c1bc9cd0eed38b&hash=a93d511ccf1321b047fa43424fdd8d40&characters="+String(characterId))
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
        .decode(type: CharacterSeries.self, decoder: JSONDecoder())
        .receive(on: DispatchQueue.main)
        .sink { completion in
            switch completion {
            case .finished:
                print("finaliza getHeroSeries ok")
            case .failure(let errorString):
                print("Error red \(errorString)")
            }
        } receiveValue: { data in
            completion(data.data.results)
        }
        .store(in: &suscriptors)
    }
    */
}
