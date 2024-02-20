import SwiftUI

@main
struct Practice_iOS_SuperpoderesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HerosList()
            //    .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
