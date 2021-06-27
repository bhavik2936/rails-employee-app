# Rails Employee App

Rails API project that has manager and employee entity with 1:N relationship.
The manager is able to manipulate employee after following authentication process.

The API uses `devise` gem for authentication process. And exposes `Authentication` header over the network, used to authenticate the resource.

## API Reference

The API endpoints are listed in the Postman collection and is available [here](https://www.getpostman.com/collections/3d79c409ba10a4a6d4c3). It can be inspect by importing in Postman tool.

## Demo

The API demo is available [here](https://rails-employee-app.herokuapp.com). Please read [API Reference](#api-reference) to get to know the API endpoints.

The react project which utilize the same API as backend is deployed [here](https://react-employee-app.netlify.app) as well.

## Environment Variables

To run this project, you will need to set the following environment variables.


Please not that `dotenv` gem is already added to development and testing environment so, adding this into .env file would work as well.

### Required

`MAIL_HOST`
Set this variable as mail host.

`REACT_APP_URL`
Set this variable to reflect react app's url in email notifications.

### Production Only

Please set these variable to respective credentials provided by mail service provider.

`SENDMAIL_USERNAME`
`SENDMAIL_PASSWORD`
`SENDMAIL_PROVIDER`
`SENDMAIL_PORT`

## Run Locally

### Clone the project

```bash
  git clone https://github.com/bhavik2936/rails-employee-app
```

### Go to the project directory

```bash
  cd rails-employee-app
```

### Install dependencies

```bash
  bundle install
```

### Add Devise Secret Key

```bash
  rails secret

  rm -f ./config/credentials.yml.enc && EDITOR="gedit --wait" rails credentials:edit
```

Copy the secret generated and paste at the end of the file opened in the gedit

```yml
  devise
    jwt_secret_key: <RAILS SECRET HERE>
```

### Migrate Database

```bash
  rails db:migrate
```

### Start the server

```bash
  rails s
```
