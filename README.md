# Portfolio App

A modern portfolio and user management web application built with **Ruby on Rails 7**.  
This project demonstrates full-stack web development skills — from authentication to deployment.

**🌐 Live:** [https://portfolio-app-keid.onrender.com](https://portfolio-app-keid.onrender.com)

---

## 🚀 Features / 機能一覧
- ユーザー登録・ログイン・ログアウト機能
- メールによるアカウント有効化（Action Mailer）
- パスワードリセット機能
- Cookieベースのセッション管理
- フラッシュメッセージでのフィードバック表示
- レスポンシブデザイン（Bootstrap）
- MVC構成・RESTful設計のベストプラクティス

---

## 🛠 Tech Stack / 技術構成

| Category | Technology |
|-----------|-------------|
| Framework | Ruby on Rails 7 |
| Language | Ruby 3.x |
| Database | SQLite (dev) / PostgreSQL (prod) |
| Frontend | HTML, CSS, Bootstrap |
| Mailer | Action Mailer + letter_opener |
| Deployment | Render |
| Version Control | Git / GitHub |

---

## 📂 Directory Overview / ディレクトリ構成
```

app/
├── controllers/
│ ├── users_controller.rb
│ ├── sessions_controller.rb
│ ├── account_activations_controller.rb
│ └── password_resets_controller.rb
├── models/
│ └── user.rb
└── views/
├── users/
├── sessions/
└── password_resets/

```
---
## ⚙️ Setup (Local)
```bash
git clone https://github.com/AyaneRan/Portfolio_app.git
cd Portfolio_app
bundle install
rails db:migrate
rails server
```
Access: 👉 http://localhost:3000

## 💌 Email Preview (Development)

Emails are previewed locally via letter_opener gem.
When a user signs up or resets their password, the email content opens in the browser.

## 🚀 Deployment (Render)

Renderで「New → Web Service」を作成

GitHubと連携 → AyaneRan/Portfolio_app を選択

Build Command:

bundle install && rails db:migrate


Start Command:

bundle exec rails server


Environment Variables

RAILS_ENV=production
SECRET_KEY_BASE=your_secret_key
DATABASE_URL=your_postgres_url


Deploy完了後 →
🌐 https://portfolio-app-keid.onrender.com

## 🧠 What I Learned / 学んだこと

Railsの認証機構（has_secure_password）を活用した安全なログイン設計

Action Mailerでのアカウント有効化・パスワードリセットの実装

MVC構造とRESTfulなコントローラ設計の理解

Flashメッセージやバリデーションを通じたUX改善

Renderへのデプロイ・環境変数設定の実践

## 🌱 Future Plans / 今後の拡張

 Micropost（つぶやき投稿）機能

 コメント / いいね機能

 プロフィール編集機能

 PostgreSQLへの本番DB移行

 簡易テスト（RSpec / Minitest）導入

## 👤 Author

Hina
Independent developer focused on efficient learning & continuous growth.
📎 GitHub Profile

## 📝 License

MIT License


---
