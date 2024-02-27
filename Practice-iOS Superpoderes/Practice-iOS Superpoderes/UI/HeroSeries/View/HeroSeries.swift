import SwiftUI
import Combine

struct HeroSeries: View {
    
    let heroId: Int
    @State private var heroSeries: [CharacterSeriesDataResult] = []
    
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
                Network.getHeroSeries(characterId: heroId, completion: { heroSeries in
                    self.heroSeries = heroSeries
                })
            }
            .refreshable {
                Network.getHeroSeries(characterId: heroId, completion: { heroSeries in
                    self.heroSeries = heroSeries
                })
            }
    }
}

#Preview {
    HeroSeries(heroId: 1011334)
}
