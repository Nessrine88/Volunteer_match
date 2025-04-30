# <div align="center">Volunteer Match App</div>
<a name="readme-top"></a>



# 📗Table of Contents

- [📖  Volunteer Match ](#-Volunteer_match-app-)
  - [🛠 Built With ](#-built-with-)
    - [Tech Stack ](#tech-stack-)
    - [Key Features ](#key-features-)
  - [💻 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Install](#install)
    - [Database](#database)
    - [Usage](#usage)
    - [Run tests](#run-tests)
    - [Run linter](#run-linter)
    - [Deployment](#deployment)
  - [👥 Authors ](#-authors-)
  - [🔭 Future Features ](#-future-features-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [📝 License ](#-license-)


# 📖 Volunteer Match App <a name="about-project"></a>
The Volunteer Match app connects volunteers with nonprofit organizations and community projects. It allows users to discover volunteer opportunities, sign up for events, track their volunteer hours, and connect with like-minded individuals. Organizations can post opportunities, manage volunteers, and recognize contributions.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

  <ul>
    <li><a href="https://rubyonrails.org/">Ruby on Rails 7.1.2</a></li>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
  
### Key Features <a name="key-features"></a>

- Opportunity Discovery: Users can browse and search for volunteer opportunities based on location, cause, and skills.

- User Profiles: Volunteers can create profiles showcasing their skills, interests, and volunteer history.

- Organization Dashboard: Nonprofits can post opportunities, manage volunteers, and track engagement.

- Event Management: Organizations can create and manage volunteer events with details like date, time, and required skills.

- Hour Tracking: Volunteers can log and track their volunteer hours, which can be verified by organizations.

- Messaging System: Built-in communication between volunteers and organizations.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites 

- In order to run this project you need:

- Install Ruby

- Install Node.js

- Install PostgreSQL

### Setup 



cd my-folder
git clone [github.com/Nessrine88/volunteer-match](https://github.com/Nessrine88/Volunteer_match.git)

### Install

- Install all necessary dependencies listed in the Gemfile.


```sh

bundle install
```
- Install all necessary dependencies listed in the package.json.


```sh
npm install
```
- Database
Important: please, rename .env.example to .env and fill out all necessary fields otherwise you will not be able to connect to the database.

- Before running the migrations and seeds, ensure that PostgreSQL is installed and running:

``` sh
sudo service postgresql start
```
- Create database:
```
``` sh
rails db:create
```
- Run migrations:

``` sh
rails db:migrate
```
- Add the seeds:

``` sh
rails db:seed
```
###  Usage

To run the project, navigate to the project directory and execute the following command:

``` sh
rails server
```
- For the React frontend (if applicable):

``` sh
npm start

``` 
### Run Tests

- To execute all test suites in the application, use the following command in your terminal:

``` sh
rspec
```
- If you wish to run only the controller request tests:

``` sh
rspec spec/requests/
```
- If you wish to run only the integration tests:

``` sh
rspec spec/system
```
### Run Linter
- 
- To run linter, run the following command:

```sh
rubocop
``` sh
npx stylelint "**/*.{css,scss}"
```
### Deployment
You can deploy this project using:

- Render

- Heroku

- Netlify

- Fly.io

- Amazon Web Service

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 👥 Authors <a name="authors"></a>
### 👤 Nessrine Macherki 

- GitHub: Your [GitHub](https://github.com/Nessrine88)

- Twitter:  Twitter

- LinkedIn:  [LinkedIn](https://www.linkedin.com/in/nessrine-macherki/)



<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a name="future-features"></a>
Mobile Application: Develop a companion mobile app for easier access on the go.

Badge System: Implement a recognition system with badges for volunteer milestones.

Social Sharing: Allow users to share their volunteer experiences on social media.

Advanced Analytics: Provide organizations with detailed reports on volunteer engagement.

Multi-language Support: Add support for multiple languages to reach a broader audience.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the issues page.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ⭐️ Show Your Support <a name="support"></a>
If you like this project please give it a star. Thanks in advance!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🙏 Acknowledgments <a name="acknowledgements"></a>
I would like to thank all the open-source contributors and the Rails community for their invaluable resources and support.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 📝 License <a name="license"></a>

This project is MIT licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
