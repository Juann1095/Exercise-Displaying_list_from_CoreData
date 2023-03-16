import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    //    Replace var desserts = [PlaceHolderDessert]()" with a fetch request variable called desserts
    
    //    var desserts = [PlaceHolderDessert]()
    
    @FetchRequest (
        sortDescriptors: [],
        animation: .default)
    private var desserts: FetchedResults<Dessert>
    
    
    
    var body: some View {
        NavigationView{
            VStack{
                Text("DESSERTS")
                    .font(.title)
                List {
                    ForEach(desserts) { dessert in
                        VStack(alignment:.leading){
                            Text (dessert.name!)
                                .font(.system(size: 16, weight: .bold))
                            
                            HStack{
                                Text (dessert.size!)
                                Spacer()
                                Text("$\(dessert.price, specifier: "%.2f")")
                                    .foregroundColor(.gray)
                                .font(.callout)
                            }
                        }
                    }
                }
            }
            .onAppear{createDesserts()}
        }
    }
    
    
    
    func createDesserts() {
        //create desserts in the database.
        let profiterole = Dessert(context: viewContext)
        profiterole.name = "Profiterole"
        profiterole.size = "Large"
        profiterole.price = 2.99
        
        let CremeBurlee = Dessert(context: viewContext)
        CremeBurlee.name = "Creme Burlee"
        CremeBurlee.size = "Medium"
        CremeBurlee.price = 3.99
        
        let IceCream = Dessert (context: viewContext)
        IceCream.name = "Ice Cream"
        IceCream.size = "Extra Large"
        IceCream.price = 5.99
        
        let ApplePie = Dessert (context: viewContext)
        ApplePie.name = "ApplePie"
        ApplePie.size = "Small"
        ApplePie.price = 2.99
        
        let imperatrice = Dessert(context: viewContext)
        imperatrice.name = "Riz à l'impératrice"
        imperatrice.size = "Small"
        imperatrice.price = 2.99
        
        let cheesecake = Dessert (context: viewContext)
        cheesecake.name = "Cheese Cake"
        cheesecake.size = "Extra Small"
        cheesecake.price = 4.99
        
        let carrotcake = Dessert (context: viewContext)
        carrotcake.name = "Carrot Cake"
        carrotcake.size = "Standard"
        carrotcake.price = 3.99
        
        let piece = Dessert (context: viewContext)
        piece.name = "Piece Montée"
        piece.size = "Medium"
        piece.price = 5.99
        
        let eclair = Dessert (context: viewContext)
        eclair.name = "Eclair"
        eclair.size = "Large"
        eclair.price = 3.99
        
        let crepe = Dessert (context: viewContext)
        crepe.name = "Crépe Suzette"
        crepe.size = "Extra Large"
        crepe.price = 3.99
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
}

