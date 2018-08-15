# Bank tech test
This app will let you create an account and update the balance through deposits and withdrawals. You can also see a statement showing a history of all your transfers, with the date they took place and the resulting balance.

## Setup
Install bundler:
`gem install bundler`

Install dependencies:
`bundle install`

## Running tests
To run test, type `rspec`

## Get started
To open up IRB in your terminal and load the app type:
`irb -r ./lib/account_controller.rb`

## List of commands:
Create a new account controller:
`controller = AccountController.new`

Make a deposit:
`controller.deposit(amount)`
with amount being the amount you want to deposit

Make a withdrawal:
`controller.withdraw(amount)`
with amount being the amount you want to withdraw

See your transaction history in a statement:
`controller.show_statement`

## Process
This app has been built using TDD principles. The tests reflect the expected behaviour as outlined in the requirements [found here](https://github.com/makersacademy/course/blob/master/individual_challenges/bank_tech_test.md). The code has been written in small steps with the goal of satisfying the tests. Whenever all tests passed, the code and tests have been refactored to make sure they are sticking to single responsibility principle and in order to keep the code as declarative as possible. After this new tests have been written to meet more of the requirements.

The functionality of the printer and statement constructor classes rely on class rather than instance methods because they are required to do the same thing for all accounts and they do not store any information related to the accounts.

## To do
If I had more time to spend on this project I would:
* Try to find more unhappy paths and create guards against them.
* Add further test to make sure different types of input still produce the expected results.
* Ask the client for further requirements, e.g. limiting the statement to transaction made between certain dates.
