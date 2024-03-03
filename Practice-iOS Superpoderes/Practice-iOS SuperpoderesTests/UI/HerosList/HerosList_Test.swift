import XCTest
@testable import Practice_iOS_Superpoderes

final class HerosList_Test: XCTestCase {
    
        var sut:HerosList!
        
        //MARK: -SE EJECUTA ANTES DE CADA TEST (REINICIALIZACIÓN)-
        override func setUp() {
            super.setUp()
        }
        
        //MARK: -SE EJECUTA DESPUÉS DE CADA TEST (LIMPIEZA)-
        override func tearDown() {
            super.tearDown()
            sut = nil
        }
        
        //MARK: -TESTS-
        func test_herosList_inisialization(){
            sut = HerosList(network: .constant(Network()))
            XCTAssertNotNil(sut)
        }
    
        func test_herosList_heroData() async{
            sut = HerosList(network: .constant(Network()))
            let heros = await sut.network.getHeros()
            XCTAssertNotNil(heros)
            XCTAssert(heros.count > 0)
        }
    
        func test_herosList_heroImage() async throws{
            sut = HerosList(network: .constant(Network()))
            let heros = await sut.network.getHeros()
            XCTAssertNotNil(heros)
            XCTAssert(heros.count > 0)
            
            let hero = heros[0]
            
            let (data,response) = try await URLSession.shared.data(from: URL(string: hero.thumbnail.path+"."+hero.thumbnail.thumbnailExtension.rawValue)!)
            XCTAssert((response as? HTTPURLResponse)?.statusCode == 200)
            XCTAssertNotNil(data, "not exist image data")
            
        }
}
