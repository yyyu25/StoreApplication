🛍️ StoreApplication

StoreApplication is a full-stack Ruby on Rails e-commerce platform that supports user authentication, product browsing, shopping cart management, and order processing.
The system includes role-based access control with separate privileges for admin and shopper users.

✨ Features
👤 User Authentication

User signup, login, and logout

Secure password hashing using bcrypt

Session-based authentication

Different behaviors based on user role (admin vs regular user)

🛒 Storefront (Shopper Features)

View all products

View individual product details

Add items to cart

Update item quantity in cart

Remove items from cart

Persistent cart based on logged-in user

Place orders from the cart

🧾 Orders

Create an order with all current cart items

Store order items with quantities and product information

Prevent deletion of products that already appear in orders

👩‍💼 Admin Panel

Admins can:

Create new products

Edit existing products

Delete products (with safety check — cannot delete products in carts or orders)

🔒 Role-Based Access

Admin: full access to product management

Shopper: can browse and purchase only

Unauthorized users are redirected with alerts/notices

🧱 No API / No Test Suite

The app is built entirely with Rails MVC (no JSON API mode)

No automated test suite yet

🛠️ Tech Stack
Component	Technology
Backend Framework	Ruby on Rails
Language	Ruby
Authentication	bcrypt + Rails sessions
Database	SQLite3 (development) or your configured DB
Views	ERB (Embedded Ruby Templates)
Assets	HTML / CSS / JS
🚀 Getting Started
1️⃣ Clone the Repository
git clone https://github.com/yyyu25/StoreApplication.git
cd StoreApplication

2️⃣ Install Dependencies
gem install bundler
bundle install

3️⃣ Set Up the Database
rails db:create
rails db:migrate
rails db:seed   # If seeds are provided

4️⃣ Start the Application
rails server


Open your browser at:
👉 http://localhost:3000

📁 Project Structure
app/
  controllers/   # Authentication, products, cart, orders, admin controllers
  models/        # User, Product, Cart, CartItem, Order, OrderItem
  views/         # ERB templates for all pages
config/
  routes.rb      # Full routing configuration
db/
  migrate/       # Database schema migrations
Gemfile          # Gem dependencies
README.md

🔗 Key Routes (Examples)
Route	Method	Description
/login	GET / POST	User login
/signup	GET / POST	User registration
/shopper	GET	Shopper storefront
/products	GET	Admin + Shopper product list
/products/new	GET	Admin: create product
/cartitems	POST	Add to cart
/cartitems/:id	PATCH	Update cart item quantity
/cartitems/:id	DELETE	Remove from cart
/orders	POST	Create order

These can be updated exactly once you send routes.rb, but the above reflects your described features.

📝 Important Behaviors
Prevent deleting products that are still in use

If a product is referenced in:

any cart items

any order items

it cannot be deleted.
Instead, the app redirects with an alert message.

Cart behavior

Each user has their own cart

Adding an already-existing product increases quantity

Quantity can be adjusted via form select

Delete links use Rails UJS to send DELETE requests

🚫 Not Included

No API endpoints (no JSON controllers)

No backend test suite yet

No frontend framework (uses ERB)

🤝 Contributing

Fork the project

Create a feature branch

Commit your changes

Open a pull request

📄 License

MIT License (or update if you prefer another license).

📬 Contact

Created by yyyu25
GitHub: https://github.com/yyyu25
