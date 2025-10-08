# Portfolio_app

A full-featured user management web application built with **Ruby on Rails**.  
This app demonstrates essential Rails concepts such as MVC architecture, RESTful routing, authentication, and email integration.

---

## 🚀 Features

- User sign up, login, and logout
- Account activation via email (Action Mailer)
- Password reset function
- Secure session management with cookies
- Flash messages for user feedback
- Responsive views with ERB templates and partials

---

## 🛠️ Tech Stack

| Category | Technology |
|-----------|-------------|
| Framework | Ruby on Rails 7 |
| Language | Ruby 3.x |
| Database | SQLite (development), PostgreSQL (production ready) |
| Frontend | HTML, CSS, Bootstrap (default) |
| Mailer | Action Mailer with local SMTP |
| Version Control | Git / GitHub |

---

## 📁 Structure Overview

```
app/
├── controllers/
│├── users_controller.rb
│├── sessions_controller.rb
│├── account_activations_controller.rb
│└── password_resets_controller.rb
├── models/
│└── user.rb
└── views/
├── users/
├── sessions/
└── password_resets/
```
---

## 🧩 Setup (Local)

```bash
git clone https://github.com/YOUR_USERNAME/Portfolio_app.git
cd Portfolio_app
bundle install
rails db:migrate
rails server


Then visit:
👉 http://localhost:3000

💌 Email Function (Development Mode)

Emails are previewed locally using the letter_opener gem.
When a user signs up or resets their password, an email link appears in the browser for testing.

🧠 What I Learned

How to implement secure user authentication using has_secure_password

How to use Action Mailer for account activation and password reset

MVC structure and RESTful controller design

Managing flash messages and user sessions in Rails

Handling errors and validations gracefully

🌱 Next Steps

Add micropost (tweet-like) feature

Introduce likes/comments functionality

Deploy to Render for live demonstration

👤 Author

Hina
Independent developer focusing on efficient learning and skill improvement.
Feel free to check my GitHub for updates!
