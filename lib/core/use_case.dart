//class is used to encapsulate and execute
//a specific piece of business logic within the application,
//promoting separation of concerns and facilitating testability and reusability.
abstract class UseCase<T, P> {
  T call(P params);
}
