import SwiftUI
import Combine

struct HerosList: View {
    
    @State private var heros: [Result] = []
    
    var body: some View {
        NavigationStack{
            ScrollView{
                ForEach(heros){ hero in
                    
                    Button(action: {
                        
                    }, label: {
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
                                    .tint(.black)
                                    .bold()
                                    .opacity(0.5)
                            }
                            .padding(10)
                        }
                        .background(.gray.opacity(0.5))
                        .opacity(0.8)
                        .cornerRadius(15)
                        .padding(.top, 2)
                        .padding(.leading, 40)
                        .padding(.trailing, 40)
                    })
                }
            }
        }
        .onAppear{
            Network.getHeros { data in
                heros = data
            }
        }
        .refreshable {
            Network.getHeros { data in
                heros = data
            }
        }
    }
}

#Preview {
    HerosList()
}
