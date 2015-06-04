#Wallet

##Overview
Create a rails app to keep track of your wallet (but really your bank account). The application will have one data table of transactions.
It will have the ability to create, edit, and show transactions at various pages (views).

###Steps To Create Wallet
This assignment was the first time we learned of `bin/rails generate scaffold`. The scaffold was generated with the model name and the
fields associated with the table. For example: `name:string` or `transaction:decimal`.

After all the files were generated it was time to create
a new view to show general statistics for the account. A new method in the controller, a corresponding route pointing to the root, and many methods inside the model were all necessary for this new view.

Each method in the model was created using TDD (test driven development):
  * make a test (make sure it fails)
  * create the method to pass the test
  * refactor code along the way

###To Run...
* Clone repository from [here](https://github.com/aaronwiggins/wallet.git) onto your computer
* Once in the projects root directory, in the terminal type
    * `bin/rake db:migrate`
    * `bin/rails server`
* Open your browser and navigate to `localhost:3000`
    * from here you can navigate to add a new transaction or view all existing transactions in a table format
    * to get back to the root page, or the Dashboard, just click the `Dashbard` link
