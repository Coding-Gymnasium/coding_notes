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

### BDD

- BDD: Behavior Driven Development
- Testing Library encourages testing behavior over implementation
- BDD is very explicitly defined
  - involves collaboration between lots of roles
    - developers, QA, business partners, etc
  - defines process for different groups to interact

### Testing Library and Accessibility

#### Accessibility and Finding Elements

- Testing Library recommends finding elements by accessibility handles, like assistive technologies - like screen readers - would be able to find them.
- There is a guide for which query to use: [Testing Library Guide](https://testing-library.com/docs/guide-which-query/)
- A fresh span create-react-app app's test example uses `getByText` - which is okay for non-interactive elements - but using `getByRole` would be better.
- ` const linkElement = screen.getByRole('link', { name: /learn react/i });`
- It's good practice to use the role whenever possible to make sure that the elements are accessible to screen readers.
- Roles documentation: [Role Definitions](https://www.w3.org/TR/wai-aria/#role_definitions)
  - some elements have built-in roles: button, a, etc.
- If you can't find your elements like a screen reader would then the app is not accessibility friendly.
