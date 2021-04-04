# Ruby application for an Atm
### Available functions
- Create an account
- Deposit cash
- You can check your balance
- Withdraw cash
---
# Dependencies
- Rspec
- Pry
- Irb
---
# Setup
1. Download file from github repo.
2. Open file in your terminal.
3. Bundle install to download all required dependencies.
4. Type irb in your terminal.
5. Type load 'lib/person.rb'
---
# How to use our application
1. Type atm = Atm.new
2. Type user = Person.new(name: 'Name')
3. Type user.create_account
4. Type user.deposit(amount)
5. Type user.withdraw(amount: amount, pin: account pincode, account: user.account, atm: atm)
6. Type user variable 'this will show you your account values like balance, pincode, account status etc.'
---
# Acknowledgements
We had a problem with our receipt and this gitrepo helped us solve the issue. We were missing response on line 57 in person.rb.
In our implementation.
https://github.com/FoxyTony/atm_challenge_2020/blob/master/lib/person.rb 

---
# Updates/Improvements
- Tourists can use the atm to withdraw cash and the correct exchange rate is applied to their balance.
- Possibility to change you pin code in the Atm.
- Automatic alert when the Atm reaches a certain amount of funds left.

---
# License
MIT-license
