# me@My-Machine:~$
git clone https://github.com/{the-account}/{the-sample-project}.git

# me@My-Machine:~$ 
cd {the-sample-project}

# me@My-Machine:~/the-sample-project$
docker run --rm \
    -u "$(id -u):$(id -g)" \
    -v "$(pwd):/var/www/html" \
    -w /var/www/html \
    laravelsail/php82-composer:latest \
    composer require laravel/sail --dev
    
# me@My-Machine:~/the-sample-project$
docker run --rm \
    -u "$(id -u):$(id -g)" \
    -v "$(pwd):/var/www/html" \
    -w /var/www/html \
    laravelsail/php82-composer:latest \
    composer install --ignore-platform-reqs

# me@My-Machine:~/the-sample-project$ 
cp .env.example .env

# me@My-Machine:~/the-sample-project$ 
php artisan sail:install

# me@My-Machine:~/the-sample-project$ 
php artisan key:generate

# me@My-Machine:~/the-sample-project$ 
./vendor/bin/sail up -d

# me@My-Machine:~/the-sample-project$ 
./vendor/bin/sail npm install

# me@My-Machine:~/the-sample-project$ 
./vendor/bin/sail npm run build