README.md
instruction Running the website

step 1 - set up database

download and install xampp using recommended steps https://www.wikihow.com/Install-XAMPP-for-Windows

using xampp run mysql and apache

step 2 - run the database

Using mySql create a database called "dimvote"

import the "dimvote.sql" file

step 3 run application backend

usimg cmd navigate to to project directory

Run composer install or php composer.phar install

Run php artisan key:generate

Run php artisan migrate

Run php artisan db:seed to run seeders, if any.

Run php artisan serve

step 4 run application frontend

install node https://nodejs.org/en/download/

using cmd navigate to project

run npm install - g @angular/cli

run npm run ng-serve
