# README

## Развертывание

### Ubuntu


#### Необходимо

- Ruby >= 2.3.3
- Postgresql >= 9.4
- gem Bundler

#### Запуск

Server (Puma)

    rails s
    #Остановить сервер ctrl+c


### OSX


#### Необходимо

- Ruby >= 2.3.3
- Postgresql >= 9.4
- gem Bundler

#### Запуск

Server (Puma)

    rails s
    #Остановить сервер ctrl+c

Postgresql

    postgres -D /usr/local/var/postgres
    #Остановить сервер ctrl+c

## Справочная информация

### Перед первым запуском:

- Установить все гемы: bundle install
- Создать базу: rails db:create db:migrate
- Создать пользователя-администратора по умолчанию(логин - admin, пароль - admin): rails db:seed

### Сторонние гемы:

- bcrypt для шифрования пароля
- pg для взаимодействия с базой данных postgresql

### Основной функционал:

- root: страница со списком уже добавленных городов
- /signup: регистрация пользователя
- /login: вход для пользователя
- /addcity: добавить город(доступно только админу)
- /users: список пользователей, там же можно изменить их права(доступно только админу)

# weatherapp
