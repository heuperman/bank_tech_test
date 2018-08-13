# Bank tech test

Record deposits and withdrawals from an account. See all transfers, with the date it took place and the resulting balance on a bank statement.

## Setup
Install bundler:
`gem install bundler`

Install dependencies:
`bundle install`

## Get started

To open up IRB in your terminal and load the app type:
`irb -r ./lib/account.rb`

### List of commands:

Create a new account:
`account = Account.new`

Make a deposit:
`account.deposit(amount)`
with amount being the amount you want to deposit

Make a withdrawal:
`account.withdraw(amount)`
with amount being the amount you want to withdraw

See a statement:
`account.statement`
