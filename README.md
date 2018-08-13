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
`irb -r ./lib/account.rb`

## List of commands:
Create a new account:
`account = Account.new`

Make a deposit:
`account.deposit(amount)`
with amount being the amount you want to deposit

Make a withdrawal:
`account.withdraw(amount)`
with amount being the amount you want to withdraw

See a statement:
`account.show_statement`

## Process
This app has been built using TDD principles. The tests reflect the expected behaviour as outlined in the requirements [found here](https://github.com/makersacademy/course/blob/master/individual_challenges/bank_tech_test.md). The code has been written in small steps with the goal of satisfying the tests. Whenever all tests passed, the code and tests have been refactored to make sure they are sticking to single responsibility principle and in order to keep the code as declarative as possible. After this new tests have been written to meet more of the requirements.

As it is a simple app, all methods are currently contained in one class. This will likely change in the future.
