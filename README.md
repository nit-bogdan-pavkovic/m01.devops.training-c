# DevOps Course M01: C Project

This is a simple C project demonstrating basic CI/CD steps:

- **Build:** Compiling source files into an executable.
- **Unit Testing:** Running tests to validate functionality.
- **Linting:** Running static analysis (using cppcheck) to catch potential issues.

## Directory Structure

```
c-demo-project/
├── include/
│   └── calculator.h
├── src/
│   └── calculator.c
├── tests/
│   └── test_calculator.c
├── Makefile
└── README.md
```

## How to Use

1. **Build the Project:**

   ```bash
   make app

2. Run unit tests

    ```bash
    make test
    ```

3. Run linter

    ```bash
    make lint
    ```

4. Clean artifacts

    ```bash
    make clean

You can also build and run tests all at once with:

```bash
make all
```

## Steps

1. Fork this repository using your GitHub account
2. Clone this repository into your machine
3. (optional) Try building and testing the project on your machine
4. Add the project into course Semaphore organization (select `I will use the existing workflo`)
5. Edit a file (e.g. `README.md`), commit and push the changes (on the new branch)
6. Login to the Semaphore server with your account
7. A new workflow should have started in Semaphore
8. Examine the error and fix the pipeline

Relevant docs: [How to create a Project](https://docs.semaphore.io/using-semaphore/projects#create-project)
