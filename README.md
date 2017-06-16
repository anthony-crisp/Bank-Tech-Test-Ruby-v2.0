# Bank-Tech-Test-Ruby-v2.0

Create a simple banking program as a technical skills test.

## Specification

* You can interact with this code via a REPL like IRB or PRY.
* You can make deposits and withdrawals.
* Account statement (date, amount, balance) printing.

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012
**And** a deposit of 2000 on 13-01-2012
**And** a withdrawal of 500 on 14-01-2012
**When** she prints her bank statement
**Then** she will see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

#### How to use

Bellow is a pry transcript of how the program runs from a users perspective:
The program allows you to manually enter a date for each transaction.

```
[1] pry(main)> require './lib/account.rb'
=> true
[2] pry(main)> my_account = Account.new
=> #<Account:0x007fd709353300 @balance=#<Balance:0x007fd7093531e8 @current_balance=0>, @transactions=[]>
[3] pry(main)> my_account.withdraw(500, '14-01-2012')
RuntimeError: Insuficient funds in account.
from /Users/anthonycrisp/Desktop/Projects/bank_tech_test_v2/lib/balance.rb:15:in `money_out'
[4] pry(main)> my_account.deposit(1000, '10-01-2012')
=> [["10/01/2012", "1000.00", "", "1000.00"]]
[5] pry(main)> my_account.deposit(2000, '13-01-2012')
=> [["10/01/2012", "1000.00", "", "1000.00"], ["13/01/2012", "2000.00", "", "3000.00"]]
[6] pry(main)> my_account.withdraw(500, '14/01/2012')
=> [["10/01/2012", "1000.00", "", "1000.00"], ["13/01/2012", "2000.00", "", "3000.00"], ["14/01/2012", "", "500.00", "2500.00"]]
[7] pry(main)> my_account.print_statement
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
=> [["14/01/2012", "", "500.00", "2500.00"], ["13/01/2012", "2000.00", "", "3000.00"], ["10/01/2012", "1000.00", "", "1000.00"]]

```
If no date is provided the actual date of the transaction is added automatically.

```
[1] pry(main)> require './lib/account.rb'
=> true
[2] pry(main)> my_account = Account.new
=> #<Account:0x007f8c5bb13250 @balance=#<Balance:0x007f8c5bb13200 @current_balance=0>, @transactions=[]>
[3] pry(main)> my_account.withdraw(500)
RuntimeError: Insuficient funds in account.
from /Users/anthonycrisp/Desktop/Projects/bank_tech_test_v2/lib/balance.rb:15:in `money_out'
[4] pry(main)> my_account.deposit(1000)
=> [["15/06/2017", "1000.00", "", "1000.00"]]
[5] pry(main)> my_account.deposit(1000)
=> [["15/06/2017", "1000.00", "", "1000.00"], ["15/06/2017", "1000.00", "", "2000.00"]]
[6] pry(main)> my_account.withdraw(500)
=> [["15/06/2017", "1000.00", "", "1000.00"], ["15/06/2017", "1000.00", "", "2000.00"], ["15/06/2017", "", "500.00", "1500.00"]]
[7] pry(main)> my_account.print_statement
date || credit || debit || balance
15/06/2017 || || 500.00 || 1500.00
15/06/2017 || 1000.00 || || 2000.00
15/06/2017 || 1000.00 || || 1000.00
=> [["15/06/2017", "", "500.00", "1500.00"], ["15/06/2017", "1000.00", "", "2000.00"], ["15/06/2017", "1000.00", "", "1000.00"]]

```
