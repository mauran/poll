import Kitura

protocol Routeable {
    func setupRoutes(router: Router) -> Void
}
