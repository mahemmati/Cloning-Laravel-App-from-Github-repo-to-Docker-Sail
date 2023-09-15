# me@My-Machine:~$
git clone https://github.com/{the-account}/{the-sample-project}.git

# me@My-Machine:~$ 
cd {the-sample-project}

# me@My-Machine:~/the-sample-project$ 
cp .env.example .env

DB_HOST=mysql
DB_USERNAME=sail
DB_PASSWORD=password

https://laravel.com/docs/master/sail#installing-composer-dependencies-for-existing-projects    
# me@My-Machine:~/the-sample-project$
docker run --rm \
    -u "$(id -u):$(id -g)" \
    -v "$(pwd):/var/www/html" \
    -w /var/www/html \
    laravelsail/php82-composer:latest \
    composer install --ignore-platform-reqs

# me@My-Machine:~/the-sample-project$ 
./vendor/bin/sail up -d

# me@My-Machine:~/the-sample-project$ 
sail artisan key:generate
 
# me@My-Machine:~/the-sample-project$ 
./vendor/bin/sail npm install

# me@My-Machine:~/the-sample-project$ 
sail artisan migrate --seed

# ----
# me@My-Machine:~/the-sample-project$ 
sail artisan storage:link
# Also check the APP_URL= in .env file

# OPTIONAL:To make a fresh git repo
# me@My-Machine:~/the-sample-project$ 
rm -rf .git

# me@My-Machine:~/the-sample-project$ 
./vendor/bin/sail npm run build
