import SwiftUI
import Combine

struct HeroSeries: View {
    
    let heroId: Int
    @Binding var network: Network
    @State var heroSeries: [CharacterSeriesDataResult] = []
    
    var body: some View {
            ScrollView{
                ForEach(heroSeries){ heroSerie in
                    VStack{
                        VStack{
                            
                            ZStack{
                                VStack{
                                    //image
                                    AsyncImage(url: URL(string: heroSerie.thumbnail.path + "." + heroSerie.thumbnail.thumbnailExtension)){ Image in
                                            Image
                                                .resizable()
                                                .frame(height: 500)
                                                .opacity(0.3)
                                        
                                    } placeholder: {
                                            ProgressView().progressViewStyle(CircularProgressViewStyle(
                                                tint: .gray
                                            ))
                                            .scaleEffect(4)
                                            .frame(width: 200,height: 200)
                                    }
                                    
                                    //text
                                    Text(heroSerie.description ?? "")
                                        .font(.system(size: 15))
                                        .foregroundStyle(.gray)
                                        .bold()
                                }
                                
                                //text
                                Text(heroSerie.title)
                                    .font(.system(size: 23))
                                    .fontWeight(.bold)
                                    .padding()
                            }
                            
                        }
                        .padding(10)
                    }
                    .background(.gray.opacity(0.5))
                    .opacity(0.95)
                    .cornerRadius(15)
                    .padding(.top, 2)
                    .padding(.leading, 40)
                    .padding(.trailing, 40)
                }
            }
            .onAppear{
                Task{
                    await getHeroSeries()
                }
            }
            .refreshable {
                Task{
                    await getHeroSeries()
                }
            }
    }
}

extension HeroSeries{
    func getHeroSeries() async{
        self.heroSeries = await network.getHeroSeries(characterId: heroId)
    }
}

#Preview {
    let idHero = 1011334
    return HeroSeries(heroId: idHero,network: .constant(Network()))
}
