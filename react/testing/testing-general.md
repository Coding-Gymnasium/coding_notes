# Testing React

## Types of Test

- Unit tests
  - Tests one unit of code in isolation
- Integration tests
  - How multiple units work together
- Functional Tests
  - Tests a particular function of software
  - Test behavior
- Acceptance / End-to-end (E2E) Tests
  - Use actual browser and server (Cypress, Selenium)

### Unit vs Functional Testing

| Unit Testing                                 | Functional Testing                        |
| -------------------------------------------- | ----------------------------------------- |
| Isolated: mock dependencies, test internals  | Include all relevant units, test behavior |
| Very easy to pinpoint failures               | Close to how users interact with software |
| Further from how users interact with softwar | Robust tests                              |
| More likely to break with refactoring        | More difficult to debug failing tests     |
