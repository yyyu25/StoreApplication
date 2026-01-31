# StoreApplication

StoreApplication is a course final project built with Ruby on Rails, implementing a complete e-commerce workflow from user authentication to order processing and administrative product management.

The application is designed to practice full-stack web application development using the Rails MVC architecture, with a focus on real-world business logic such as carts, orders, role-based access control, and data integrity constraints.

---

## Project Overview

This project demonstrates how core Rails components work together to support an end-to-end shopping experience, including authentication, authorization, relational data modeling, and controller-driven workflows.

---

## Key Features

### User Authentication
- User signup, login, and logout
- Secure password hashing using bcrypt
- Session-based authentication
- Role-based behavior for admin and shopper users

### Storefront (Shopper Features)
- Browse all products and view product details
- Add products to a shopping cart
- Update item quantities or remove items from the cart
- Persistent cart associated with the logged-in user
- Place orders directly from the cart

### Order Processing
- Create orders containing all current cart items
- Store order items with product snapshots and quantities
- Enforce data integrity by preventing deletion of products that appear in existing orders

### Admin Panel
Administrators can:
- Create, edit, and manage products
- Delete products with safety checks:
  - Products cannot be deleted if they exist in any cart or order

### Role-Based Access Control
- Admin users: full access to product management
- Shopper users: browsing and purchasing only
- Unauthorized access attempts are redirected with alerts or notices

---

## Tech Stack

Backend Framework: Ruby on Rails  
Language: Ruby  
Authentication: bcrypt + Rails sessions  
Database: SQLite3  
Views: ERB (Embedded Ruby Templates)  
Assets: HTML / CSS / JavaScript  
Architecture: MVC (Model–View–Controller)

---

## Application Design

The application follows standard Rails MVC conventions:

- Models encapsulate business logic and relational data
- Controllers handle request routing, authentication, and authorization
- Views render dynamic pages using ERB templates

Core domain models include:
- User (with role-based permissions)
- Product
- Cart / CartItem
- Order / OrderItem

Special attention is given to data consistency, such as preventing deletion of products that are still referenced by carts or orders.

---

## Getting Started

### Clone the Repository
git clone https://github.com/yyyu25/StoreApplication.git  
cd StoreApplication

### Install Dependencies
gem install bundler  
bundle install

### Set Up the Database
rails db:create  
rails db:migrate  
rails db:seed   (if seeds are provided)

### Start the Server
rails server

Open your browser at:  
http://localhost:3000

---

## Example Routes

/signup            GET / POST   User registration  
/login             GET / POST   User login  
/products          GET          Product listing  
/products/new      GET          Admin: create product  
/cartitems         POST         Add item to cart  
/cartitems/:id     PATCH        Update cart item quantity  
/cartitems/:id     DELETE       Remove item from cart  
/orders            POST         Create order  

---

## Notable Behaviors

Safe deletion rules:
- Products cannot be deleted if they appear in any cart items
- Products cannot be deleted if they appear in any order items

Cart logic:
- Each user has a dedicated cart
- Adding an existing product increases quantity
- Quantities can be adjusted through form controls
- Delete actions use Rails UJS to send DELETE requests

---

## Not Included

- No JSON API endpoints (server-rendered MVC application)
- No automated test suite yet
- No frontend framework (ERB-based views)

---

## Learning Outcomes

This project provided hands-on experience with:
- Building a full-stack Rails application from scratch
- Implementing authentication and role-based authorization
- Modeling relational data with ActiveRecord
- Designing end-to-end workflows (cart to order)
- Enforcing business rules and data integrity constraints

---

## Possible Improvements

Future enhancements could include:
- Replacing SQLite with PostgreSQL for production use
- Adding automated tests (RSpec)
- Introducing payment processing
- Improving UI/UX and frontend interactivity
- Adding background jobs for order-related tasks

---

## License

MIT License

---

## Contact

Created by yyyu25  
GitHub: https://github.com/yyyu25
