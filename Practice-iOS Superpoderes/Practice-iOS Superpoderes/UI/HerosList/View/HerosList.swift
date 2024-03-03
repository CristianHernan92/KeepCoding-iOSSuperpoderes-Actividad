import SwiftUI
import Combine

struct HerosList: View {
    
    @Binding var network: Network
    @State var heros: [CharactersDataResult] = []
    
    var body: some View {
        NavigationStack{
            ScrollView{
                ForEach(heros){ hero in
                    NavigationLink {
                        HeroSeries(heroId: hero.id, network: $network)
                    } label: {
                        VStack{
                            VStack{
                                //image
                                AsyncImage(url: URL(string: hero.thumbnail.path+"."+hero.thumbnail.thumbnailExtension.rawValue)){ Image in
                                        Image
                                            .resizable()
                                            .frame(height: 200)
                                    
                                } placeholder: {
                                        ProgressView().progressViewStyle(CircularProgressViewStyle(
                                            tint: .gray
                                        ))
                                        .scaleEffect(4)
                                        .frame(width: 200,height: 200)
                                }
                                
                                //text
                                Text(hero.name)
                                    .multilineTextAlignment(.center)
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 30, maxHeight: .infinity)
                                    .foregroundColor(.black)
                                    .bold()
                                    .opacity(0.5)
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
            }
        }
        .onAppear{
            Task{
                await getHerosList()
            }
        }
        .refreshable {
            Task{
                await getHerosList()
            }
        }
    }
}

extension HerosList{
    func getHerosList() async{
            self.heros = await network.getHeros()
    }
}

#Preview {
    HerosList(network: .constant(Network()))
}
