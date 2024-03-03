import SwiftUI

@main
struct Practice_iOS_SuperpoderesApp: App {
    let persistenceController = PersistenceController.shared
    @State var network = Network()

    var body: some Scene {
                
        WindowGroup {
            HerosList(network: $network)
            //    .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
