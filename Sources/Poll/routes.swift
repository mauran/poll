import Kitura

class Routes {
    
    func setupRoutes(container: Container) {
        
        let router = container.resolve(type: Router.self) as! Router
        var routes = [(Controller & Routeable).Type]()
  
        routes.append(CommandController.self)

        
        for route in routes {
            route.init(container: container).setupRoutes(router: router)
        }
    }

}
