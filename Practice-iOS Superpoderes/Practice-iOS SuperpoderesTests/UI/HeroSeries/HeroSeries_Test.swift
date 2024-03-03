import XCTest
@testable import Practice_iOS_Superpoderes

final class HeroSeries_Test: XCTestCase {
    
        var sut:HeroSeries!
        var heroId = 1011334
        
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
        func test_heroSeries_inisialization(){
            sut = HeroSeries(heroId: heroId, network: .constant(Network()))
            XCTAssertNotNil(sut)
        }

        func test_heroSeries_heroData() async{
            sut = HeroSeries(heroId: heroId, network: .constant(Network()))
            let heroSeries = await sut.network.getHeroSeries(characterId: heroId)
            XCTAssertNotNil(heroSeries)
            XCTAssert(heroSeries.count > 0)
        }

        func test_heroSeries_heroImage() async throws{
            sut = HeroSeries(heroId: heroId, network: .constant(Network()))
            let heroSeries = await sut.network.getHeroSeries(characterId: heroId)
            XCTAssertNotNil(heroSeries)
            XCTAssert(heroSeries.count > 0)
            
            let heroSerie = heroSeries[0]
            
            let (data,response) = try await URLSession.shared.data(from: URL(string: heroSerie.thumbnail.path + "." + heroSerie.thumbnail.thumbnailExtension)!)
            XCTAssert((response as? HTTPURLResponse)?.statusCode == 200)
            XCTAssertNotNil(data, "not exist image data")
            
        }
}
